FROM python:3.10

RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    libxslt-dev \
    libzip-dev \
    libldap2-dev \
    libsasl2-dev \
    libjpeg-dev \
    libpq-dev \
    libffi-dev \
    libssl-dev \
    python3-dev \
    zlib1g-dev \
    node-less \
    npm

RUN npm install -g rtlcss

WORKDIR /odoo
COPY . .

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

EXPOSE 8069

CMD ["python3", "odoo-bin", "-c", "odoo.conf"]
