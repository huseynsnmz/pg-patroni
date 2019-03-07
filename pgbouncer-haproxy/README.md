--------------------------------------------------
CONSUL-TEMPLATE
--------------------------------------------------
wget https://releases.hashicorp.com/consul-template/0.20.0/consul-template_0.20.0_linux_amd64.zip
unzip consul-template_0.20.0_linux_amd64.zip
mv consul-template /usr/bin/
mkdir /etc/consul-template.d

--------------------------------------------------
PGBOUNCER
--------------------------------------------------

yum install https://download.postgresql.org/pub/repos/yum/11/redhat/rhel-7-x86_64/pgdg-centos11-11-2.noarch.rpm -y
yum install postgresql11-server postgresql11-contrib pgbouncer -y


Primary Sunucuda:
SET password_encryption = ‘md5’;
CREATE ROLE pgbouncer WITH ENCRYPTED PASSWORD 'parola' LOGIN;


/etc/pgbouncer/pgbouncer.ini

[databases]
primary = host=127.0.0.1 port=5000 dbname=postgres
standby = host=127.0.0.1 port=5001 dbname=postgres

[pgbouncer]
listen_addr = *
listen_port = 6432
auth_type = md5
auth_file = /etc/pgbouncer/userlist.txt
admin_users = pgbouncer
stats_users = postgres


touch 600 /etc/pgbouncer/userlist.txt
"pgbouncer" "md54d741ae1fe41383e8f4a47eaf5c4c542"


systemctl enable --now pgbouncer.service

--------------------------------------------------
HAPROXY
--------------------------------------------------

yum install haproxy -y
systemctl enable --now haproxy
--------------------------------------------------
CONSUL
--------------------------------------------------
# acl muhabbetini yap

CONSUL SUNUCUSU:
yum install wget unzip -y
cd /usr/local/src
wget https://releases.hashicorp.com/consul/1.4.2/consul_1.4.2_linux_amd64.zip
unzip consul_1.4.2_linux_amd64.zip
mkdir -p /etc/consul.d/scripts
mkdir -p /var/lib/consul/
mkdir -p /var/log/consul/

consul keygen
consul members

http://138.68.133.92:8500/ui


POSTGRESQL SUNUCULARINDA

pip install patroni[consul]
