select 
    li.titulo,
    concat(au.nombre, ' ', au.apellido) as nombre_autor,
    li.fecha_creacion
from libros as li
INNER JOIN autores as au on li.autor_id = au.autor_id;

-- utilizando using
select 
    li.titulo,
    concat(au.nombre, ' ', au.apellido) as nombre_autor,
    li.fecha_creacion
from libros as li
INNER JOIN autores as au USING(autor_id);

select 
    li.titulo,
    concat(au.nombre, ' ', au.apellido) as nombre_autor,
    li.fecha_creacion
from libros as li
INNER JOIN autores as au on li.autor_id = au.autor_id
and au.seudonimo is not null;


--lef join 
--usuarios =a
--libros_usuarios = b

-- todos los datos 
SELECT 
    CONCAT(nombre,' ',apellidos) as nombre_completo,
    libros_usuarios.libro_id
from usuarios
LEFT JOIN libros_usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id;

-- solo los que tienen libros
SELECT 
    CONCAT(nombre,' ',apellidos) as nombre_completo,
    libros_usuarios.libro_id
from usuarios
LEFT JOIN libros_usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id
where libros_usuarios.libro_id is not null;
-- los que no tienen libros
SELECT 
    CONCAT(nombre,' ',apellidos) as nombre_completo,
    libros_usuarios.libro_id
from usuarios
LEFT JOIN libros_usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id
where libros_usuarios.libro_id is null;

--right JOIN
--usuarios =b
--libros_usuarios = a
SELECT 
    CONCAT(nombre,' ',apellidos) as nombre_completo,
    libros_usuarios.libro_id
from libros_usuarios
RIGHT JOIN usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id
where libros_usuarios.libro_id is null;

SELECT 
    CONCAT(nombre,' ',apellidos) as nombre_completo,
    libros_usuarios.libro_id
from libros_usuarios
RIGHT JOIN usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id;

--usuarios
--libros_usuarios
-- libros
--autores 
-- obtener el nombre completo user que hayan prestado un libro
-- el libro debio de ser escrito con un autor con seudonimo
-- el prestamo debio de ser ealizado el dia de hoy

SELECT DISTINCT
concat(usu.nombre,' ',usu.apellidos) AS nombre_completo,
li.titulo
FROM usuarios AS usu 
INNER JOIN libros_usuarios AS li_usu
ON usu.usuario_id = li_usu.usuario_id 
INNER JOIN libros AS li
ON li.libro_id = li_usu.libro_id
INNER JOIN autores AS aut
ON aut.autor_id = li.autor_id
WHERE li_usu.libro_id != 0 
AND aut.seudonimo IS NOT NULL
AND DATE(li_usu.fecha_creacion) = curdate();

