FROM python:3.10-slim

# Evitar preguntas interactivas
ENV DEBIAN_FRONTEND=noninteractive

# Instala dependencias del sistema necesarias
RUN apt-get update && apt-get install -y \
    git \
    gcc \
    g++ \
    libxml2-dev \
    libxslt-dev \
    libldap2-dev \
    libsasl2-dev \
    libpq-dev \
    libjpeg-dev \
    libffi-dev \
    libssl-dev \
    libjpeg8-dev \
    liblcms2-dev \
    libblas-dev \
    libatlas-base-dev \
    libwebp-dev \
    libtiff-dev \
    libopenjp2-7-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libxcb1-dev \
    zlib1g-dev \
    libmagic1 \
    build-essential \
    libfreetype6-dev \
    libpng-dev \
    python3-dev \
    python3-pip \
    && apt-get clean

# Crear directorio para Odoo
RUN mkdir /odoo
WORKDIR /odoo

# Copiar requerimientos y código fuente
COPY requirements.txt /odoo/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . /odoo/

# Puerto expuesto
EXPOSE 8069

# Comando para correr Odoo
CMD ["python3", "odoo-bin"]
