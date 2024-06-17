 -- TRIGGERS

-- TRIGGER PARA SUMAR PUNTOS DESPUES DE CADA CARRERA
DELIMITER //
CREATE TRIGGER tr_sumapuntos
after INSERT ON resultados
FOR EACH ROW
BEGIN
    IF NEW.Primer_puesto =  pilotos.id_piloto  THEN
        UPDATE pilotos 
        SET puntos = puntos + 25
        WHERE id_piloto = NEW.Primer_puesto;
	ELSEIF NEW.Seg_puesto =  pilotos.id_piloto  THEN
        UPDATE pilotos 
        SET puntos = puntos + 18
        WHERE id_piloto = NEW.Seg_puesto;
	ELSEIF NEW.Terc_puesto =  pilotos.id_piloto  THEN
        UPDATE pilotos 
        SET puntos = puntos + 15
        WHERE id_piloto = NEW.Terc_puesto;
	ELSEIF NEW.Cuarto_puesto =  pilotos.id_piloto  THEN
        UPDATE pilotos 
        SET puntos = puntos + 12
        WHERE id_piloto = NEW.Cuarto_puesto;
	ELSEIF NEW.Quinto_puesto =  pilotos.id_piloto  THEN
        UPDATE pilotos 
        SET puntos = puntos + 10
        WHERE id_piloto = NEW.Quinto_puesto;
	ELSEIF NEW.Sexto_puesto =  pilotos.id_piloto  THEN
        UPDATE pilotos 
        SET puntos = puntos + 8
        WHERE id_piloto = NEW.Sexto_puesto;
	ELSEIF NEW.Sept_puesto =  pilotos.id_piloto  THEN
        UPDATE pilotos 
        SET puntos = puntos + 6
        WHERE id_piloto = NEW.Sept_puesto;
	ELSEIF NEW.Octav_puesto =  pilotos.id_piloto  THEN
        UPDATE pilotos 
        SET puntos = puntos + 4
        WHERE id_piloto = NEW.Octav_puesto;
	ELSEIF NEW.Noven_puesto =  pilotos.id_piloto  THEN
        UPDATE pilotos 
        SET puntos = puntos + 2
        WHERE id_piloto = NEW.Noven_puesto;
	ELSEIF NEW.Decim_puesto =  pilotos.id_piloto  THEN
        UPDATE pilotos 
        SET puntos = puntos + 1
        WHERE id_piloto = NEW.Decim_puesto;
	END IF;

	IF NEW.Vuelta_rapida =  pilotos.id_piloto THEN
        UPDATE pilotos 
        SET puntos = puntos + 1
        WHERE id_piloto = NEW.Vuelta_rapida;
	END IF;
END; //
DELIMITER ;

-- TRIGGER PARA BK DE SUMA DE PUNTOS 

Create table bk_pilotos
(select id_piloto,nombre,apellidos,escud,puntos from pilotos 
where estado=1);

Alter TABLE bk_pilotos
ADD F_cambio date;


DELIMITER //
CREATE TRIGGER tr_bkpuntos
BEFORE UPDATE ON pilotos
FOR EACH ROW
BEGIN
    UPDATE bk_pilotos
    SET puntos = OLD.puntos,
        F_cambio = CURDATE()
    WHERE id_piloto = NEW.id_piloto;
END; //
DELIMITER ;


