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
