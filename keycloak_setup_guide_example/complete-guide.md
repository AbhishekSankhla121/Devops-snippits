# Install VirtualBox and Setup Ubuntu (Debian/Trixie)

This guide explains how to install VirtualBox and set up Ubuntu 24.04.4
on Debian/Trixie.

------------------------------------------------------------------------

## Step 1: Download VirtualBox (.deb file)

Download VirtualBox 7.2.6 for Debian:

https://download.virtualbox.org/virtualbox/7.2.6/virtualbox-7.2_7.2.6-172322~Debian~trixie_amd64.deb

Or download using wget:

``` bash
wget https://download.virtualbox.org/virtualbox/7.2.6/virtualbox-7.2_7.2.6-172322~Debian~trixie_amd64.deb
```

------------------------------------------------------------------------

## Step 2: Install VirtualBox

Navigate to the directory where the file was downloaded and run:

``` bash
sudo apt update
sudo apt install ./virtualbox-7.2_7.2.6-172322~Debian~trixie_amd64.deb
```

If dependency issues occur, run:

``` bash
sudo apt --fix-broken install
```

------------------------------------------------------------------------

## Step 3: Download Ubuntu ISO

Download Ubuntu 24.04.4 Desktop ISO:

https://releases.ubuntu.com/24.04.4/ubuntu-24.04.4-desktop-amd64.iso

Or download using wget:

``` bash
wget https://releases.ubuntu.com/24.04.4/ubuntu-24.04.4-desktop-amd64.iso
```

------------------------------------------------------------------------

## Step 4: Open VirtualBox

Run the following command:

``` bash
virtualbox
```

Or open it from your Applications menu.

------------------------------------------------------------------------

## Step 5: Create and Configure Ubuntu Virtual Machine

1.  Click **New**
2.  Name: `Ubuntu 24.04`
3.  Type: `Linux`
4.  Version: `Ubuntu (64-bit)`
5.  Allocate RAM: **4096 MB (4GB) or more recommended**
6.  Allocate CPU: **2 or more cores recommended**
7.  Create Virtual Hard Disk:
    -   Type: `VDI`
    -   Storage: `Dynamically allocated`
    -   Size: **20GB or more recommended**
8.  Select the downloaded Ubuntu ISO file when prompted
9.  Click **Start**

------------------------------------------------------------------------

## Step 6: Install Ubuntu

1.  Select **Install Ubuntu**
2.  Choose keyboard layout
3.  Select **Normal installation**
4.  Choose **Erase disk and install Ubuntu** (this only affects the
    virtual disk)
5.  Create username and password
6.  Wait for installation to complete
7.  Restart the virtual machine

------------------------------------------------------------------------

## Installation Complete 🎉

Ubuntu is now running inside VirtualBox.






# Install PostgreSQL on Ubuntu

Reference Link: https://www.postgresql.org/download/linux/ubuntu/

------------------------------------------------------------------------

## Step 1: Update System

``` bash
sudo apt update && sudo apt full-upgrade -y
```

------------------------------------------------------------------------

## Step 2: Automated Repository Configuration

``` bash
sudo apt install -y postgresql-common
sudo /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh
```

------------------------------------------------------------------------

## Step 3: Install PostgreSQL

(Replace "16" with the version you want)

``` bash
sudo apt install postgresql-16
```

------------------------------------------------------------------------

## Step 4: Verify PostgreSQL Installation

``` bash
psql --version
```

------------------------------------------------------------------------

## Step 5: Use psql Command Line Tool

``` bash
sudo -u postgres psql
```

------------------------------------------------------------------------

## Step 6: Create a Role in PostgreSQL

(ROLE represents a database user, a group of users, or both)

``` sql
create user keycloak;
```

------------------------------------------------------------------------

## Step 7: View Existing Roles

``` sql
\du
```

------------------------------------------------------------------------

## Step 8: Change Password of keycloak

``` sql
ALTER USER keycloak WITH PASSWORD 'abhishek';
```

------------------------------------------------------------------------

## Step 9: Create the Database

``` sql
CREATE DATABASE keycloak OWNER keycloak;
```

------------------------------------------------------------------------

## Step 10: Grant All Privileges to keycloak Role

``` sql
GRANT ALL PRIVILEGES ON DATABASE keycloak TO keycloak;
ALTER USER keycloak WITH SUPERUSER;
```

------------------------------------------------------------------------

## Step 11: Exit from psql

``` sql
\q
```

------------------------------------------------------------------------

## Step 12: Verify Login with Database Name

``` bash
sudo psql -h localhost -U keycloak
```

------------------------------------------------------------------------

## PostgreSQL Setup Complete 🎉

PostgreSQL is now installed and configured.




# Install VS Code and Java 21 on Ubuntu

## Install Visual Studio Code

Reference Link: https://code.visualstudio.com/docs/setup/linux

You can follow the official documentation from the link above.

------------------------------------------------------------------------

# Install Java 21 (OpenJDK)

Reference: https://askubuntu.com/questions/1492571/install-openjdk-21

------------------------------------------------------------------------

## Step 1: Open Terminal and Install Java 21

``` bash
sudo apt-get install openjdk-21-jdk
```

------------------------------------------------------------------------

## Step 2: Verify Java Installation

``` bash
java -version
```

------------------------------------------------------------------------

## Installation Complete 🎉

VS Code and Java 21 are now installed on your system.



# Install Keycloak 26.4.7 on Ubuntu

------------------------------------------------------------------------

## Step 1: Download Keycloak 26.4.7

Download link:
https://github.com/keycloak/keycloak/releases/download/26.4.7/keycloak-26.4.7.zip

You can also download using wget:

``` bash
wget https://github.com/keycloak/keycloak/releases/download/26.4.7/keycloak-26.4.7.zip
```

Then extract:

``` bash
unzip keycloak-26.4.7.zip
```

------------------------------------------------------------------------

## Step 2: Open Keycloak Directory in VS Code

``` bash
cd ~/Desktop/keycloak-26.4.7
code .
```

------------------------------------------------------------------------

## Step 3: Configure keycloak.conf

Edit the file:

    ~/Desktop/keycloak-26.4.7/conf/keycloak.conf

Replace/update with the following configuration:

``` properties
# Basic settings for running in production. Change accordingly before deploying the server.

# Database
db=postgres
db-username=keycloak
db-password=abhishek
db-url=jdbc:postgresql://localhost:5432/keycloak

# Observability
health-enabled=true
metrics-enabled=true

# HTTP
spi-sticky-session-encoder-infinispan-should-attach-route=false
spi-x509cert-lookup-provider=nginx
spi-x509cert-lookup-nginx-ssl-client-cert=ssl-client-cert
spi-x509cert-lookup-nginx-ssl-cert-chain-prefix=empty
spi-x509cert-lookup-nginx-certificate-chain-length=10
spi-x509cert-lookup-nginx-trust-proxy-verification=true
spi-connections-liquibase-quarkus-index-creation-threshold=300000

hostname=http://localhost:8080
proxy-headers=xforwarded
http-enabled=true
cache=local

# Events
spi-events-listener-email-exclude-events=LOGIN_ERROR
```

------------------------------------------------------------------------

## Step 4: Build Keycloak

``` bash
~/Desktop/keycloak-26.4.7/bin/kc.sh build
```

------------------------------------------------------------------------

## Step 5: Start Keycloak

``` bash
~/Desktop/keycloak-26.4.7/bin/kc.sh start
```

------------------------------------------------------------------------

## Step 6: Verify Keycloak Tables in PostgreSQL

``` bash
sudo psql -h localhost -U keycloak
```

Inside psql:

``` sql
\dt
```

------------------------------------------------------------------------

## Keycloak Setup Complete 🎉

Keycloak should now be running at:

http://localhost:8080



# Install Docker on Ubuntu (Optional)

Reference (Docker Engine):
https://docs.docker.com/engine/install/ubuntu/

------------------------------------------------------------------------

## Step 1: Install Docker on Ubuntu

### Set up Docker's apt repository

# Add Docker's official GPG key:

``` bash
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
```

# Add the repository to Apt sources:

``` bash
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF
```

``` bash
sudo apt update
```

### Install Docker packages

``` bash
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

------------------------------------------------------------------------

## Step 2: Linux Post-Installation Steps

Reference: https://docs.docker.com/engine/install/linux-postinstall/

``` bash
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
```

------------------------------------------------------------------------

## Step 3: Enable and Start Docker Services

``` bash
sudo systemctl status docker
sudo systemctl enable docker
sudo systemctl enable containerd.service
sudo systemctl start docker
```

------------------------------------------------------------------------

## Step 4: Verify Docker Installation

``` bash
docker run hello-world
```

------------------------------------------------------------------------

## Step 5: Run pgAdmin on Port 5050

``` bash
docker run -p 5050:80 -e "PGADMIN_DEFAULT_EMAIL=admin@example.com" -e "PGADMIN_DEFAULT_PASSWORD=admin" -d --name pgadmin dpage/pgadmin4
```

------------------------------------------------------------------------

## Step 6: Register PostgreSQL Server in pgAdmin

### Pre-steps

Get Docker IP address:

``` bash
ip a
```

Change directory:

``` bash
cd /etc/postgresql/16/main
```

Give write permission:

``` bash
sudo chmod +x pg_hba.conf
```

Edit pg_hba.conf:

``` bash
sudo vim pg_hba.conf
```

Add this line at the end:

    host    all     all     docker_ip     md5

Update in postgresql.conf:

Change:

    listen_addresses = 'localhost'

To:

    listen_addresses = '*'

Reload PostgreSQL service:

``` bash
sudo systemctl reload postgresql
```

------------------------------------------------------------------------

### Register Server in pgAdmin

1.  Open pgAdmin (http://localhost:5050)
2.  Right-click on **Servers**
3.  Click **Register \> Server**
4.  General Tab:
    -   Name: keycloak
5.  Connection Tab:
    -   Hostname/Address: docker_ip
    -   Port: 5432
    -   Username: keycloak
    -   Password: abhishek
6.  Click **Save**

You should now see the keycloak database tables.

------------------------------------------------------------------------

## Allow UFW Rule for PostgreSQL

``` bash
sudo ufw allow from docker_ip/subnet to any port 5432
sudo ufw reload
sudo ufw status
```

------------------------------------------------------------------------

## Docker & pgAdmin Setup Complete 🎉





# PostgreSQL Backup, Encryption, and Restore Guide

------------------------------------------------------------------------

# Create PostgreSQL Backup using pg_dump and pg_dumpall

## Step 1: Set keycloak as Superuser

``` bash
sudo -u postgres psql
```

Inside psql:

``` sql
ALTER USER keycloak WITH SUPERUSER;
\q
```

------------------------------------------------------------------------

## Step 2: Take Database Backup

### Backup specific database

``` bash
pg_dump -h localhost -p 5432 -U keycloak -W keycloak | gzip > keycloak.sql.gz
```

### Backup global objects (roles, privileges)

``` bash
pg_dumpall -h localhost -p 5432 -U keycloak -W -g | gzip > keycloak-globals.sql.gz
```

Verify backup files:

``` bash
ls -l
```

------------------------------------------------------------------------

# Encrypt the Backup using OpenSSL

Reference:
https://opensource.com/article/21/4/encryption-decryption-openssl

------------------------------------------------------------------------

## Step 3: Generate Keys

Generate private key:

``` bash
openssl genrsa -out abhishek_keycloak.pem 2048
```

Generate public key:

``` bash
openssl rsa -in abhishek_keycloak.pem -pubout -out abhishek_keycloak_public.pem
```

Generate random symmetric key:

``` bash
openssl rand -base64 32 > key.bin
```

------------------------------------------------------------------------

## Step 4: Encrypt Backup Files

Encrypt database backup:

``` bash
openssl enc -aes-256-cbc -md sha512 -pbkdf2 -iter 1000000 -salt -in keycloak.sql.gz -out keycloak.sql.gz.enc -pass file:./key.bin
```

Encrypt globals backup:

``` bash
openssl enc -aes-256-cbc -md sha512 -pbkdf2 -iter 1000000 -salt -in keycloak-globals.sql.gz -out keycloak-globals.sql.gz.enc -pass file:./key.bin
```

Encrypt the symmetric key using public key:

``` bash
openssl pkeyutl -encrypt -inkey ./abhishek_keycloak_public.pem -pubin -in ./key.bin -out key.bin.enc
```

------------------------------------------------------------------------

# Restore Backup

Assumption: Database was dropped already.

------------------------------------------------------------------------

## Step 5: Recreate Role and Database

``` bash
sudo -u postgres psql
```

Inside psql:

``` sql
create user keycloak;
ALTER USER keycloak WITH PASSWORD 'abhishek';
CREATE DATABASE keycloak OWNER keycloak;
GRANT ALL PRIVILEGES ON DATABASE keycloak TO keycloak;
\q
```

------------------------------------------------------------------------

## Step 6: Decrypt Encryption Key

``` bash
openssl pkeyutl -decrypt -inkey ./abhishek_keycloak.pem -in ./key.bin.enc -out abhishek.key.bin
```

------------------------------------------------------------------------

## Step 7: Decrypt Backup Files

Decrypt database backup:

``` bash
openssl enc -d -aes-256-cbc -md sha512 -pbkdf2 -iter 1000000 -in ./keycloak.sql.gz.enc -out abhishek_keycloak.sql.gz -pass file:./abhishek.key.bin
```

Decrypt globals backup:

``` bash
openssl enc -d -aes-256-cbc -md sha512 -pbkdf2 -iter 1000000 -in ./keycloak-globals.sql.gz.enc -out abhishek_keycloak-globals.sql.gz -pass file:./abhishek.key.bin
```

------------------------------------------------------------------------

## Step 8: Restore Data

### Restore global objects first

``` bash
cat abhishek_keycloak-globals.sql.gz | gunzip | psql -h localhost -p 5432 -U keycloak keycloak
```

### Restore database tables

``` bash
cat abhishek_keycloak.sql.gz | gunzip | psql -h localhost -p 5432 -U keycloak keycloak
```

------------------------------------------------------------------------

## Backup & Restore Process Complete 🎉


