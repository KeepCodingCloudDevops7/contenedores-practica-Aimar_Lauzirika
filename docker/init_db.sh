#!/bin/bash

mysql -u root -p$MYSQL_ROOT_PASSWORD <<_EOF
USE $MYSQL_DATABASE;
CREATE TABLE tabla_contador (
  contador int NOT NULL
);
INSERT INTO tabla_contador VALUES (0);
_EOF