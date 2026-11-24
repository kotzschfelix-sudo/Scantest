# Raspberry Pi & USB-Scanner – Schullager

Die Schullager-Website ist als installierbare Browser-App vorbereitet. Das folgende Vorgehen ist eine allgemeine Vorbereitung; der konkrete Raspberry-Pi-Aufbau wurde noch nicht getestet.

## Voraussetzungen
- Raspberry Pi mit aktuellem Raspberry Pi OS
- Chromium
- Internetverbindung zum Supabase-Projekt
- USB-Barcode-Scanner, der als Tastatur (USB-HID/Keyboard) arbeitet
- Bildschirm und Tastatur zur Ersteinrichtung

## Einrichten
1. Raspberry Pi starten und Chromium öffnen.
2. `https://kotzschfelix-sudo.github.io/Scantest/` öffnen.
3. Über das Chromium-Menü die Seite als App installieren, sofern die Option angezeigt wird.
4. Mit dem freigegebenen Schullager-Konto anmelden.
5. Unter **Scanner & Barcodes** auf **Scanner-Feld aktivieren** klicken.
6. Einen vorhandenen Barcode scannen. Der Scanner sollte den Code wie Tastatureingaben senden und danach Enter auslösen.
7. Prüfen, ob der richtige Artikel gefunden wird.

## Kamera oder USB?
- Der USB-Scanner benötigt normalerweise keine Kameraberechtigung; er gibt den Barcode als Tastatureingabe ein.
- Für die Kamera muss Chromium die Kameraberechtigung erhalten. Die Website verwendet HTTPS.
- Scanner, die im seriellen Modus statt im Tastaturmodus arbeiten, funktionieren mit dem normalen Eingabefeld nicht ohne zusätzliche Integration.

## Betrieb
- Den Pi mit dem Netzwerk verbinden und Chromium geöffnet lassen.
- Für einen festen Lagerplatz kann die App im Vollbild/Kiosk-Modus gestartet werden. Die Einrichtung des Kiosk-Modus sollte mit der schulischen IT bzw. einer verantwortlichen Lehrkraft abgestimmt werden.
- Vor dem ersten echten Einsatz mehrere Testartikel und Testausleihen verwenden.

## Grenzen der aktuellen Version
- Die App verbindet sich live mit Supabase; bei Internetausfall sind keine neuen Buchungen möglich.
- Der Cache hält nur die App-Oberfläche vor, nicht den aktuellen Lagerbestand.
- Ein konkretes Pi-Modell, der Scanner und die Bildschirmauflösung wurden nicht getestet.
- Für den tatsächlichen Schuleinsatz sollten Benutzerfreigaben, Datenschutz, Datensicherung und Zuständigkeiten mit der Schule abgestimmt werden.
