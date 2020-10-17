# directadmin-conf

Direct Admin Auto Install

## Prepare

```bash
export CID=`YOUR_CLIENT_ID`
export LID=`YOUR_LICENSE_ID`
export LIP=`YOUR_LICENSE_IP`
export NETDEV=`YOUR_ETHERNET_DEVICE`
export SMTP_USER=`YOUR_SMTP_USER`
export SMTP_PASS=`YOUR_SMTP_PASS`
export SMTP_HOST=`YOUR_SMTP_HOST`
export SMTP_PORT=`YOUR_SMTP_PORT`
echo "YOUR_NS1" > /root/.ns1.txt
echo "YOUR_NS2" > /root/.ns2.txt
```

## Default Option

```bash
curl https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/install-default.sh | sh
```

## CloudLinux Option

```bash
curl https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/install-cln.sh | sh
```
