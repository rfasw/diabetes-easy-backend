apt-get update && apt-get install -y python3.9 python3.9-dev && \
update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1 && \
update-alternatives --set python3 /usr/bin/python3.9 && \
pip install poetry && \
poetry install --no-dev