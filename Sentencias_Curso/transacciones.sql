
START TRANSACTION;

SET @libro_id=4, @usuario_id=3;

update libros set stock = stock -1 where libro_id= @libro_id;
select stock from libros where libro_id =@libro_id;

INSERT INTO libros_usuarios(libro_id,usuario_id) VALUES (@libro_id,@usuario_id);
SELECT * from libros_usuarios;

commit;