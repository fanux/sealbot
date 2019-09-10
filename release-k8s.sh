#!/bin/bash
# release-k8s.sh 1.14.4 47.52.232.231 
# 47.52.232.231 is remote pkg server
scp -i ./k8s-saver.pem root@$2:/tmp/kube$1.tar.gz .
md5=$(md5sum kube$1.tar.gz | awk  '{print $1}')
echo $md5
./ossutil64 cp kube$1.tar.gz oss://sealyun/$md5-$1/kube$1.tar.gz
echo oss://sealyun/$md5-$1/kube$1.tar.gz

name=kubernetes$1
url=https://sealyun.oss-cn-beijing.aliyuncs.com/$md5-$1/kube$1.tar.gz
# mysql -uroot -pFanux#123 -Dstore -h 127.0.0.1 < insert into product(product_name,product_u_r_l,product_price,product_divide) values('$name','$url',50,0.6);
echo "insert into product(product_name,product_u_r_l,product_price,product_divide) values('$name','$url',50,0.6);" > insert.sql
mysql -uroot -pFaaanu#t3 -Dstore -h 127.0.0.1 < insert.sql
