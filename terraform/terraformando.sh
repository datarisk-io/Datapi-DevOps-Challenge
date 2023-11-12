#!/bin/bash

# Atualizando pacotes do Amazon Linux
sudo yum install amazon-linux-extras install epel -y

# Atualizando repositorio contendo Docker
sudo amazon-linux-extras install docker -y

# Instalando Docker
sudo yum install docker -y

# Iniciando serviço do Docker
sudo service docker start

# Adicionando usuário ao grupo do Docker
sudo usermod -a -G docker ec2-user

# Baixando e Instalando Docker Compose
sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

# Alterando Dono da pasta
sudo chown ec2-user /usr

# Fornecendo permissão dentro da pasta para execução do Docker Compose
sudo chmod +x /usr/local/bin/docker-compose

# Criando arquivo YAML com conteudo Multi Stage do Docker Compose
cat << eof > docker-compose.yaml
version: "3"
services:
  wordpress:
    container_name: my_wordpress
    image: wordpress
    ports:
      - "8080:80"
    links:
      - mysql
    environment:
      WORDPRESS_DB_HOST: mysql
      WORDPRESS_DB_USER: root
      WORDPRESS_DB_PASSWORD: "12345"
      WORDPRESS_DB_NAME: wordpress
  mysql:
    container_name: my_mysql
    image: "mysql:5.7"
    volumes:
      - ./.mysql:/var/lib/mysql
    environment:
      MYSQL_DATABASE: wordpress
      MYSQL_ROOT_PASSWORD: "12345"
eof

# Subindo os containers do Docker Compose
docker-compose up -d
          
# sudo docker run -d -p 8600:8080 pengbai/docker-supermario
