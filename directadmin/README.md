# INSTALLATION

## Install CLX

yum install wget -y
wget <https://repo.cloudlinux.com/cloudlinux/sources/cln/cldeploy>
sh cldeploy -k CL-ZriXBMbrAdWPnCmymqTlegeo

## Install DA

```bash
mkdir -p /usr/local/directadmin/custombuild
wget -O /usr/local/directadmin/custombuild/options.conf https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/directadmin/custombuild/options.conf
wget -O /usr/local/directadmin/custombuild/php_extensions.conf https://raw.githubusercontent.com/powerkernel/directadmin-conf/directadmin/custombuild/php_extensions.conf
```

```bash
export DA_HOSTNAME=$(hostname -f)
export DA_EMAIL=admin@$(hostname -f)
export DA_NS1=ns0.hostcp.xyz
export DA_NS2=ns1.hostcp.xyz
bash <(curl -LSs <https://download.directadmin.com/setup.sh> || curl -LSs <https://download-alt.directadmin.com/setup.sh>) 'Provided license key should go here'
```
