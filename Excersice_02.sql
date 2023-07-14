
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
SELECT nombre, ID_fabricante FROM product where id_fabricante = 1 OR  id_fabricante = 3 OR id_fabricante= 5;
#Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN.
SELECT NOMBRE, ID_FABRICANTE FROM product WHERE ID_FABRICANTE IN(1,3,5);
#Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
SELECT NOMBRE,PRECIO*100 AS CENTIMOS FROM product; 
#Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
SELECT NOMBRE FROM MANUFACTURER WHERE NOMBRE LIKE 'S%';
#Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
SELECT NOMBRE FROM MANUFACTURER WHERE NOMBRE LIKE '%E'; 
#Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
SELECT NOMBRE FROM MANUFACTURER WHERE NOMBRE LIKE '%W%';
#Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
SELECT NOMBRE FROM MANUFACTURER WHERE length(NOMBRE) = 4;
#Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
SELECT NOMBRE FROM product WHERE NOMBRE LIKE '%Portátil%';
#Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
SELECT NOMBRE,PRECIO FROM PRODUCT WHERE NOMBRE LIKE '%MONITOR%' AND PRECIO < 215;
#Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
SELECT NOMBRE, PRECIO FROM PRODUCT WHERE PRECIO >= 180 ORDER BY PRECIO DESC, NOMBRE ASC;
#Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT P.NOMBRE, P.PRECIO, M.NOMBRE FROM PRODUCT P JOIN MANUFACTURER M ON P.ID_FABRICANTE = M.ID;
#Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
SELECT P.NOMBRE,P.PRECIO,M.NOMBRE FROM PRODUCT P JOIN MANUFACTURER M ON P.ID_FABRICANTE = M.ID ORDER BY M.NOMBRE ASC;
#Devuelve una lista con el identificador del producto, nombre del producto, identificador del fabricante y nombre del fabricante, de todos los productos de la base de datos.
SELECT P.ID AS ID_PRO, p.NOMBRE as NOM_PR, P.ID_FABRICANTE, m.nombre as nom_fab FROM product p JOIN MANUFACTURER M ON P.ID_FABRICANTE;
#Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT  P.NOMBRE AS NOM_PROD, P.PRECIO, M.NOMBRE AS NOM_FAB FROM PRODUCT P JOIN MANUFACTURER M ON P.ID_FABRICANTE = M.ID ORDER BY P.PRECIO ASC LIMIT 1;  
#Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT P.NOMBRE AS NOM_PROD, P.PRECIO, M.NOMBRE AS NOM_FAB 
FROM PRODUCT P 
JOIN MANUFACTURER M ON P.ID_FABRICANTE = M.ID 
ORDER BY P.PRECIO DESC  
LIMIT 1; 
#Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT NOMBRE FROM MANUFACTURER
WHERE NOMBRE NOT IN('LENOVO','SAMSUNG');
#Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
SELECT NOMBRE FROM PRODUCT 
WHERE PRECIO >= 200;
#Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.
SELECT NOMBRE FROM MANUFACTURER
WHERE NOMBRE = 'ASUS' OR NOMBRE ='Hewlett-Packard' OR NOMBRE = 'Seagate';
#Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
SELECT NOMBRE FROM MANUFACTURER WHERE NOMBRE IN('ASUS','Hewlett-Packard','Seagate');
#Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
SELECT NOMBRE, PRECIO FROM PRODUCT WHERE NOMBRE LIKE '%E';
#Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
SELECT NOMBRE, PRECIO FROM PRODUCT WHERE NOMBRE LIKE '%W%';
#Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
SELECT P.NOMBRE AS N_PROD, P.PRECIO, M.NOMBRE FROM PRODUCT P 
JOIN MANUFACTURER M ON P.ID_FABRICANTE=M.ID
WHERE P.PRECIO >= 180 
ORDER BY P.PRECIO DESC , M.NOMBRE ASC;
#Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.
SELECT  M.ID,M.NOMBRE AS NOM_FAB, P.Id_fabricante FROM MANUFACTURER M JOIN PRODUCT P ON M.ID=P.ID_FABRICANTE;
#Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
SELECT M.NOMBRE AS NOM_FAB, P.NOMBRE AS NOM_PROD FROM MANUFACTURER M LEFT JOIN PRODUCT P ON M.ID = P.ID_FABRICANTE;
#Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT M.NOMBRE AS N_FAB, P.NOMBRE AS NOM_PROD FROM MANUFACTURER M LEFT JOIN PRODUCT P ON M.ID =P.ID_FABRICANTE WHERE P.NOMBRE IS NULL;
#¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.
#Según la query no se evidencia productos que no tengan relacion con algún fabricante 	
SELECT P.NOMBRE AS N_PROD, M.NOMBRE AS N_FAB FROM PRODUCT P LEFT JOIN MANUFACTURER M ON P.ID_FABRICANTE = M.ID;
#Calcula el número total de productos que hay en la tabla productos.
SELECT COUNT(NOMBRE) AS CUENTA_T FROM PRODUCT;
#Calcula el número total de fabricantes que hay en la tabla fabricante.
SELECT COUNT(NOMBRE) AS CUENTA FROM MANUFACTURER;
#Calcula el número de valores distintos de identificador de fabricante aparecen en la tabla productos.
SELECT COUNT(DISTINCT ID_FABRICANTE) AS FAB_COUN FROM PRODUCT; 
#Calcula la media del precio de todos los productos.
SELECT AVG(ROUND(PRECIO)) AS PROMEDIO FROM PRODUCT;
#Calcula el precio más barato de todos los productos.
SELECT MIN(PRECIO) FROM PRODUCT;
#Calcula el precio más caro de todos los productos.
SELECT MAX(PRECIO) FROM PRODUCT;
#Lista el nombre y el precio del producto más barato.
SELECT NOMBRE, PRECIO FROM PRODUCT ORDER BY PRECIO ASC LIMIT 1;
#Lista el nombre y el precio del producto más caro.
SELECT NOMBRE,PRECIO FROM PRODUCT ORDER BY PRECIO ASC LIMIT 1;
#Calcula la suma de los precios de todos los productos.
SELECT SUM(PRECIO) FROM PRODUCT;
#Calcula el número de productos que tiene el fabricante Asus.
SELECT COUNT(NOMBRE) FROM MANUFACTURER WHERE NOMBRE = 'ASUS';
#Calcula la media del precio de todos los productos del fabricante Asus.
SELECT AVG(PRECIO) AS MEDIA FROM PRODUCT P JOIN MANUFACTURER M ON P.ID_FABRICANTE=M.ID WHERE M.NOMBRE= 'ASUS';
#Calcula el precio más barato de todos los productos del fabricante Asus.
SELECT MIN(PRECIO) FROM PRODUCT P INNER JOIN MANUFACTURER M ON P.ID_FABRICANTE=M.ID WHERE M.NOMBRE='ASUS';
#Calcula el precio más caro de todos los productos del fabricante Asus.
SELECT MAX(PRECIO) FROM PRODUCT P INNER JOIN MANUFACTURER M ON P.ID_FABRICANTE=M.ID WHERE M.NOMBRE ='ASUS';
SELECT P.PRECIO FROM PRODUCT P INNER JOIN MANUFACTURER M ON P.ID_FABRICANTE=M.ID WHERE M.NOMBRE ='ASUS'ORDER BY P.PRECIO DESC LIMIT 1;
#Calcula la suma de todos los productos del fabricante Asus.
SELECT SUM(PRECIO) FROM PRODUCT P INNER JOIN MANUFACTURER M ON P.ID_FABRICANTE=M.ID WHERE M.NOMBRE='ASUS';
#Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.
SELECT MAX(PRECIO) AS MAX, MIN(PRECIO) AS MIN, AVG(PRECIO) AS MEDIA, COUNT(PRECIO) AS CUENTA FROM PRODUCT P 
INNER JOIN MANUFACTURER M  ON P.ID_FABRICANTE=M.ID
WHERE M.NOMBRE ='Crucial';  
#Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendentemente por el número de productos.
SELECT M.NOMBRE, COUNT(P.NOMBRE) AS CUENTA FROM MANUFACTURER M LEFT JOIN PRODUCT P ON M.ID=P.ID_FABRICANTE GROUP BY M.NOMBRE ORDER BY CUENTA DESC;
#Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
SELECT M.NOMBRE, MAX(PRECIO) AS MAX, MIN(PRECIO), AVG(PRECIO) AS MEDIA FROM MANUFACTURER M LEFT JOIN PRODUCT P ON M.ID=P.ID_FABRICANTE GROUP BY M.NOMBRE;
#Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el identificador del fabricante es suficiente.
SELECT P.NOMBRE, P.ID_FABRICANTE , MAX(PRECIO),MIN(PRECIO), AVG(PRECIO) AS MEDIA, COUNT(PRECIO) AS CUENTA FROM  PRODUCT P
INNER JOIN MANUFACTURER M ON P.ID_FABRICANTE=M.ID
GROUP BY P.NOMBRE, P.ID_FABRICANTE
HAVING MEDIA >200;
#Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante.
SELECT M.NOMBRE, MAX(PRECIO) AS MAX, MIN(PRECIO) AS MIN, AVG(PRECIO) AS MEDIA, COUNT(PRECIO) AS CUENTA FROM MANUFACTURER M 
LEFT JOIN PRODUCT P ON M.ID= P.ID_FABRICANTE 
GROUP BY M.NOMBRE
HAVING MEDIA >= 200;
#Calcula el número de productos que tienen un precio mayor o igual a 180€.
SELECT COUNT(NOMBRE) FROM PRODUCT WHERE PRECIO >= 180;
#Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.
SELECT M.NOMBRE AS FABRIC,COUNT(PRECIO) FROM MANUFACTURER M 
INNER JOIN PRODUCT P ON M.ID= P.ID_FABRICANTE 
WHERE P.PRECIO >= 180
GROUP BY FABRIC;
#Lista el precio medio los productos de cada fabricante, mostrando solamente el identificador del fabricante.
SELECT ID_FABRICANTE, AVG(PRECIO) AS MEDIA FROM PRODUCT GROUP BY ID_FABRICANTE;
#Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.
SELECT M.NOMBRE AS FABRIC, AVG(PRECIO) AS MEDIA FROM MANUFACTURER M 
INNER JOIN PRODUCT P ON M.ID=P.ID_FABRICANTE 
GROUP BY M.NOMBRE;
#Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
SELECT M.NOMBRE AS FABRIC, AVG(PRECIO) AS MEDIA FROM MANUFACTURER M LEFT JOIN PRODUCT P ON M.ID= P.ID_FABRICANTE
GROUP BY M.NOMBRE
HAVING MEDIA >= 150;
#Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
SELECT M.NOMBRE  FROM MANUFACTURER M LEFT JOIN PRODUCT P ON M.ID=P.ID_FABRICANTE 
GROUP BY M.NOMBRE
HAVING COUNT(*) >=2;
#Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición.
SELECT M.NOMBRE AS FABRIC, COUNT(*) AS CUENTA FROM MANUFACTURER M
LEFT JOIN PRODUCT P ON  M.ID=P.ID_FABRICANTE
WHERE P.PRECIO >= 220
GROUP BY FABRIC;
#Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante que no tiene productos con un precio superior o igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el número de productos.
SELECT M.NOMBRE, COUNT(P.ID) FROM  MANUFACTURER M LEFT JOIN PRODUCT P ON M.ID =P.ID_FABRICANTE 
WHERE P.PRECIO>=220
GROUP BY M.NOMBRE;
SELECT M.NOMBRE AS NOMBRE_FABRICANTE, COALESCE(COUNT(P.ID), 0) AS NUMERO_PRODUCTOS
FROM MANUFACTURER M
LEFT JOIN (
    SELECT ID_FABRICANTE, ID
    FROM PRODUCT
    WHERE PRECIO >= 220
) P ON M.ID = P.ID_FABRICANTE
GROUP BY M.NOMBRE 
ORDER BY NUMERO_PRODUCTOS DESC;
#Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €.
SELECT M.NOMBRE AS NOM_FAB, SUM(PRECIO) AS PRECIO FROM MANUFACTURER M INNER JOIN PRODUCT P ON M.ID = P.ID_FABRICANTE 
GROUP BY NOM_FAB
HAVING PRECIO > 1000; 
#Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante
SELECT M.NOMBRE AS N_FB, P.PRECIO AS PR, P.NOMBRE AS NOM_PR FROM MANUFACTURER M
INNER JOIN PRODUCT P ON M.ID=P.ID_FABRICANTE
GROUP BY N_FB
ORDER BY N_FB ASC;
SELECT P.NOMBRE AS NOMBRE_PRODUCTO, P.PRECIO, M.NOMBRE AS NOMBRE_FABRICANTE
FROM PRODUCT P
INNER JOIN MANUFACTURER M ON P.ID_FABRICANTE = M.ID
LEFT JOIN PRODUCT P2 ON P.ID_FABRICANTE = P2.ID_FABRICANTE AND P.PRECIO < P2.PRECIO
WHERE P2.ID IS NULL
ORDER BY M.NOMBRE ASC;
SELECT P.NOMBRE AS NOMBRE_PRODUCTO, P.PRECIO, M.NOMBRE AS NOMBRE_FABRICANTE
FROM PRODUCT P
INNER JOIN MANUFACTURER M ON P.ID_FABRICANTE = M.ID
INNER JOIN (
    SELECT ID_FABRICANTE, MAX(PRECIO) AS MAX_PRECIO
    FROM PRODUCT
    GROUP BY ID_FABRICANTE
) T ON P.ID_FABRICANTE = T.ID_FABRICANTE AND P.PRECIO = T.MAX_PRECIO
ORDER BY M.NOMBRE ASC;
## Subconsultas
#Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT NOMBRE AS PROD, (SELECT NOMBRE FROM MANUFACTURER WHERE ID=P.ID_FABRICANTE) AS FAB FROM PRODUCT P
WHERE ID_FABRICANTE =(
SELECT ID  FROM MANUFACTURER WHERE NOMBRE ='LENOVO');
#Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT NOMBRE AS PROD FROM PRODUCT 
WHERE PRECIO =(
SELECT MAX(PRECIO) AS PRICE FROM PRODUCT WHERE ID_FABRICANTE =(SELECT ID FROM MANUFACTURER WHERE NOMBRE = 'LENOVO'));  
#Lista el nombre del producto más caro del fabricante Lenovo.
SELECT NOMBRE, PRECIO FROM PRODUCT WHERE PRECIO=(
SELECT MAX(PRECIO) FROM PRODUCT  WHERE ID_FABRICANTE =(SELECT ID FROM MANUFACTURER WHERE NOMBRE = 'LENOVO'));
#Lista el nombre del producto más barato del fabricante Hewlett-Packard.
SELECT NOMBRE, PRECIO FROM PRODUCT 
WHERE PRECIO =(
SELECT MIN(PRECIO) FROM PRODUCT WHERE ID_FABRICANTE =(SELECT ID FROM MANUFACTURER WHERE NOMBRE = 'Hewlett-Packard'));
#Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
SELECT NOMBRE, PRECIO FROM PRODUCT 
WHERE PRECIO >=(
SELECT MAX(PRECIO) FROM PRODUCT WHERE ID_FABRICANTE =(SELECT ID FROM MANUFACTURER WHERE NOMBRE = 'LENOVO'));
#Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
SELECT NOMBRE, PRECIO FROM PRODUCT 
WHERE PRECIO >= (SELECT AVG(PRECIO) FROM PRODUCT WHERE ID_FABRICANTE =(SELECT ID FROM MANUFACTURER WHERE NOMBRE = 'ASUS'));
#Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.
SELECT NOMBRE, PRECIO FROM PRODUCT 
WHERE PRECIO =
(SELECT PRECIO FROM PRODUCT ORDER BY PRECIO DESC LIMIT 1);
#Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.
SELECT NOMBRE, PRECIO FROM PRODUCT 
WHERE PRECIO=(SELECT MIN(PRECIO) FROM PRODUCT );
#Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).

SELECT NOMBRE FROM MANUFACTURER 
WHERE ID = ANY (SELECT DISTINCT ID_FABRICANTE FROM PRODUCT);
#Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).
SELECT M.NOMBRE AS FAB, P.NOMBRE AS PROD FROM MANUFACTURER M LEFT JOIN PRODUCT P ON M.ID=P.ID_FABRICANTE WHERE P.ID IS NULL;
SELECT NOMBRE
FROM MANUFACTURER M
WHERE NOT EXISTS (SELECT 1 FROM PRODUCT P WHERE P.ID_FABRICANTE = M.ID);
#Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).
SELECT M.NOMBRE AS FAB, P.NOMBRE AS PROD  FROM MANUFACTURER M
LEFT JOIN PRODUCT P ON M.ID=P.ID_FABRICANTE WHERE P.NOMBRE IS NOT NULL;
SELECT M.NOMBRE AS FAB FROM MANUFACTURER M
WHERE EXISTS (SELECT p.nombre FROM PRODUCT P WHERE P.ID_FABRICANTE = M.ID);
#Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).
SELECT M.NOMBRE AS FAB, P.NOMBRE AS PROD FROM MANUFACTURER M
LEFT JOIN PRODUCT P ON M.ID=P.ID_FABRICANTE WHERE P.NOMBRE IS NULL;
SELECT M.NOMBRE AS FAB FROM MANUFACTURER M
WHERE not EXISTS (SELECT 1 FROM PRODUCT P WHERE P.ID_FABRICANTE = M.ID);
#Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.
SELECT M.NOMBRE AS FAB, P.NOMBRE AS PROD, P.PRECIO AS PRECIO FROM MANUFACTURER M
JOIN PRODUCT P ON M.ID=P.ID_FABRICANTE 
WHERE P.PRECIO=(SELECT MAX(P2.PRECIO) FROM PRODUCT P2 WHERE P2.ID_FABRICANTE=M.ID);
#Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.
SELECT NOMBRE AS ROD , PRECIO FROM PRODUCT 
WHERE PRECIO >=(SELECT AVG(PRECIO) FROM PRODUCT); 
SELECT P.NOMBRE AS PROD, P.PRECIO FROM PRODUCT P
JOIN (SELECT M.NOMBRE AS FAB, AVG(PRECIO) AS PM FROM PRODUCT GROUP BY M.NOMBRE ) M ON P.ID_FABRICANTE=M.ID
WHERE P.PRECIO >= M.PM;
#Lista el nombre del producto más caro del fabricante Lenovo.

#Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.