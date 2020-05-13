-- sentencias de bases, tablas e insercion y modificacion de data en tablas
DROP DATABASE IF EXISTS libreria_cf;
CREATE DATABASE IF NOT EXISTS libreria_cf;

USE libreria_cf;

CREATE TABLE IF NOT EXISTS autores
(
autor_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(25) NOT NULL,
apellido VARCHAR(25) NOT NULL,
seudonimo VARCHAR(50) UNIQUE,
genero ENUM('M','F'), 
fecha_nacimiento DATE NOT NULL,
pais_origen VARCHAR(40) NOT NULL,
fecha_creacion datetime default Now()
);

CREATE TABLE libros(
libro_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
autor_id INT UNSIGNED NOT NULL,
titulo VARCHAR(50) NOT NULL,
descripcion varchar(250),
paginas INTEGER UNSIGNED DEFAULT 0,
fecha_publicacion date NOT NULL,
fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY(autor_id) REFERENCES autores(autor_id) ON DELETE CASCADE
);

alter TABLE libros add ventas int UNSIGNED not null DEFAULT 0;
alter table libros add stock int UNSIGNED DEFAULT 10;

CREATE TABLE usuarios(
usuario_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
nombre varchar(25) not null,
apellidos varchar(25),
username varchar(25) not NULL,
email varchar(50) not null,
fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO usuarios (nombre,apellidos, username,email)
values ('Roberto','Perdomo','rperdomo','rperdomo32@gmail.com'),
        ('codi','facilito','codifacilito','ayuda@codifacilito.com');

select * from usuarios;

INSERT INTO autores(nombre, apellido, genero, fecha_nacimiento, pais_origen)
VALUES ('Roberto','Perdomo', 'M', '1994-12-15', 'El Salvador'),
       ('Josue', 'Perdomo','M', '1996-6-15', 'El Salvador'),
       ('Marco','Perdomo', 'M', '2004-5-15', 'El Salvador'),
       ('Sarid','Perdomo', 'F', '2000-12-15', 'El Salvador'),
       ('Abigail','Perdomo', 'F', '1994-12-15', 'El Salvador');


INSERT INTO autores( nombre, apellido,seudonimo, genero, fecha_nacimiento, pais_origen)
VALUES ('Cayetano','Fuentes', 'SPastor Cayetano','m', '1994-12-15','El Salvador');


INSERT INTO libros(autor_id, titulo,descripcion,paginas,fecha_publicacion)
        VALUES  (6, 'Mateo', 'libro santo', 200, '2020-1-31'),
                (2, 'Marcos', 'libro santo', 200, '2010-2-1'),
                (3, 'Lucas', 'libro santo', 200, '2019-3-2'),
                (4, 'Juan', 'libro santo', 200, '2018-4-4'),
                (5, 'Genesis', 'libro santo', 200, '2017-5-5'),
                (1, 'Exodo', 'libro santo', 200, '2016-7-6'),
                (2, 'Levitco', 'libro santo', 200, '2015-9-2'),                
                (3, 'Deuteronomio compresinva', 'libro para primer ciclo', 300, '2019-10-10'),
                (4, 'Lenguaje', 'libro para primer ciclo', 300, '2019-10-10'),
                (5, 'sociales ', 'libro para primer ciclo', 0, '2019-10-10');

SELECT * FROM autores;
SELECT * FROM libros;

