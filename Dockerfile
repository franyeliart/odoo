FROM python:3.10-slim

# Evita preguntas interactivas durante la instalación
ENV DEBIAN_FRONTEND=noninteractive

# Instala herramientas del sistema y dependencias de compilación
RUN apt-get update && apt-get install -y \
    git \
    gcc \
    g++ \
    curl \
    ca-certificates \
    build-essential \
    libxml2-dev \
    libxslt-dev \
    libldap2-dev \
    libsasl2-dev \
    libpq-dev \
    libjpeg62-turbo-dev \
    libffi-dev \
    libssl-dev \
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
    libfreetype6-dev \
    libpng-dev \
    python3-dev \
    python3-pip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copia e instala dependencias de Python
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
