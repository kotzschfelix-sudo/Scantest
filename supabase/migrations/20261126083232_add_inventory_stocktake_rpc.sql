create or replace function public.apply_inventory_stocktake(
  p_counts jsonb,
  p_note text default null
)
returns integer
language plpgsql
security definer
set search_path = ''
as $function$
declare
  v_entry jsonb;
  v_item_id uuid;
  v_counted numeric;
  v_item public.inventory_items%rowtype;
  v_difference numeric;
  v_changed integer := 0;
  v_total integer;
  v_unique integer;
  v_note text;
begin
  if (select auth.uid()) is null then
    raise exception 'Anmeldung erforderlich';
  end if;
  if not private.inventory_user_has_role(array['admin','manager']) then
    raise exception 'Nur Admins und die Lagerleitung dürfen eine Inventur abschließen';
  end if;
  if p_counts is null or jsonb_typeof(p_counts) <> 'array' then
    raise exception 'Ungültige Inventurdaten';
  end if;
  select count(*), count(distinct value->>'item_id')
    into v_total, v_unique
  from jsonb_array_elements(p_counts);
  if v_total = 0 or v_total > 10000 then
    raise exception 'Die Inventur muss zwischen 1 und 10000 Artikeln enthalten';
  end if;
  if v_total <> v_unique then
    raise exception 'Ein Artikel ist mehrfach in der Inventur enthalten';
  end if;

  v_note := 'Inventur' || case
    when nullif(trim(coalesce(p_note, '')), '') is null then ''
    else ': ' || left(trim(p_note), 180)
  end;

  for v_entry in select value from jsonb_array_elements(p_counts)
  loop
    if jsonb_typeof(v_entry) <> 'object'
       or coalesce(v_entry->>'item_id', '') = ''
       or coalesce(v_entry->>'counted', '') !~ '^[0-9]+(\.[0-9]+)?$' then
      raise exception 'Ungültige Artikelmenge in der Inventur';
    end if;

    v_item_id := (v_entry->>'item_id')::uuid;
    v_counted := (v_entry->>'counted')::numeric;
    if v_counted < 0 or v_counted > 1000000000 then
      raise exception 'Gezählte Menge liegt außerhalb des erlaubten Bereichs';
    end if;

    select * into v_item
    from public.inventory_items
    where id = v_item_id and archived_at is null
    for update;

    if not found then
      raise exception 'Ein Inventurartikel wurde gelöscht oder archiviert. Bitte Daten neu laden.';
    end if;

    v_difference := v_counted - v_item.quantity;
    if v_difference <> 0 then
      update public.inventory_items
      set quantity = v_counted, updated_at = now()
      where id = v_item_id;

      insert into public.inventory_movements (
        item_id, movement_type, quantity, from_location_id,
        to_location_id, note, created_by
      ) values (
        v_item_id, 'adjustment', abs(v_difference), v_item.location_id,
        v_item.location_id, v_note, (select auth.uid())
      );
      v_changed := v_changed + 1;
    end if;
  end loop;

  return v_changed;
end;
$function$;

revoke execute on function public.apply_inventory_stocktake(jsonb, text) from public;
revoke execute on function public.apply_inventory_stocktake(jsonb, text) from anon;
grant execute on function public.apply_inventory_stocktake(jsonb, text) to authenticated;
