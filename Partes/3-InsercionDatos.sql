-- INCERCION DE DATOS EN SCRIPT (el resto se hizo con importacion)

Start transaction ;
INSERT INTO escuderias (Nombre,Pais,Fundacion,Camp_constr)
VALUES
('Mercedes','Alemania',1954,8),
('Ferrari','Italia',1950,16),
('Red Bull','Austria',2005,4),
('McLaren','Reino Unido',1963,8);
Savepoint SP1;
INSERT INTO escuderias (Nombre,Pais,Fundacion,Camp_constr)
VALUES
('Williams','Reino Unido',1977,9),
('Renault','Francia',1977,2),
('Aston Martin','Reino Unido',1959,0),
('Alfa Romeo','Suiza',1910,0),
('AlphaTauri','Italia',2006,0);
Savepoint SP2;
INSERT INTO escuderias (Nombre,Pais,Fundacion,Camp_constr)
VALUES
('Alpine','Francia',2021,0),
('Haas','Estados Unidos',2016,0),
('Sauber','Suiza',1970,0),
( 'Force India', 'india', '2007', 0);
commit;

Start transaction ;
INSERT INTO historial_equipos (piloto, Escuderia, temporada)
SELECT id_piloto, escud, YEAR(NOW())
FROM pilotos
WHERE estado = '1';
-- rollback;
commit;

Start transaction ;
insert into pilotos (nombre, apellidos, pais, FEcha_Nac, escud, puntos,torneosganados, estado)
Values ( 'Oliver', 'Bearman','Reino Unido', '2005-05-08',2,0,0, '0');

commit;

Start transaction ;
delete from polotos where id_piloto = 2;
rollback;


