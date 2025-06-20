import os

workers = 4
worker_class = 'gevent'
bind = '0.0.0.0:' + str(os.environ.get("PORT", "5000"))
timeout = 120
keepalive = 5