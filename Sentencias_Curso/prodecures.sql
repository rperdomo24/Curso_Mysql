delimiter  //
CREATE PROCEDURE prestamo(usuario_id int, libro_id int, out cantidad int)
BEGIN

    SET cantidad = (select stock from libros where libros.libro_id = libro_id);

    IF cantidad > 0 THEN

        INSERT INTO libros_usuarios(libro_id, usuario_id) VALUES(libro_id,usuario_id);
        UPDATE libros SET stock = stock -1 where libros.libro_id = libro_id;    
        SET cantidad =cantidad - 1;
   
    ELSE

        SELECT 'NO ES POSIBLE REALIZAR EL PRESTAMO' as mensaje_error;
    END IF;
END//
delimiter ;

delimiter  //
CREATE PROCEDURE tipo_lector(usuario_id int)
BEGIN
    set @cantidad = (select count(*) from libros_usuarios
                    where libros_usuarios.usuario_id = usuario_id);

CASE
    WHEN @cantidad >20 THEN
        select 'fanatico' as mensaje;
    WHEN @cantidad > 10 and @cantidad <20 THEN
        select 'usuario aficionado' as mensaje;
    when @cantidad > 5 and @cantidad <10 THEN
        SELECT 'promedio' as mensaje;
    ELSE
        SELECT "nuevo" as mensaje;
END CASE;
END//
delimiter ;
-- enlistar procedure
--  SELECT ROUTINE_SCHEMA, ROUTINE_NAME FROM information_schema.routines where ROUTINE_SCHEMA='libreria_cf';

delimiter  //
CREATE PROCEDURE libros_azar()
BEGIN
    set @iteracion =0;

    WHILE @iteracion< 5 DO

    SELECT libro_id, titulo from libros ORDER BY RAND() limit 1;
    SET @iteracion = @iteracion +1;
    END WHILE;
END//
delimiter ;

delimiter  //
CREATE PROCEDURE libros2()
BEGIN
    set @iteracion =0;

    REPEAT 

    SELECT libro_id, titulo from libros ORDER BY RAND() limit 1;
    SET @iteracion = @iteracion +1;
    
    UNTIL @iteracion >= 5
    END REPEAT;
END//
delimiter ;

--sp con transaccion

delimiter  //
CREATE PROCEDURE prestamo(usuario_id int, libro_id int)
BEGIN

    DECLARE EXIT HANDLER FOR SQLEXCEPTION -- ocurre un error
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    INSERT INTO libros_usuarios(libro_id, usuario_id) VALUES(libro_id,usuario_id);
    UPDATE libros SET stock = stock -1 where libros.libro_id = libro_id;    
    
    COMMIT;
   
END//
delimiter ;