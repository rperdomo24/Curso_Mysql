-- Obtener todos los libros escritos por autores que cuenten con un seudónimo.
SELECT *
from libros
Where autor_id = (select autor_id FROM autores where seudonimo IS NOT NULL);

-- Obtener el título de todos los libros publicados en el año actual cuyos autores poseen un pseudónimo.
SELECT titulo
FROM libros
WHERE autor_id = (SELECT autor_id FROM autores where seudonimo IS NOT NULL)
AND DAYOFYEAR(fecha_creacion) = DAYOFYEAR(NOW());

-- Obtener todos los libros escritos por autores que cuenten con un seudónimo 
-- y que hayan nacido ante de 1965.
SELECT *
from libros
Where autor_id = (
    select autor_id 
    FROM autores 
    where seudonimo IS NOT NULL
    AND fecha_nacimiento BETWEEN '1965-01-01' and '1965-12-31'
);
