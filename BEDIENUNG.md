# Schullager – Kurzanleitung

## Artikel verwalten
1. Im Bereich **Lagerorte** zuerst Räume, Schränke, Regale oder Fächer anlegen.
2. Unter **Artikel** einen Artikel mit Bezeichnung und eindeutiger Barcode-Kennung speichern.
3. Kategorien, Zustand, Hersteller, Modell und Mindestbestand ergänzen.
4. Artikel über **Bearbeiten** ändern. Die Bestandsmenge wird absichtlich nicht direkt überschrieben, sondern über eine Lagerbewegung angepasst.
5. Nicht mehr verwendete Datensätze über **Archivieren** aus dem aktiven Bestand nehmen. Die Bewegungs- und Ausleihhistorie bleibt erhalten.

## Barcodes und Etiketten
- Der Generator erstellt Code-128-Barcodes.
- Ein einzelnes Etikett lässt sich direkt an einem Artikel drucken.
- Für Sammeldruck mehrere Artikel links in der Bestandsliste markieren und **Etiketten drucken** wählen.
- Vor dem Drucken prüfen, ob der Barcode auf dem Etikett mit der Kennung im Artikel übereinstimmt.

## Scanner
- **Kamera:** Im Bereich „Scanner & Barcodes“ die Kamera starten und die Browser-Berechtigung erteilen.
- **USB-Scanner:** Der Scanner muss als Tastatur (USB-HID/Keyboard) arbeiten. Auf das Eingabefeld klicken bzw. **Scanner-Feld aktivieren** wählen. Der Scanner sollte nach dem Barcode die Enter-Taste senden.
- Die Website wird über HTTPS bereitgestellt; das ist auch für den Kamerazugriff wichtig.

## Ausleihen und Rückgaben
1. Beim Artikel **Ausleihen** wählen.
2. Empfänger oder verantwortliche Person, Menge und optional Klasse/Gruppe sowie Rückgabedatum eintragen.
3. Die Ausleihe bucht den Bestand automatisch aus.
4. In **Ausleihen** die Rückgabe erfassen. Teilrückgaben sind möglich; erst nach vollständiger Rückgabe wird der Vorgang als abgeschlossen markiert.

## Benutzerrollen
- **Admin:** volle Verwaltung einschließlich Benutzerrollen.
- **Lagerleitung:** Artikel, Lagerorte, Kategorien, Bewegungen und Archivierung verwalten.
- **Helfer:** Artikel pflegen und Lagerbewegungen bzw. Ausleihen buchen.
- **Nur lesen:** Bestand und Historie ansehen.
- **Wartet auf Freigabe:** neu registrierte Konten erhalten zunächst keinen Zugriff auf Lagerdaten.

Das erste bereits vorhandene Konto wurde als Admin eingerichtet. Weitere Konten werden im Bereich **Benutzer** vom Admin freigeschaltet.

## Raspberry Pi
1. Raspberry Pi mit einem aktuellen Raspberry Pi OS und Chromium starten.
2. Den Schullager-Link in Chromium über HTTPS öffnen und anmelden.
3. Über das Chromium-Menü **App installieren** bzw. **Seite als App installieren** wählen (Bezeichnung kann je nach Chromium-Version abweichen).
4. USB-Scanner anschließen und prüfen, dass er als Tastatureingabe erkannt wird und Enter nach dem Barcode sendet.
5. Für den gemeinsamen Bestand braucht der Pi Internetzugang, da die Daten in Supabase liegen.

**Wichtig:** Der Service Worker speichert nur die App-Hülle. Bestand, Anmeldungen und Buchungen benötigen weiterhin eine Internetverbindung. Vollständige Offline-Lagerverwaltung und automatisches Synchronisieren sind noch nicht eingebaut. Der Raspberry Pi selbst wurde noch nicht eingerichtet oder getestet.
