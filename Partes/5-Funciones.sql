-- FUNCIONES 

-- FUNCION PARA SABER CUANTOS PODIOS HIZO UN PIOLOTO 
select count(nombre) from pilotos 
join resultados
on pilotos.Id_piloto= resultados.Primer_puesto or pilotos.Id_piloto= resultados.Seg_puesto or pilotos.Id_piloto= resultados.terc_puesto 
where nombre like = % %


DELIMITER //

CREATE FUNCTION F_Podios (P_Nombre varchar (20), P_apellido varchar (20))
RETURNS int
DETERMINISTIC
BEGIN
    DECLARE V_Podios int;    
    select count(nombre)  into V_Podios from pilotos
join resultados
on pilotos.Id_piloto= resultados.Primer_puesto or pilotos.Id_piloto= resultados.Seg_puesto or pilotos.Id_piloto= resultados.terc_puesto 
where nombre like concat('%', P_nombre, '%') and Apellidos like concat('%',P_apellido , '%');
    
    RETURN V_podios ;
END //

-- FUNCION PARA SABER CUANTOS CAMPEONES TIENE UNA ESCUDERIA 

DELIMITER //

CREATE FUNCTION F_PilotosCampXEsc (P_Escud VARCHAR(20)) RETURNS int
DETERMINISTIC
BEGIN
    DECLARE V_Resultado INT;    
    SELECT COUNT(Id_piloto) INTO V_Resultado
    FROM pilotos 
    JOIN escuderias ON pilotos.escud = escuderias.id_esc
    WHERE escuderias.nombre LIKE CONCAT('%', P_Escud, '%')
    AND pilotos.torneosganados > 0;    
    RETURN V_Resultado ;
END //

-- funcion para agregar mas eficientemente resultados 

DELIMITER $$

CREATE FUNCTION fn_InsertarResult (
    PCarrera INT,
    Pprimer_puesto VARCHAR(20), 
    Pseg_puesto VARCHAR(20),  
    Pterc_puesto VARCHAR(20), 
    Pcuarto_puesto VARCHAR(20), 
    Pquinto_puesto VARCHAR(20), 
    Psexto_puesto VARCHAR(20), 
    Psept_puesto VARCHAR(20),  
    Poctav_puesto VARCHAR(20), 
    Pnoven_puesto VARCHAR(20), 
    Pdecim_puesto VARCHAR(20), 
    Pvuelta_rapida VARCHAR(20)
) RETURNS INT
deterministic
BEGIN
    DECLARE Id_primer_puesto INT;
    DECLARE Id_seg_puesto INT;
    DECLARE Id_terc_puesto INT;
    DECLARE Id_cuarto_puesto INT;
    DECLARE Id_quinto_puesto INT;
    DECLARE Id_sexto_puesto INT;
    DECLARE Id_sept_puesto INT;
    DECLARE Id_octav_puesto INT;
    DECLARE Id_noven_puesto INT;
    DECLARE Id_decim_puesto INT;
    DECLARE Id_vuelta_rapida INT;

    SELECT 
	(SELECT Id_piloto FROM pilotos WHERE Nombre LIKE CONCAT('%', Pprimer_puesto, '%') OR Apellidos LIKE CONCAT('%', Pprimer_puesto, '%') LIMIT 1) INTO Id_primer_puesto;
	(SELECT Id_piloto FROM pilotos WHERE Nombre LIKE CONCAT('%', Pseg_puesto, '%') OR Apellidos LIKE CONCAT('%', Pseg_puesto, '%') LIMIT 1) INTO Id_seg_puesto;
	(SELECT Id_piloto FROM pilotos WHERE Nombre LIKE CONCAT('%', Pterc_puesto, '%') OR Apellidos LIKE CONCAT('%', Pterc_puesto, '%') LIMIT 1) INTO Id_terc_puesto;
	(SELECT Id_piloto FROM pilotos WHERE Nombre LIKE CONCAT('%', Pcuarto_puesto, '%') OR Apellidos LIKE CONCAT('%', Pcuarto_puesto, '%') LIMIT 1) INTO Id_cuarto_puesto;
	(SeLECT Id_piloto FROM pilotos WHERE Nombre LIKE CONCAT('%', Pquinto_puesto, '%') OR Apellidos LIKE CONCAT('%', Pquinto_puesto, '%') LIMIT 1) INTO Id_quinto_puesto;
	(SELECT Id_piloto FROM pilotos WHERE Nombre LIKE CONCAT('%', Psexto_puesto, '%') OR Apellidos LIKE CONCAT('%', Psexto_puesto, '%') LIMIT 1) INTO Id_sexto_puesto;
	(SELECT Id_piloto FROM pilotos WHERE Nombre LIKE CONCAT('%', Psept_puesto, '%') OR Apellidos LIKE CONCAT('%', Psept_puesto, '%') LIMIT 1) INTO Id_sept_puesto;
	(SELECT Id_piloto FROM pilotos WHERE Nombre LIKE CONCAT('%', Poctav_puesto, '%') OR Apellidos LIKE CONCAT('%', Poctav_puesto, '%') LIMIT 1) INTO Id_octav_puesto;
	(SELECT Id_piloto FROM pilotos WHERE Nombre LIKE CONCAT('%', Pnoven_puesto, '%') OR Apellidos LIKE CONCAT('%', Pnoven_puesto, '%') LIMIT 1) INTO Id_noven_puesto;
	(SELECT Id_piloto FROM pilotos WHERE Nombre LIKE CONCAT('%', Pdecim_puesto, '%') OR Apellidos LIKE CONCAT('%', Pdecim_puesto, '%') LIMIT 1) INTO Id_decim_puesto;
	(SELECT Id_piloto FROM pilotos WHERE Nombre LIKE CONCAT('%', Pvuelta_rapida, '%') OR Apellidos LIKE CONCAT('%', Pvuelta_rapida, '%') LIMIT 1) INTO Id_vuelta_rapida;

    INSERT INTO resultados (
        carrera,
        Primer_puesto,
        Seg_puesto,
        Terc_puesto,
        Cuarto_puesto,
        Quinto_puesto,
        Sexto_puesto,
        Sept_puesto,
        Octav_puesto,
        Noven_puesto,
        Decim_puesto,
        Vuelta_rapida
    ) VALUES (
        PCarrera,
        Id_primer_puesto,
        Id_seg_puesto,
        Id_terc_puesto,
        Id_cuarto_puesto,
        Id_quinto_puesto,
        Id_sexto_puesto,
        Id_sept_puesto,
        Id_octav_puesto,
        Id_noven_puesto,
        Id_decim_puesto,
        Id_vuelta_rapida
    );

    RETURN LAST_INSERT_ID();  -- Retorna el último ID insertado en la tabla resultados
END$$

DELIMITER ;

