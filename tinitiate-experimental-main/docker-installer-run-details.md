# Run the Command as Admin in CMD

# Create Docker Network
* The following command as Admin in a command prompt
* `docker network create tinitiate`
  
## DB Installers
* Create folder `tinitiate_databases`
* Copy the file `tinitiatedb-docker-compose.yml`
* In command prompt navigate to the folder with file `tinitiatedb-docker-compose.yml`
* Run `docker-compose -f tinitiatedb-docker-compose.yml up -d`

## AWS ETL Installers
* Create folder `tinitiate_etl`
* Copy the file tinitiate-awsetl-docker-compose.yml
* In command prompt navigate to the folder with file `tinitiate-awsetl-docker-compose.yml`
* Run `docker-compose -f tinitiate-awsetl-docker-compose.yml up -d`
* Contents
    * Local Glue
    * Local Kinesis
    * Local DMS

## PySpark Installer
* Create folder `tinitiate_etl`
* Copy the file `tinitiate-pyspark-docker-compose.yml`
* In command prompt navigate to the folder with file `tinitiate-pyspark-docker-compose.yml`
* Run `docker-compose -f tinitiate-pyspark-docker-compose.yml up -d`
  
## Storage Emulators Installers
* Create folder `tinitiate_storage_emulators`
* Copy the file tinitiatedb-docker-compose.yml
* In command prompt navigate to the `tinitiatedb-docker-compose.yml` folder
* Run `docker-compose -f tinitiate-storage-docker-compose.yml up -d`
* Contents
    * FTP server (with data)
    * Azure Blob

## Misc Notes
* Prettify yaml in: 
    * https://jsonformatter.org/yaml-formatter
