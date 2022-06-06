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
  SPEED: 100%
  SPEED MYSQL: 400%
  VMEN: 0
  PMEM: 2G
  IO: 2.5MB/s
  MySQL IO: 20MB/s
  IOPS: 1024
  EP: 30
  NPROC: 100
  INODES soft/hard: 0
- config.sh
- Configure IPv6
  Add IPv6/128, View IPv4, link IPv6 to IPv4 (Check all)
- Install ImunifyAV
  wget https://repo.imunify360.cloudlinux.com/defence360/imav-deploy.sh -O imav-deploy.sh
  bash imav-deploy.sh
- Config ImunifyAV
  Only notify for Custom scan start & malware detected
- Crontab Imunify: `0 3 * * * /usr/bin/imunify360-agent malware user scan`
- Config CSF:
  - PT_USERMEM = 1024
- Config CSF Ignore: (/etc/csf/csf.pignore)
  - exe:/usr/sbin/rngd
  - exe:/usr/sbin/imunify-notifier
- Config auto backup: use ftp 127.0.0.1 (or pay for $$$ S3 calls)
- Disable skins

  ```bash
  touch /usr/local/directadmin/data/skins/enhanced/.disabled
  touch /usr/local/directadmin/data/skins/power_user/.disabled
  ```
