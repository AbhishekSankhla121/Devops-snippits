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
