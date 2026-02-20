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
