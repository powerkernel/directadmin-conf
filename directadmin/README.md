# INSTALLATION

## Install CLX

yum install wget -y
wget <https://repo.cloudlinux.com/cloudlinux/sources/cln/cldeploy>
sh cldeploy -k CL-ZriXBMbrAdWPnCmymqTlegeo

## Install DA

```bash
mkdir -p /usr/local/directadmin/custombuild
wget -O /usr/local/directadmin/custombuild/options.conf https://raw.githubusercontent.com/powerkernel/directadmin-conf/cloudlinux/directadmin/custombuild/options.conf
wget -O /usr/local/directadmin/custombuild/php_extensions.conf https://raw.githubusercontent.com/powerkernel/directadmin-conf/cloudlinux/directadmin/custombuild/php_extensions.conf
```

```bash
export DA_HOSTNAME=$(hostname -f)
export DA_EMAIL=admin@$(hostname -f)
export DA_NS1=ns0.hostcp.xyz
export DA_NS2=ns1.hostcp.xyz
wget -O setup.sh https://download.directadmin.com/setup.sh
chmod 755 setup.sh
./setup.sh $LICENSE_KEY
```

## Configuration

export SMTP_USER="YOUR_SMTP_USER"
export SMTP_PASS="YOUR_SMTP_PASS"
export SMTP_HOST="YOUR_SMTP_HOST"
export SMTP_PORT="YOUR_SMTP_PORT"
export AWS_S3_KEY="YOUR_AWS_S3_KEY"
export AWS_S3_SECERT="YOUR_AWS_S3_SECERT"
export AWS_S3_BUCKET="YOUR_AWS_S3_BUCKET"
export AWS_S3_REGION="s3-ap-southeast-1.amazonaws.com"

Wait for DA installation and AutoSSL configuration to be completed

- CloudLinux Widzard
- Update LVE settings
- config.sh
- Configure IPv6
  Add IPv6/128, View IPv4, link IPv6 to IPv4 (Check all)
- Install ImunifyAV
  wget https://repo.imunify360.cloudlinux.com/defence360/imav-deploy.sh -O imav-deploy.sh
  bash imav-deploy.sh
- Config ImunifyAV
