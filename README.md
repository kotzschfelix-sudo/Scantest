# Barcode-Generator

Eigenständiger Barcode-Generator für das Veranstaltungstechnik-Lager an der Schule.

## Aktueller Stand

- Erzeugt echte Code-128-Barcodes aus eingegebenen Kennungen
- Vorschau im Browser
- Druckfunktion für Etiketten
- Keine Anmeldung und noch keine Datenbank

## Geplanter Einsatz

1. Eine Kennung für ein Gerät eingeben und den Barcode erzeugen.
2. Barcode ausdrucken und am Gerät oder Case befestigen.
3. Mit einem USB- oder Bluetooth-Barcodescanner einlesen.
4. Die spätere Software auf einem Raspberry Pi verarbeitet die gelesene Kennung und sucht den passenden Lagerartikel.

## Technischer Hinweis

Die Seite lädt JsBarcode 3.11.6 über jsDelivr. Zum Erzeugen der Barcodes ist daher derzeit eine Internetverbindung erforderlich. Die Lagerdatenbank und Raspberry-Pi-Anbindung sind noch nicht enthalten.
