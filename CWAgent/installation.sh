#yum update -y
yum install -y rpm
rpm -ivh https://s3.amazonaws.com/amazoncloudwatch-agent/amazon_linux/amd64/latest/amazon-cloudwatch-agent.rpm
yum install -y collectd
cd /opt/aws/amazon-cloudwatch-agent/bin/
curl "https://raw.githubusercontent.com/Nava-JoshLong/ConfigFiles/main/CWAgent/config.json" -o "config.json"
./amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:config.json -s
./amazon-cloudwatch-agent-ctl -a stop
./amazon-cloudwatch-agent-ctl -a start
