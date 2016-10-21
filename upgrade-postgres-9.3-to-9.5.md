debian 7-8

upgrade from 9.3 to 9.5 

service postgresql stop 9.3
service postgresql stop 9.1

su postgres

/usr/lib/postgresql/9.5/bin/pg_upgrade -b /usr/lib/postgresql/9.3/bin/ -B /usr/lib/postgresql/9.5/bin/ -d /var/lib/postgresql/9.3/main -D /var/lib/postgresql/9.5/main -o ' -c config_file=/etc/postgresql/9.3/main/postgresql.conf' -O ' -c config_file=/etc/postgresql/9.5/main/postgresql.conf'

delete_old_cluster.sh
analyze_new_cluster.sh
