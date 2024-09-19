#
https://thiagoalves.ai/how-to-add-a-self-signed-ssl-certificate-to-aws-certificate-manager/
#
https://learncloudnative.com/blog/2019-12-04-setup_ssl_certs_with_istio_gateway_part_i
#root cert
ctv1.in.crt
#private key for signing cert
ctv1.in.key
#create private key
openssl req -out eksv1.$DOMAIN_NAME.csr -newkey rsa:2048 -nodes -keyout eksv1.$DOMAIN_NAME.key -subj "/CN=eksv1.$DOMAIN_NAME/O=aws eksv1 $DOMAIN_NAME"
#
eksv1.ctv1.in.key
#
eksv1.ctv1.in.csr
#create cert
openssl x509 -req -days 365 -CA $DOMAIN_NAME.crt -CAkey $DOMAIN_NAME.key -set_serial 0 -in eksv1.$DOMAIN_NAME.csr -out eksv1.$DOMAIN_NAME.crt
#
eksv1.ctv1.in.crt
#This crt/key is not supported in AWS ACM
aws acm import-certificate --certificate fileb://eksv1.ctv1.in.crt --private-key fileb://eksv1.ctv1.in.key --region us-east-1
