#!/bin/bash


TIMESTAMP=$(date "+%Y%m%d")
DIR="TrainingRepo/Automation_SQL/BACKUP_FILE"
 MYSQL_USER="root"
 MYSQL_PASSWORD="root"
 MYSQL_HOST="localhost"
#MYSQL_HOST=${MYSQL_HOST:-localhost} # Use 'localhost' if user doesn't enter a value
#read -p "Enter MySQL port (default: 3306): " DB_PORT
DB_PORT=3306
#read -p "Enter the name of the database to back up: "
 DB_NAME="store"
# Check if the directory exists
if [ ! -d "$DIR" ]; then
    
    mkdir -p "$DIR"
    echo "Directory created: $DIR"
else
    echo "Directory already exists: $DIR"
fi
BACKUP="$DIR/backup-${TIMESTAMP}.sql"
sudo mysqldump --user=$MYSQL_NAME --password=$MYSQL_PASSWORD --host=$MYSQL_HOST --port=$DB_PORT $DB_NAME > $BACKUP

# check if the backup file exist 
if [ -e "$BACKUP" ]; then
    echo "File exists: $BACKUP"
else
    echo "File does not exist: $BACKUP"
fi

 





