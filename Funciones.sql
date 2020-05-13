

/*create FUNCTION agregar_dias(fecha date,dias int)
RETURNS DATE 
BEGIN
    RETURN  fecha + INTERVAL dias DAY;
END //
*/
DELIMITER //
CREATE FUNCTION obtener_paginas()
RETURNS INT
BEGIN 
 SET @paginas = (SELECT (round(rand()*100)*4));
 RETURN @paginas;
END//

DELIMITER ;
update libros set paginas = obtener_paginas();

DELIMITER //
create FUNCTION obtener_ventas()
RETURNS INT
BEGIN 
    set @paginas = (select( round(rand()*100)*6));
RETURN @paginas;
END //
DELIMITER ;
update libros set ventas = obtener_ventas();