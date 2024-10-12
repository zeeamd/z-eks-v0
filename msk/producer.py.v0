import json
from kafka import KafkaProducer
from kafka.errors import KafkaError
from aws_msk_iam_sasl_signer import MSKAuthTokenProvider

r = 'us-east-1'
bs = ['boot-9vnhxufq.c1.kafka-serverless.us-east-1.amazonaws.com:9098']
msg = {"k0": "v0"}

class MSKTokenProvider():
    def token(self):
        token, _ = MSKAuthTokenProvider.generate_auth_token(r)
        return token

tp = MSKTokenProvider()

kp = KafkaProducer(security_protocol='SASL_SSL',
                   bootstrap_servers=bs,
                   sasl_mechanism='OAUTHBEARER',
                   sasl_oauth_token_provider=tp
                   )

c = 1
#while True:
while c<2:
    try:
        #inp=input(">")
        #kp.send("zt0", inp.encode())
        kp.send('zt0',json.dumps(msg).encode('utf-8'))
        kp.flush()
        print('Produced!')
        c = c+1
    except Exception:
        print('Failed to send message:', e)

kp.close()
