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
