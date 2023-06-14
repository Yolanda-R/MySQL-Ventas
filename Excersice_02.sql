
CREATE DATABASE Store CHARACTER SET utf8mb4;
USE Store;

CREATE TABLE manufacturer (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE product (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  id_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (id_fabricante) REFERENCES manufacturer(id)
);

INSERT INTO manufacturer VALUES(1, 'Asus'),
(2, 'Lenovo'),
(3, 'Hewlett-Packard'),
(4, 'Samsung'),
(5, 'Seagate'),
(6, 'Crucial'),
(7, 'Gigabyte'),
(8, 'Huawei'),
(9, 'Xiaomi');

INSERT INTO product VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5),
(2, 'Memoria RAM DDR4 8GB', 120, 6),
(3, 'Disco SSD 1 TB', 150.99, 4),
(4, 'GeForce GTX 1050Ti', 185, 7),
(5, 'GeForce GTX 1080 Xtreme', 755, 6),
(6, 'Monitor 24 LED Full HD', 202, 1),
(7, 'Monitor 27 LED Full HD', 245.99, 1),
(8, 'Portátil Yoga 520', 559, 2),
(9, 'Portátil Ideapd 320', 444, 2),
(10, 'Impresora HP Deskjet 3720', 59.99, 3),
(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);
SELECT * FROM manufacturer;


#Lista el nombre de todos los productos que hay en la tabla producto.
SELECT nombre FROM product;
#Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT nombre,precio FROM product;
#Lista todas las columnas de la tabla producto.
SELECT * FROM product;
#Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT UPPER(NOMBRE) AS NOM_MAYUS, PRECIO FROM product;
#Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
SELECT LOWER(NOMBRE) AS MINUS_NO, PRECIO FROM product;
#Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT nombre, UPPER(substring(NOMBRE,1,2)) AS NOM_CARACTERES2 FROM manufacturer;
#Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
SELECT NOMBRE,PRECIO,ROUND(PRECIO) AS R_P FROM product; 
#Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT nombre, PRECIO, TRUNCATE(precio,0) AS T_PRE FROM PRODUCT;
#Lista el identificador de los fabricantes que tienen productos en la tabla producto.
SELECT DISTINCT f.id FROM manufacturer f INNER JOIN product p on f.id = p.id;
SELECT ID_FABRICANTE FROM PRODUCT;
#Lista el identificador de los fabricantes que tienen productos en la tabla producto, eliminando los identificadores que aparecen repetidos.
SELECT DISTINCT ID_FABRICANTE FROM PRODUCT;
#Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT NOMBRE  FROM MANUFACTURER ORDER BY nombre ASC;
#Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT nombre FROM manufacturer ORDER BY nombre DESC;
#Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
SELECT nombre, precio FROM product ORDER BY nombre ASC, precio DESC;
SELECT precio from product order by precio desc;
#Devuelve una lista con las 5 primeras filas de la tabla fabricante.
SELECT * FROM MANUFACTURER LIMIT 5;
#Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
SELECT * FROM MANUFACTURER LIMIT 2 OFFSET 3;
#Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT PRECIO FROM PRODUCT ORDER BY PRECIO ASC LIMIT 1;
#Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT NOMBRE, PRECIO FROM PRODUCT ORDER BY PRECIO DESC LIMIT 1;
#Lista el nombre de todos los productos del fabricante cuyo identificador de fabricante es igual a 2.
SELECT NOMBRE,ID_FABRICANTE FROM PRODUCT WHERE ID_FABRICANTE= 2;
#Lista el nombre de los productos que tienen un precio menor o igual a 120€.
SELECT NOMBRE, PRECIO FROM PRODUCT WHERE PRECIO <= 120;
#Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
SELECT NOMBRE, PRECIO FROM PRODUCT WHERE PRECIO >= 400;
#Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
SELECT NOMBRE, PRECIO FROM PRODUCT WHERE NOT PRECIO >= 400; 
#Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
SELECT NOMBRE, PRECIO FROM PRODUCT WHERE PRECIO BETWEEN 80 AND 300;
SELECT NOMBRE,PRECIO FROM PRODUCT WHERE PRECIO >=80 AND PRECIO <= 300;
#Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
SELECT NOMBRE, PRECIO FROM PRODUCT WHERE PRECIO BETWEEN 60 AND 200;
#Lista todos los productos que tengan un precio mayor que 200€ y que el identificador de fabricante sea igual a 6.
SELECT NOMBRE, PRECIO FROM PRODUCT WHERE PRECIO > 200 AND ID_FABRICANTE =6; 
#Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.

#Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN.

#Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.

#Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.

#Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.

Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.

Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.

Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.

Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.

Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).