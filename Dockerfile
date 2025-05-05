# Usar una imagen base de Python
FROM python:3.11-slim

# Instalar dependencias de sistema necesarias para python-ldap
RUN apt-get update && apt-get install -y \
    libldap2-dev \
    libsasl2-dev \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Configurar el directorio de trabajo
WORKDIR /app

# Copiar el archivo de requerimientos
COPY requirements.txt .

# Instalar las dependencias de Python
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copiar el código fuente
COPY . .

# Comando para ejecutar la aplicación
CMD ["python", "app.py"]  # O el comando que uses para ejecutar tu app
