-- STORED PROCEDURES

-- PROCEDIMIENTO QUE MUESTRA AL PILOTO CON MAS CAMPEONATOS DE UNA ESCUDERIA
Select pilotos.nombre, apellidos, pilotos.pais , torneosganados From pilotos
join escuderias on 
pilotos.escud = escuderias.id_esc
where escuderias.nombre like  '%MERCEDES%'
and torneosganados > 0
order by torneosganados desc
limit 1;

DELIMITER //
CREATE PROCEDURE SP_MaxCAmpxEsc (
    IN P_Escud VARCHAR(20),
    OUT P_nombre VARCHAR(20),
    OUT P_apellidos VARCHAR(20),
    OUT P_pais VARCHAR(20),
    OUT torneosganados INT
)
BEGIN
    SELECT pilotos.nombre, pilotos.apellidos, pilotos.pais, pilotos.torneosganados
    INTO P_nombre, P_apellidos, P_pais, torneosganados 
    FROM pilotos
    JOIN escuderias ON pilotos.escud = escuderias.id_esc
    WHERE escuderias.nombre LIKE CONCAT('%', P_Escud, '%')
    AND pilotos.torneosganados > 0
    ORDER BY pilotos.torneosganados DESC
    LIMIT 1;
END //
 
 -- PROCEDIMIENTO QUEque muestra en que escuderia estaba el pilot oen la temproada 
Select pilotos.nombre,pilotos.apellidos, escuderias.nombre From pilotos
join escuderias on 
pilotos.escud = escuderias.id_esc
join historial_equipos on 
pilotos.id_piloto = historial_equipos.piloto
where (pilotos.nombre= '' or pilotos.Apellidos= 'perez')
and temporada = '2021'

;

DELIMITER //

CREATE PROCEDURE SP_Esc_Pilotos_Temp(
    INout P_NombPiloto VARCHAR(20),
    INout P_ApellPiloto VARCHAR(20),
    IN P_TEmporada INT,
    OUT P_Escuderia  VARCHAR(30),
    OUT P_mensaje VARCHAR(30)
)
BEGIN
    DECLARE esc_exist INT;

    SELECT COUNT(*) INTO esc_exist
    FROM pilotos 
    JOIN historial_equipos ON pilotos.id_piloto = historial_equipos.piloto
    JOIN escuderias ON pilotos.escud = escuderias.id_esc
    WHERE (pilotos.nombre = P_NombPiloto OR pilotos.Apellidos = P_ApellPiloto)
    AND temporada = P_TEmporada;

    IF esc_exist > 0 THEN
        SELECT pilotos.nombre, pilotos.apellidos, escuderias.nombre 
        INTO P_NombPiloto, P_ApellPiloto, P_Escuderia  
        FROM pilotos 
        JOIN historial_equipos ON pilotos.id_piloto = historial_equipos.piloto
        JOIN escuderias ON pilotos.escud = escuderias.id_esc
        WHERE (pilotos.nombre = P_NombPiloto OR pilotos.Apellidos = P_ApellPiloto)
        AND temporada = P_TEmporada;
        SET P_mensaje = 'Información disponible';
    ELSE
        SET P_mensaje = 'INFORMACION NO DISPONIBLE';
    END IF;
END //

DELIMITER ;

DELIMITER ;
