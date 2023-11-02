#!/bin/bash


TIMESTAMP=$(date "+%Y%m%d")
DIR="BACKUP_FILE"
read -p "Enter MySQL username: " MYSQL_USER
read -p "Enter MySQL password: " MYSQL_PASSWORD
read -p "Enter MySQL host  " MYSQL_HOST
MYSQL_HOST=${MYSQL_HOST:-localhost} # Use 'localhost' if user doesn't enter a value
read -p "Enter MySQL port (default: 3306): " DB_PORT
DB_PORT=${DB_PORT:-3306} # Use 3306 if user doesn't enter a value
read -p "Enter the name of the database to back up: " DB_NAME
# Check if the directory exists
if [ ! -d "$DIR" ]; then
    
    mkdir -p "$DIR"
    echo "Directory created: $DIR"
else
    echo "Directory already exists: $DIR"
fi
BACKUP="BACKUP_FILE/backup-${TIMESTAMP}.sql"
sudo mysqldump --user=$MYSQL_NAME --password=$MYSQL_PASSWORD --host=$MYSQL_HOST --port=$DB_PORT $DB_NAME > $BACKUP

# check if the backup file exist 
if [ -e "$BACKUP" ]; then
    echo "File exists: $BACKUP"
else
    echo "File does not exist: $BACKUP"
fi

 





