create VIEW prestamos_usuarios_vw AS
select 
    usuarios.usuario_id,
    usuarios.nombre,
    usuarios.email,
    usuarios.username,
    COUNT(usuarios.usuario_id) as total_prestamos
from usuarios
INNER JOIN libros_usuarios on usuarios.usuario_id = libros_usuarios.usuario_id
group by usuarios.usuario_id;


create or REPLACE VIEW prestamos_usuarios_vw AS
select 
    usuarios.usuario_id,
    usuarios.nombre,
    usuarios.email,
    usuarios.username,
    COUNT(usuarios.usuario_id) as total_prestamos
from usuarios
INNER JOIN libros_usuarios on usuarios.usuario_id = libros_usuarios.usuario_id
    AND libros_usuarios.fecha_creacion >= curdate() - interval 5 day
group by usuarios.usuario_id;