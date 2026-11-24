# Scan Test

Kleine, eigenständige Test-Webseite zum Erfassen von Barcodes mit der Handykamera.

## Aktueller Stand

- Kamera-Scanner im Browser mit html5-qrcode
- Zeigt den erkannten Barcode-Text direkt auf der Seite an
- Keine Anmeldung und keine Datenbank
- Noch keine Speicherung von Scans

## Lokal testen

Die Seite benötigt eine sichere Browser-Umgebung für den Kamerazugriff. Lokal kann sie über `localhost` getestet werden; online muss sie über HTTPS bereitgestellt werden.

## Bibliothek

Die Seite lädt html5-qrcode 2.3.8 über jsDelivr/unpkg CDN. Für den Betrieb ist eine Internetverbindung erforderlich.
