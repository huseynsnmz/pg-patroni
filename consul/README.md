# haproxy için ve pgbouncer için servis ekle consul'a
# tag ekle yukarıdakileri için
# acl muhabbetini yap
# consul-template oluştur haproxy ve pgbouncer için





pip install patroni[consul]

CONSUL SUNUCUSU:
yum install wget unzip -y
cd /usr/local/src
wget https://releases.hashicorp.com/consul/1.4.2/consul_1.4.2_linux_amd64.zip
unzip consul_1.4.2_linux_amd64.zip
mkdir -p /etc/consul.d/scripts
mkdir -p /var/lib/consul/
mkdir -p /var/log/consul/

consul keygen


vi /etc/consul.d/config.json


Copy the following config to the file. Replace encrypt value with the secret created in step 4 and start_join IP’s with your server IP’s.

{
    "advertise_addr": "138.68.137.54",
    "bind_addr": "138.68.137.54",
    "bootstrap_expect": 1,
    "client_addr": "0.0.0.0",
    "datacenter": "Test-Consul",
    "data_dir": "/var/lib/consul",
    "domain": "consul",
    "enable_script_checks": true,
    "dns_config": {
        "enable_truncate": true,
        "only_passing": true
    },
    "enable_syslog": true,
    "leave_on_terminate": true,
    "log_level": "INFO",
    "rejoin_after_leave": true,
    "server": true,
    "ui": true
}



consul members

http://138.68.137.54:8500/ui


POSTGRESQL SUNUCULARINDA

pip install patroni[consul]
vi /etc/patroni/patroni.yml

consul:
  host: 138.68.137.54:8500
  register_service: true