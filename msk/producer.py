import json
from kafka import KafkaProducer
from kafka.errors import KafkaError
from aws_msk_iam_sasl_signer import MSKAuthTokenProvider

r = 'us-east-1'
bs = ['boot-9vnhxufq.c1.kafka-serverless.us-east-1.amazonaws.com:9098']
t = 'zt0'
file = 'data'

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

try:
    with open(file) as f:
        for l in f:
            kp.send(t,json.dumps(l.strip()).encode('utf-8'))
            #kp.send(t,json.dumps(l).encode('utf-8'))
except Exception:
    print('Failed to send message:', e)

kp.close()
