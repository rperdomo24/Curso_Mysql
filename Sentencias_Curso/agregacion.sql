-- Ejemplos de funciones de agregacion
-- con sentencias multiples

SELECT concat(nombre, ' ', apellido) as nombre_completo, " " as email, pais_origen from autores
UNION
SELECT  CONCAT(nombre, ' ', apellidos) as nombre_completo, email as email," " from usuarios;

SELECT avg(ventas) as ventas from libros; --  365.4000

set @promedio = (SELECT avg(ventas) as ventas from libros);

SELECT 
autor_id, titulo
FROM libros 
GROUP BY autor_id 
HAVING SUM(ventas) > @promedio;

SELECT 
autor_id
FROM libros 
GROUP BY autor_id 
HAVING SUM(ventas) > (SELECT avg(ventas) as ventas from libros);

SELECT CONCAT(nombre,' ', apellido) AS Nombre_Completo
from autores
WHERE autor_id IN (
    SELECT 
    autor_id
    FROM libros 
    GROUP BY autor_id 
    HAVING SUM(ventas) > (
        SELECT avg(ventas) as ventas 
        from libros
        )
);

/*Disponible 
No disponible
mateo se encuentra 
*/
select IF(
    EXISTS(SELECT libro_id FROM libros where titulo = 'mateo'),
    'Disponible',
    'No Disponible') AS Mensaje;
