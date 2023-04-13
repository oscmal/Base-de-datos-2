-- Eliminar la base de datos si ya existe
DROP DATABASE IF EXISTS "desafio2-oscar-maldonado-123";
-- Crear y conectarse a la base de datos
CREATE DATABASE "desafio2-oscar-maldonado-123";
\c "desafio2-oscar-maldonado-123";

-- Crear la tabla
CREATE TABLE IF NOT EXISTS INSCRITOS(cantidad INT, fecha DATE, fuente VARCHAR);
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 99, '01/08/2021', 'Página' );

--1 ¿Cuántos registros hay?
SELECT COUNT(*) FROM INSCRITOS;

-- 2¿Cuántos inscritos hay en total?
SELECT SUM(cantidad) FROM INSCRITOS;

--3 ¿Cuál o cuáles son los registros de mayor antigüedad?
-- HINT: ocupar subconsultas
SELECT * FROM INSCRITOS WHERE fecha =(SELECT MIN(fecha) FROM INSCRITOS);

-- 4¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de  ahora en adelante)
SELECT fecha, SUM(cantidad) as Incritos FROM INSCRITOS GROUP BY fecha;

-- 5¿Cuántos inscritos hay por fuente?
SELECT fuente, SUM(cantidad) as Incritos FROM INSCRITOS GROUP BY fuente;

--6 ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se  inscribieron en ese día?
SELECT fecha, SUM(cantidad) as Incritos FROM INSCRITOS GROUP BY fecha ORDER BY Incritos DESC LIMIT 1;

-- 7¿Qué días se inscribieron la mayor cantidad de personas utilizando el blog y cuántas  personas fueron?
-- HINT: si hay más de un registro, tomar el primero
SELECT fecha, SUM(cantidad) as Incritos FROM INSCRITOS WHERE fuente = 'Blog' GROUP BY fecha ORDER BY SUM(cantidad) DESC LIMIT 1;

-- 8¿Cuántas personas en promedio se inscriben en un día?
SELECT SUM(cantidad)/COUNT( distinct (fecha)) as promedio FROM INSCRITOS;

--9 ¿Qué días se inscribieron más de 50 personas?
SELECT fecha, SUM(cantidad) as inscritos FROM INSCRITOS GROUP BY fecha HAVING SUM(cantidad) > 50;

-- 10¿Cuántas personas se registraron en promedio cada día a partir del tercer día?
-- HINT: ingresa manualmente la fecha del tercer día
SELECT fecha, ROUND(AVG(CANTIDAD),1)as promedio FROM INSCRITOS GROUP BY fecha HAVING fecha >= '2021-01-03' ORDER BY fecha; 