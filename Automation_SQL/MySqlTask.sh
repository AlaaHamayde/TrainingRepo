
#!/bin/bash
sudo apt update
sudo apt install mysql-server
sudo service mysql start
sudo systemctl enable mysql

# MySQL server connection parameters
MYSQL_USER="root"
MYSQL_PASSWORD="root"

# Database name
DATABASE_NAME="store"

# Create a database named 'store' if it doesn't exist
read -s -p "Enter the new password for your database :" NEW_PASSWORD
mysql -u root -p <<EOF 
set password for 'root'@'localhost' = password('$NEW_PASSWORD');
FLUSH privileges;
EOF
echo "password updated"



mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -e "CREATE DATABASE IF NOT EXISTS store;"
# Use the 'store' database
mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -D $DATABASE_NAME -e "USE store;"
# Show all tables in the 'store' database
# Create a 'products' table with fields: product_id, name, price, and quantity
sudo mysql -u $MYSQL_USER -p  -D $DATABASE_NAME -e "CREATE TABLE IF NOT EXISTS products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL
);"

# Insert sample records into the 'products' table
sudo mysql -u $MYSQL_USER -p  -D $DATABASE_NAME -e "INSERT INTO products (name, price, quantity) VALUES
    ('Product 1', 19.99, 100),
    ('Product 2', 29.99, 75),
    ('Product 3', 9.99, 150);"

sudo mysql -u $MYSQL_USER -p -D $DATABASE_NAME -e "show tables;"
sudo mysql -u $MYSQL_USER -p -D $DATABASE_NAME -e "select * from products"
echo "Database '$DATABASE_NAME' and table 'products' created with sample records."

