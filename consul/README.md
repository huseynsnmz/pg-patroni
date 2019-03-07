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
