/etc/hosts
192.168.33.10 scotchbox.local

php bin/console series:import


mysqldump serienreminder > serienreminder.sql


cd Sites;
cd mein-serienreminder;
vagrant destroy;
cd ..;
rm -rf mein-serienreminder;
git clone git@github.com:schuetz1/serienreminder.git mein-serienreminder;
cd mein-serienreminder;
vagrant up;