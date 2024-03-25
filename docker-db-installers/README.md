# Run the Command as Admin in CMD

# Create Docker Network
* The following command as Admin in a command prompt
* `docker network create tinitiate`
  
## DB Installers
* Create folder `tinitiate_databases`
* Pick the Database you want to install
  * SQL SERVER
    * Copy the file `ti-sqlserver-db-docker-compose.yml`
    * In command prompt navigate to the folder with file `ti-sqlserver-db-docker-compose.yml`
    * Run `docker-compose -f ti-sqlserver-db-docker-compose.yml up -d`
  * MySQL
    * Copy the file `ti-mysql-db-docker-compose.yml`
    * In command prompt navigate to the folder with file `ti-mysql-db-docker-compose.yml`
    * Run `docker-compose -f ti-mysql-db-docker-compose.yml up -d`
  * PostgreSQL
    * Copy the file `ti-postgresql-db-docker-compose.yml`
    * In command prompt navigate to the folder with file `ti-postgresql-db-docker-compose.yml`
    * Run `docker-compose -f ti-postgresql-db-docker-compose.yml up -d`
  * DynamoDB
    * Copy the file `ti-dynamo-db-docker-compose.yml`
    * In command prompt navigate to the folder with file `ti-dynamo-db-docker-compose.yml`
    * Run `docker-compose -f ti-dynamo-db-docker-compose.yml up -d`
  * Oracle
    * Copy the file `ti-oracle-db-docker-compose.yml`
    * In command prompt navigate to the folder with file `ti-oracle-db-docker-compose.yml`
    * Run `docker-compose -f ti-oracle-db-docker-compose.yml up -d`

## Misc Notes
* Prettify yaml in: 
    * https://jsonformatter.org/yaml-formatter
