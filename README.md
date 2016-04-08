/etc/hosts
192.168.33.10 scotchbox.local

php bin/console series:import

php bin/console series:notify

mysqldump serienreminder > serienreminder.sql



Serienreminder, bei dem der Nutzer sich über einen Registrations Bereich anmelden kann und dann auf ein Dashboard gelangt.
Auf dem Dashboard kann er sich die Serien der letzten 2 Wochen anzeigen.
Sollte ihn eine Serie besonders interessieren, kann er sich über die "Meine-Serien" für eine Serie
eintragen und wird dann per Email benachrichtigt, sobald eine neue Serie erscheint.


Installation für den Dozenten:
composer install
Im Browser öffnen:

localhost:8000/app_dev.php