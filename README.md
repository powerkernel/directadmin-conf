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

## CentOS 7, 8 Default Option

```bash
curl https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/install-default.sh | sh
```

## CloudLinux Option

```bash
curl https://raw.githubusercontent.com/powerkernel/directadmin-conf/main/install-cln.sh | sh
```

## MISC

Open ports for AWS Lightsail

```bash
export INSTANCE=YOUR_INSTANCE_NAME
export REGION=YOUR_AWS_REGION

aws lightsail open-instance-public-ports \
    --instance-name $INSTANCE \
    --port-info fromPort=21,protocol=TCP,toPort=21 \
    --region $REGION
aws lightsail open-instance-public-ports \
    --instance-name $INSTANCE \
    --port-info fromPort=25,protocol=TCP,toPort=25 \
    --region $REGION
aws lightsail open-instance-public-ports \
    --instance-name $INSTANCE \
    --port-info fromPort=53,protocol=TCP,toPort=53 \
    --region $REGION
aws lightsail open-instance-public-ports \
    --instance-name $INSTANCE \
    --port-info fromPort=53,protocol=UDP,toPort=53 \
    --region $REGION
aws lightsail open-instance-public-ports \
    --instance-name $INSTANCE \
    --port-info fromPort=110,protocol=TCP,toPort=110 \
    --region $REGION
aws lightsail open-instance-public-ports \
    --instance-name $INSTANCE \
    --port-info fromPort=143,protocol=TCP,toPort=143 \
    --region $REGION
aws lightsail open-instance-public-ports \
    --instance-name $INSTANCE \
    --port-info fromPort=443,protocol=TCP,toPort=443 \
    --region $REGION
aws lightsail open-instance-public-ports \
    --instance-name $INSTANCE \
    --port-info fromPort=465,protocol=TCP,toPort=465 \
    --region $REGION
aws lightsail open-instance-public-ports \
    --instance-name $INSTANCE \
    --port-info fromPort=587,protocol=TCP,toPort=587 \
    --region $REGION
aws lightsail open-instance-public-ports \
    --instance-name $INSTANCE \
    --port-info fromPort=993,protocol=TCP,toPort=993 \
    --region $REGION
aws lightsail open-instance-public-ports \
    --instance-name $INSTANCE \
    --port-info fromPort=995,protocol=TCP,toPort=995 \
    --region $REGION
aws lightsail open-instance-public-ports \
    --instance-name $INSTANCE \
    --port-info fromPort=2222,protocol=TCP,toPort=2222 \
    --region $REGION
aws lightsail open-instance-public-ports \
    --instance-name $INSTANCE \
    --port-info fromPort=35000,protocol=TCP,toPort=35999 \
    --region $REGION
```
