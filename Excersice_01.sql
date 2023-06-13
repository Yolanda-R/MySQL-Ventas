CREATE DATABASE Pruebas;
USE Pruebas;
CREATE TABLE Usuarios(
ID INT PRIMARY KEY AUTO_INCREMENT,
USUARIO VARCHAR(20),
NOMBRE VARCHAR(20),
SEXO VARCHAR(1),
NIVEL TINYINT,
EMAIL VARCHAR(50),
TELEFONO VARCHAR(20),
MARCA VARCHAR(20),
COMPAÑIA VARCHAR(20),
SALDO FLOAT,
ACTIVO BOOLEAN
);
DROP TABLE USUARIOS;
SELECT * FROM USUARIOS;

INSERT INTO USUARIOS
VALUES ('1','BRE2271','BRENDA','M','2','brenda@live.com','655-330-5736','SAMSUNG','IUSACELL','100','1'),
('2','OSC4677','OSCAR','H','3','oscar@gmail.com','655-143-4181','LG','TELCEL','0','1'),
('3','JOS7086','JOSE','H','3','francisco@gmail.com','655-143-3922','NOKIA','MOVISTAR','150','1'),
('4','LUI6115','LUIS','H','0','enrique@outlook.com','655-137-1279','SAMSUNG','TELCEL','50','1'),
('5','LUI7072','LUIS','H','1','luis@hotmail.com','655-100-8260','NOKIA','IUSACELL','50','0'),
('6','DAN2832','DANIEL','H','0','daniel@outlook.com','655-145-2586','SONY','UNEFON','100','1'),
('7','JAQ5351','JAQUELINE','M','0','jaqueline@outlook.com','655-330-5514','BLACKBERRY','AXEL','0','1'),
('8','ROM6520','ROMAN','H','2','roman@gmail.com','655-330-3263','LG','IUSACELL','50','1'),
('9','BLA9739','BLAS','H','0','blas@hotmail.com','655-330-3871','LG','UNEFON','100','1'),
('10','JES4752','JESSICA','M','1','jessica@hotmail.com','655-143-6861','SAMSUNG','TELCEL','500','1'),
('11','DIA6570','DIANA','M','1','diana@live.com','655-143-3952','SONY','UNEFON','100','0'),
('12','RIC8283','RICARDO','H','2','ricardo@hotmail.com','655-145-6049','MOTOROLA','IUSACELL','150','1'),
('13','VAL6882','VALENTINA','M','0','valentina@live.com','655-137-4253','BLACKBERRY','AT&T','50','0'),
('14','BRE8106','BRENDA','M','3','brenda2@gmail.com','655-100-1351','MOTOROLA','NEXTEL','150','1'),
('15','LUC4982','LUCIA','M','3','lucia@gmail.com','655-145-4992','BLACKBERRY','IUSACELL','0','1'),
('16','JUA2337','JUAN','H','0','juan@outlook.com','655-100-6517','SAMSUNG','AXEL','0','0'),
('17','ELP2984','ELPIDIO','H','1','elpidio@outlook.com','655-145-9938','MOTOROLA','MOVISTAR','500','1'),
('18','JES9640','JESSICA','M','3','jessica2@live.com','655-330-5143','SONY','IUSACELL','200','1'),
('19','LET4015','LETICIA','M','2','leticia@yahoo.com','655-143-4019','BLACKBERRY','UNEFON','100','1'),
('20','LUI1076','LUIS','H','3','luis2@live.com','655-100-5085','SONY','UNEFON','150','1'),
('21','HUG5441','HUGO','H','2','hugo@live.com','655-137-3935','MOTOROLA','AT&T','500','1');
# Listar los nombres de los usuarios
SELECT NOMBRE FROM USUARIOS;
#Calcular el saldo máximo de los usuarios de sexo “Mujer”
SELECT MAX(SALDO) FROM USUARIOS WHERE SEXO='M';
#Listar nombre y teléfono de los usuarios con teléfono NOKIA, BLACKBERRY o SONY
SELECT NOMBRE, TELEFONO FROM USUARIOS
WHERE MARCA IN( 'NOKIA', 'BLACKBERRY','SONY');
#Contar los usuarios sin saldo o inactivos
SELECT COUNT(*) FROM USUARIOS WHERE SALDO= 0 OR ACTIVO =0;
#Listar el login de los usuarios con nivel 1, 2 o 3
SELECT USUARIO FROM USUARIOS WHERE NIVEL IN(1,2,3);
#Listar los números de teléfono con saldo menor o igual a 300
SELECT TELEFONO FROM USUARIOS WHERE SALDO <=300;
#Calcular la suma de los saldos de los usuarios de la compañia telefónica NEXTEL
SELECT SUM(SALDO) FROM USUARIOS WHERE COMPAÑIA = 'NEXTEL';
#Contar el número de usuarios por compañía telefónica
SELECT COMPAÑIA,COUNT(*) FROM USUARIOS GROUP BY COMPAÑIA;
#Contar el número de usuarios por nivel
SELECT NIVEL, COUNT(*) FROM USUARIOS GROUP BY NIVEL;
#Listar el login de los usuarios con nivel 2
SELECT USUARIO FROM USUARIOS WHERE NIVEL= 2;
#Mostrar el email de los usuarios que usan gmail

SELECT EMAIL FROM USUARIOS WHERE EMAIL LIKE '%GMAIL%';

#Listar nombre y teléfono de los usuarios con teléfono LG, SAMSUNG o MOTOROLA
SELECT NOMBRE, TELEFONO FROM USUARIOS WHERE MARCA IN('LG','SAMSUNG','MOTOROLA');

#Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca LG o SAMSUNG
SELECT NOMBRE, MARCA,TELEFONO FROM USUARIOS WHERE MARCA NOT IN('LG','SAMSUNG');
##Listar el login y teléfono de los usuarios con compañia telefónica que no sea TELCEL
SELECT USUARIO, TELEFONO FROM USUARIOS WHERE COMPAÑIA NOT IN(
'TELCEL');
#Calcular el saldo promedio de los usuarios que tienen teléfono marca NOKIA
SELECT AVG(SALDO) FROM USUARIOS WHERE MARCA = 'NOKIA';
#Listar el login y teléfono de los usuarios con compañia telefónica IUSACELL o AXEL
SELECT USUARIO,TELEFONO FROM USUARIOS WHERE COMPAÑIA IN('IUSACELL','AXEL'); 
#Mostrar el email de los usuarios que no usan yahoo

SELECT EMAIL FROM USUARIOS WHERE EMAIL NOT LIKE '%YAHOO.COM';
#Listar el login y teléfono de los usuarios con compañia telefónica que no sea TELCEL o IUSACELL
SELECT USUARIO,TELEFONO FROM USUARIOS WHERE MARCA NOT IN('TELECEL','IUSACELL');
#Listar el login y teléfono de los usuarios con compañia telefónica UNEFON
SELECT USUARIO, TELEFONO FROM USUARIOS WHERE MARCA = 'UNEFON';
#Listar las diferentes marcas de celular en orden alfabético descendentemente
SELECT DISTINCT MARCA FROM USUARIOS ORDER BY MARCA DESC; 
#Listar las diferentes compañias en orden alfabético aleatorio
SELECT DISTINCT COMPAÑIA FROM USUARIOS ORDER BY rand();
#Listar el login de los usuarios con nivel 0 o 2
SELECT USUARIO FROM USUARIOS WHERE NIVEL IN(0,2);
#Calcular el saldo promedio de los usuarios que tienen teléfono marca LG
SELECT AVG(SALDO) FROM USUARIOS WHERE MARCA ='LG';
#Listar el login de los usuarios con nivel 1 o 3
SELECT USUARIO,NIVEL FROM USUARIOS WHERE NIVEL IN( 1, 3);
#Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca BLACKBERRY
SELECT NOMBRE,TELEFONO FROM USUARIOS WHERE MARCA <> 'BLACKBERRY';
#Listar el login de los usuarios con nivel 3
SELECT USUARIO,NIVEL FROM USUARIOS WHERE NIVEL = 3;
#Listar el login de los usuarios con nivel 0
SELECT USUARIO FROM USUARIOS WHERE NIVEL = 0;
#Listar el login de los usuarios con nivel 1
SELECT USUARIO FROM USUARIOS WHERE NIVEL =1;
#Contar el número de usuarios por sexo
SELECT COUNT(USUARIO), SEXO FROM USUARIOS GROUP BY SEXO;
#Listar el login y teléfono de los usuarios con compañia telefónica AT&T
SELECT USUARIO,TELEFONO FROM USUARIOS WHERE COMPAÑIA= 'AT&T'; 
#Listar las diferentes compañias en orden alfabético descendentemente
SELECT DISTINCT COMPAÑIA FROM USUARIOS ORDER BY COMPAÑIA DESC; 
#Listar el logn de los usuarios inactivos
SELECT USUARIO, ACTIVO FROM USUARIOS WHERE ACTIVO = 0;
#Listar los números de teléfono sin saldo
SELECT TELEFONO,SALDO FROM USUARIOS WHERE SALDO =0;
#Calcular el saldo mínimo de los usuarios de sexo “Hombre”
SELECT MIN(SALDO),SEXO FROM USUARIOS WHERE SEXO = 'H';
#Listar los números de teléfono con saldo mayor a 300
SELECT TELEFONO,SALDO FROM USUARIOS WHERE SALDO > 300;


USE PRUEBAS;
#Contar el número de usuarios por marca de teléfono
SELECT MARCA,COUNT(MARCA)  FROM USUARIOS GROUP BY MARCA; 
#Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca LG
SELECT NOMBRE,  TELEFONO FROM USUARIOS WHERE MARCA <> 'LG';
#Listar las diferentes compañias en orden alfabético ascendentemente
SELECT DISTINCT COMPAÑIA FROM USUARIOS ORDER BY COMPAÑIA ASC;
#Calcular la suma de los saldos de los usuarios de la compañia telefónica UNEFON
SELECT SUM(SALDO) FROM USUARIOS WHERE COMPAÑIA = 'UNEFON';
#Mostrar el email de los usuarios que usan hotmail
SELECT EMAIL FROM USUARIOS WHERE EMAIL LIKE '%HOTMAIL%';
SELECT * FROM USUARIOS;
#Listar los nombres de los usuarios sin saldo o inactivos
SELECT NOMBRE,ACTIVO,SALDO FROM USUARIOS WHERE SALDO= 0 OR ACTIVO =0;
#Listar el login y teléfono de los usuarios con compañia telefónicaIUSACELL o TELCEL
SELECT USUARIO, TELEFONO FROM USUARIOS WHERE COMPAÑIA IN ("IUSACELL", "TELCEL");
#Listar las diferentes marcas de celular en orden alfabético ascendentemente
SELECT DISTINCT MARCA FROM USUARIOS ORDER BY MARCA ASC; 
#Listar las diferentes marcas de celular en orden alfabético aleatorio
SELECT DISTINCT MARCA FROM USUARIOS ORDER BY RAND();
#Listar el login y teléfono de los usuarios con compañia telefónica IUSACELL o UNEFON
SELECT USUARIO, TELEFONO FROM USUARIOS WHERE COMPAÑIA IN ('IUSACELL','UNEFON');
#Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca MOTOROLA o NOKIA
SELECT NOMBRE, TELEFONO FROM USUARIOS WHERE MARCA NOT IN('MOTOROLA','NOKIA');
#Calcular la suma de los saldos de los usuarios de la compañia telefónica TELCEL
SELECT SUM(SALDO) FROM USUARIOS WHERE COMPAÑIA = 'TELCEL';