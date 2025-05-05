FROM python:3.10-slim

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
    # Soporte para imágenes JPEG
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
    build-essential \
    libfreetype6-dev \
    libpng-dev \
    python3-dev \
    python3-pip \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Instala dependencias de Python necesarias
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copia el resto de la app (si no lo haces más abajo)
COPY . .

# Comando final (puedes ajustarlo según lo que uses)
CMD ["odoo", "-c", "/app/odoo.conf"]
