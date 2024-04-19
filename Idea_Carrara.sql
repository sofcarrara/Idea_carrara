DROP SCHEMA IF EXISTS Formula1;
CREATE SCHEMA IF NOT EXISTS Formula1;

DROP TABLE IF EXISTS escuderias;
CREATE TABLE IF NOT EXISTS escuderias(
Id_esc INT AUTO_INCREMENT NOT NULL,
Nombre VARCHAR(30) NOT NULL,
Pais VARCHAR(20) NOT NULL,
Fundacion DATE NOT NULL,
Camp_constr int NOT NULL,
Camp int NOT NULL,
Puntos int NOT NULL,
PRIMARY KEY (Id_esc));

DROP TABLE IF EXISTS Pilotos;
CREATE TABLE IF NOT EXISTS Pilotos(
Id_piloto INT AUTO_INCREMENT NOT NULL,
Nombre VARCHAR(30) NOT NULL,
Apellidos  VARCHAR(50) NOT NULL,
Pais  VARCHAR(20) NOT NULL,
Red_Soc  VARCHAR(30),
Fecha_Nac DATE  NOT NULL,
Escud INT  NOT NULL,
Puntos INT  NOT NULL,
TorneosGanados Int  NOT NULL,
Estado ENUM ('1','0') NOT NULL, -- 1 es activo, 0 es inactivo 
Foto LONGBLOB NOT NULL,
PRIMARY KEY (Id_Piloto),
FOREIGN KEY (Escud) REFERENCES Escuderias (Id_esc));

DROP TABLE IF EXISTS Historial_Equitpos;
CREATE TABLE IF NOT EXISTS Historial_Equitpos (
Id INT AUTO_INCREMENT NOT NULL,
Piloto INT NOT NULL,
Escuderia INT NOT NULL,
Temporada YEAR NOT NULL,
PRIMARY KEY (Id),
FOREIGN KEY (Piloto) REFERENCES Pilotos(Id_Piloto),
FOREIGN KEY (Escuderia) REFERENCES Escuderias(Id_esc));


DROP TABLE IF EXISTS Circuitos;
CREATE TABLE IF NOT EXISTS Circuitos (
Id_circuito INT AUTO_INCREMENT NOT NULL,
Nombre VARCHAR(30) NOT NULL,
Pais VARCHAR(20) NOT NULL,
Ciudad VARCHAR(20) NOT NULL,
Longitud DECIMAL(6 , 2) NOT NULL,
Cap_espec INT NOT NULL,
PRIMARY KEY (Id_circuito));

DROP TABLE IF EXISTS Carreras;
CREATE TABLE IF NOT EXISTS Carreras (
Id_carrera INT AUTO_INCREMENT NOT NULL,
Circ INT NOT NULL,
Vueltas INT NOT NULL,
Fecha DATE NOT NULL,
PRIMARY KEY (Id_carrera),
FOREIGN KEY (Circ) REFERENCES Circuitos (Id_circuito));

DROP TABLE IF EXISTS Incidencias;
CREATE TABLE IF NOT EXISTS Incidencias (
Id_Incidencia INT AUTO_INCREMENT NOT NULL,
Tipo_inc ENUM ('BR','BA', 'P') NOT NULL,-- bandera roja (BR), bandera amarilla(BA), Penalizacion (P)
Duracion TIME(3) NOT NULL,
Carrera INT NOT NULL,
Piloto INT NOT NULL,
PRIMARY KEY (Id_incidencia),
FOREIGN KEY (Piloto) REFERENCES Pilotos (Id_piloto),
FOREIGN KEY (Carrera) REFERENCES Carreras (Id_carrera));

DROP TABLE IF EXISTS Resultados;
CREATE TABLE IF NOT EXISTS Resultados (
Id_Result INT AUTO_INCREMENT NOT NULL,
Carrera INT NOT NULL,
Primer_puesto INT NOT NULL,
Seg_puesto INT NOT NULL,
Terc_puesto INT NOT NULL,
Vuelta_rapida INT NOT NULL,
PRIMARY KEY (id_result),
FOREIGN KEY (Carrera) REFERENCES Carreras (Id_carrera),
FOREIGN KEY (Primer_puesto) REFERENCES Pilotos (Id_piloto),
FOREIGN KEY (Seg_puesto) REFERENCES Pilotos (Id_piloto),
FOREIGN KEY (Terc_puesto) REFERENCES Pilotos (Id_piloto),
FOREIGN KEY (Vuelta_rapida) REFERENCES Pilotos (Id_piloto));
