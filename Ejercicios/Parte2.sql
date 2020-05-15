--Obtener a todos los usuarios que han realizado un préstamo en los últimos diez días.
select DISTINCT concat(usuarios.nombre, ' ', usuarios.apellidos) as nombre_usuario
FROM usuarios
INNER JOIN libros_usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id
    AND libros_usuarios.fecha_creacion >= curdate() - interval 10 day; 

--Obtener a todos los usuarios que no ha realizado ningún préstamo.
select DISTINCT 
usuarios.usuario_id,
concat(usuarios.nombre, ' ', usuarios.apellidos) as nombre_usuario,
libros_usuarios.fecha_creacion 
FROM usuarios
LEFT join libros_usuarios on usuarios.usuario_id = libros_usuarios.usuario_id 
    where libros_usuarios.fecha_creacion is null;

--Listar de forma descendente a los cinco usuarios con más préstamos.
select  
concat(usuarios.nombre, ' ', usuarios.apellidos) as nombre_usuario,
count(libros_usuarios.usuario_id) as cantidad_prestamos
FROM usuarios
LEFT join libros_usuarios on usuarios.usuario_id = libros_usuarios.usuario_id 
GROUP BY usuarios.usuario_id 
HAVING cantidad_prestamos <> 0
order BY cantidad_prestamos desc 
limit 5;

--Listar 5 títulos con más préstamos en los últimos 30 días.
select 
libros.titulo,
COUNT(libros_usuarios.libro_id)  as cantidad_prestamos
from libros
    inner join libros_usuarios ON libros.libro_id = libros_usuarios.libro_id
    and libros_usuarios.fecha_creacion >= curdate() - INTERVAL 30 day
group by libros.libro_id
ORDER by cantidad_prestamos desc
limit 5;

--Obtener el título de todos los libros que no han sido prestados.
select 
libros.titulo
from libros
    left join libros_usuarios ON libros.libro_id = libros_usuarios.libro_id
    WHERE libros_usuarios.libro_id is null;

--Obtener la cantidad de libros prestados el día de hoy.
select 
libros.titulo,
COUNT(libros_usuarios.libro_id)
from libros
    left join libros_usuarios ON libros.libro_id = libros_usuarios.libro_id
    WHERE libros_usuarios.libro_id is not null
    and DATE(libros_usuarios.fecha_creacion) = curdate()
    group by libros_usuarios.libro_id;

--Obtener la cantidad de libros prestados por el autor con id 1.
select 
count(usuario_id)
from libros_usuarios
where usuario_id = 1;

--Obtener el nombre completo de los cinco autores con más préstamos.
-- libros_usuarios
-- libro
-- autores
select
au.autor_id,
li.libro_id,
concat(au.nombre,' ',au.apellido) as nombre_completo,
count(liusu.libro_id) total_prestamo
FROM libros_usuarios as liusu
INNER JOIN libros as li ON liusu.libro_id = li.libro_id
INNER JOIN autores as au ON li.autor_id = au.autor_id
group by li.autor_id 
ORDER by total_prestamo desc
limit 5;

--Obtener el título del libro con más préstamos esta semana.
select 
libros.titulo,
COUNT(libros_usuarios.libro_id) as total_prestamo
from libros
    left join libros_usuarios ON libros.libro_id = libros_usuarios.libro_id
    WHERE libros_usuarios.libro_id is not null
    and DATE(libros_usuarios.fecha_creacion) >= (curdate() - INTERVAL 7 day)
    group by libros_usuarios.libro_id
    order by  total_prestamo desc;
