#!/bin/bash

### Shell script that will modify/update an aws security group and open the specific port/all port for a list of IP.

cidrtxt="/home/ec2-user/cidrlist.txt"
ips=`cat $cidrtxt | awk '{print $1}'`
for item in $ips
do
aws ec2 authorize-security-group-ingress --group-id sg-09974598bd0 --ip-permissions IpProtocol=tcp,FromPort=22,ToPort=22,IpRanges="[{CidrIp=$item}]"
done

# modifyawssg
