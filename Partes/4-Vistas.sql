Set @@autocomit =1;
-- VISTA DE PILOTOS ACTIVOS ESTA TEMPORADA (NO INCLUYE SUPLENTES)
Create view CarrerasCorridas as 
Select id_result, nombre, fecha from resultados
join carreras on 
carreras.id_carrera = resultados.carrera
join circuitos on
carreras.circ = circuitos.Id_circuito
Where id_carrera is not null;

Create View  PilotosActivos AS
select PILOTOs.nombre, apellidos, escuderias.nombre AS escuderia from pilotos 
join escuderias on 
pilotos.escud = escuderias.id_esc
where estado = 1;

-- VISTA DE TOP SEGUN PUNTAJE 
Create View  Top3 AS
select PILOTOs.nombre, apellidos, pilotos.puntos, escuderias.nombre AS escuderia from pilotos 
join escuderias on 
pilotos.escud = escuderias.id_esc
where estado = 1
order by puntos desc
limit 3;

-- VISTA DE CIRCUINTOS PENDIENTES DE SER CORRIDOS ESTA TEMPORADA 
create view CircuitosFaltantes AS
Select id_circuito, nombre, pais from circuitos
join carreras on 
circuitos.id_circuito = carreras.circ
left join resultados on 
carreras.Id_carrera = resultados.Carrera
Where resultados.Carrera is null;

-- VISTA DE COMPOSICION DE LOS PODIOS X CARRERA
Create View Podios_Carreras as
SELECT circuitos.nombre AS Nombre_Circuito, 
       circuitos.pais AS Pais, 
       carreras.fecha AS Fecha_Carrera, 
       GROUP_CONCAT(pilotos.nombre, ' ',pilotos.apellidos,' ') AS Orden_Podio 
FROM circuitos 
JOIN carreras ON circuitos.id_circuito = carreras.circ
LEFT JOIN resultados ON carreras.Id_carrera = resultados.Carrera
JOIN pilotos ON resultados.Primer_puesto = pilotos.Id_piloto 
              OR resultados.Seg_puesto = pilotos.Id_piloto 
              OR resultados.Terc_puesto = pilotos.Id_piloto
GROUP BY carreras.Id_carrera;

 
