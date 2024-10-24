-- CREACIÓN ----------------------------------------
--Tabla de Proyectos 
CREATE TABLE Proyectos (
    id_proyecto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

--Tabla de Vertical 
CREATE TABLE Vertical (
    id_vertical SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

--Tabla de claustro 
CREATE TABLE Claustro (
    id_claustro SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    rol VARCHAR(50) NOT NULL,
    modalidad VARCHAR(50) NOT NULL,
	id_vertical INT NOT NULL,
	FOREIGN KEY (id_vertical) REFERENCES vertical(id_vertical)
);

-- Tabla de promocion 
CREATE TABLE Promociones (
    id_promocion SERIAL PRIMARY KEY,
    fecha_comienzo DATE,
    campus VARCHAR(100) NOT NULL
);

--Tabla de curso 
CREATE TABLE Curso (
	id_claustro INT NOT NULL,
	id_promocion INT NOT NULL,
	FOREIGN KEY (id_claustro) REFERENCES Claustro(id_claustro),
	FOREIGN KEY (id_promocion) REFERENCES Promociones(id_promocion)
);

--Tabla de Alumnos 
CREATE TABLE Alumnos (
    id_alumno SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
	id_promocion INT NOT NULL,
	FOREIGN KEY (id_promocion) REFERENCES Promociones(id_promocion),
	id_vertical INT NOT NULL,
	FOREIGN KEY (id_vertical) REFERENCES vertical(id_vertical)
);

-- Tabla de calificacion 
CREATE TABLE Calificacion (
    id_alumno INT NOT NULL,
    id_proyecto INT NOT NULL,
    nota VARCHAR(10),
    PRIMARY KEY (id_alumno, id_proyecto),
    FOREIGN KEY (id_alumno) REFERENCES Alumnos(id_alumno),
    FOREIGN KEY (id_proyecto) REFERENCES Proyectos(id_proyecto)
);

-- INSERT ----------------------------------------
-- Inserción Vertical:

INSERT INTO vertical (nombre) VALUES
('DS'),
('FS');


-- Inserción Proyectos:
INSERT INTO proyectos (nombre) VALUES
('Proyecto_HLF'),
('Proyecto_EDA'),
('Proyecto_BBDD'),
('Proyecto_ML'),
('Proyecto_Deployment'),
('Proyecto_WebDev'),
('Proyecto_FrontEnd'),
('Proyecto_Backend'),
('Proyecto_React'),
('Proyecto_FullSatck');


-- Inserción Promociones:
INSERT INTO promociones (fecha_comienzo, campus) VALUES
('2023-09-18', 'Madrid'),
('2024-02-12', 'Madrid'),
('2024-02-12', 'Valencia');



-- Inserción Claustro:
INSERT INTO claustro (nombre, rol, modalidad, id_vertical) VALUES
('Noa Yáñez', 'TA', 'presencial', 1),
('Saturnina Benitez', 'TA',  'presencial',2),
('Anna Feliu', 'TA', 'presencial',2),
('Rosalva Ayuso', 'TA', 'presencial',2),
('Ana Sofía Ferrer', 'TA', 'presencial',2),
('Angélica Corral', 'TA', 'presencial',2),
('Ariel Lledó', 'TA', 'presencial',1),
('Mario Prats', 'LI', 'online',2),
('Luis Ángel Suárez', 'LI', 'online',2),
('María Dolores Diaz', 'LI', 'online',1);



-- Inserción Curso:
INSERT INTO curso (id_claustro, id_promocion) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 3),
(5, 3),
(6, 2),
(7, 1),
(8, 3),
(9, 1),
(10, 1);



-- Inserción Alumnos:

INSERT INTO alumnos (nombre, email, id_promocion, id_vertical) VALUES 
('Jafet Casals', 'Jafet_Casals@gmail.com', 1, 1),
('Jorge Manzanares', 'Jorge_Manzanares@gmail.com', 1, 1),
('Onofre Adadia', 'Onofre_Adadia@gmail.com', 1, 1),
('Merche Prada', 'Merche_Prada@gmail.com', 1, 1),
('Pilar Abella', 'Pilar_Abella@gmail.com', 1, 1),
('Leoncio Tena', 'Leoncio_Tena@gmail.com', 1, 1),
('Odalys Torrijos', 'Odalys_Torrijos@gmail.com', 1, 1),
('Eduardo Caparrós', 'Eduardo_Caparrós@gmail.com', 1, 1),
('Ignacio Goicoechea', 'Ignacio_Goicoechea@gmail.com', 1, 1),
('Clementina Santos', 'Clementina_Santos@gmail.com', 1, 1),
('Daniela Falcó', 'Daniela_Falcó@gmail.com', 1, 1),
('Abraham Vélez', 'Abraham_Vélez@gmail.com', 1, 1),
('Maximiliano Menéndez', 'Maximiliano_Menéndez@gmail.com', 1, 1),
('Anita Heredia', 'Anita_Heredia@gmail.com', 1, 1),
('Eli Casas', 'Eli_Casas@gmail.com', 1, 1),
('Guillermo Borrego', 'Guillermo_Borrego@gmail.com', 2, 1),
('Sergio Aguirre', 'Sergio_Aguirre@gmail.com', 2, 1),
('Carlito Carrión', 'Carlito_Carrión@gmail.com', 2, 1),
('Haydée Figueroa', 'Haydée_Figueroa@gmail.com', 2, 1),
('Chita Mancebo', 'Chita_Mancebo@gmail.com', 2, 1),
('Joaquina Asensio', 'Joaquina_Asensio@gmail.com', 2, 1),
('Cristian Sarabia', 'Cristian_Sarabia@gmail.com', 2, 1),
('Isabel Ibáñez', 'Isabel_Ibáñez@gmail.com', 2, 1),
('Desiderio Jordá', 'Desiderio_Jordá@gmail.com', 2, 1),
('Rosalina Llanos', 'Rosalina_Llanos@gmail.com', 2, 1),
('Amor Larrañaga', 'Amor_Larrañaga@gmail.com', 1, 2),
('Teodoro Alberola', 'Teodoro_Alberola@gmail.com', 1, 2),
('Cleto Plana', 'Cleto_Plana@gmail.com', 1, 2),
('Aitana Sebastián', 'Aitana_Sebastián@gmail.com', 1, 2),
('Dolores Valbuena', 'Dolores_Valbuena@gmail.com', 1, 2),
('Julie Ferrer', 'Julie_Ferrer@gmail.com', 1, 2),
('Mireia Cabañas', 'Mireia_Cabañas@gmail.com', 1, 2),
('Flavia Amador', 'Flavia_Amador@gmail.com', 1, 2),
('Albino Macias', 'Albino_Macias@gmail.com', 1, 2),
('Ester Sánchez', 'Ester_Sánchez@gmail.com', 1, 2),
('Luis Miguel Galvez', 'Luis_Miguel_Galvez@gmail.com', 1, 2),
('Loida Arellano', 'Loida_Arellano@gmail.com', 1, 2),
('Heraclio Duque', 'Heraclio_Duque@gmail.com', 1, 2),
('Herberto Figueras', 'Herberto_Figueras@gmail.com', 1, 2),
('Teresa Laguna', 'Teresa_Laguna@gmail.com', 3, 2),
('Estrella Murillo', 'Estrella_Murillo@gmail.com', 3, 2),
('Ernesto Uriarte', 'Ernesto_Uriarte@gmail.com', 3, 2),
('Daniela Guitart', 'Daniela_Guitart@gmail.com', 3, 2),
('Timoteo Trillo', 'Timoteo_Trillo@gmail.com', 3, 2),
('Ricarda Tovar', 'Ricarda_Tovar@gmail.com', 3, 2),
('Alejandra Vilaplana', 'Alejandra_Vilaplana@gmail.com', 3, 2),
('Daniel Rosselló', 'Daniel_Rosselló@gmail.com', 3, 2),
('Rita Olivares', 'Rita_Olivares@gmail.com', 3, 2),
('Cleto Montes', 'Cleto_Montes@gmail.com', 3, 2),
('Marino Castilla', 'Marino_Castilla@gmail.com', 3, 2),
('Estefanía Valcárcel', 'Estefanía_Valcárcel@gmail.com', 3, 2),
('Noemí Vilanova', 'Noemí_Vilanova@gmail.com', 3, 2);



-- Inserción Calificaciones:

INSERT INTO calificacion (id_alumno, id_proyecto, nota) VALUES 
-- Jafet Casals
(1, 1, 'Apto'),
(1, 2, 'No Apto'),
(1, 3, 'Apto'),
(1, 4, 'Apto'),
(1, 5, 'Apto'),

-- Jorge Manzanares
(2, 1, 'Apto'),
(2, 2, 'No Apto'),
(2, 3, 'Apto'),
(2, 4, 'Apto'),
(2, 5, 'Apto'),

-- Onofre Adadia
(3, 1, 'Apto'),
(3, 2, 'Apto'),
(3, 3, 'Apto'),
(3, 4, 'No Apto'),
(3, 5, 'Apto'),

-- Merche Prada
(4, 1, 'Apto'),
(4, 2, 'No Apto'),
(4, 3, 'No Apto'),
(4, 4, 'Apto'),
(4, 5, 'No Apto'),

-- Pilar Abella
(5, 1, 'Apto'),
(5, 2, 'No Apto'),
(5, 3, 'Apto'),
(5, 4, 'Apto'),
(5, 5, 'Apto'),

-- Leoncio Tena
(6, 1, 'Apto'),
(6, 2, 'Apto'),
(6, 3, 'Apto'),
(6, 4, 'Apto'),
(6, 5, 'Apto'),

-- Odalys Torrijos
(7, 1, 'No Apto'),
(7, 2, 'Apto'),
(7, 3, 'Apto'),
(7, 4, 'Apto'),
(7, 5, 'Apto'),

-- Eduardo Caparrós
(8, 1, 'No Apto'),
(8, 2, 'Apto'),
(8, 3, 'Apto'),
(8, 4, 'Apto'),
(8, 5, 'Apto'),

-- Ignacio Goicoechea
(9, 1, 'Apto'),
(9, 2, 'Apto'),
(9, 3, 'Apto'),
(9, 4, 'No Apto'),
(9, 5, 'Apto'),

-- Clementina Santos
(10, 1, 'Apto'),
(10, 2, 'No Apto'),
(10, 3, 'Apto'),
(10, 4, 'Apto'),
(10, 5, 'Apto'),

-- Daniela Falcó
(11, 1, 'Apto'),
(11, 2, 'Apto'),
(11, 3, 'Apto'),
(11, 4, 'Apto'),
(11, 5, 'Apto'),

-- Abraham Vélez
(12, 1, 'Apto'),
(12, 2, 'No Apto'),
(12, 3, 'No Apto'),
(12, 4, 'Apto'),
(12, 5, 'Apto'),

-- Maximiliano Menéndez
(13, 1, 'Apto'),
(13, 2, 'No Apto'),
(13, 3, 'Apto'),
(13, 4, 'Apto'),
(13, 5, 'Apto'),

-- Anita Heredia
(14, 1, 'Apto'),
(14, 2, 'Apto'),
(14, 3, 'Apto'),
(14, 4, 'Apto'),
(14, 5, 'Apto'),

-- Eli Casas
(15, 1, 'Apto'),
(15, 2, 'Apto'),
(15, 3, 'Apto'),
(15, 4, 'Apto'),
(15, 5, 'Apto'),

-- Guillermo Borrego
(16, 1, 'Apto'),
(16, 2, 'No Apto'),
(16, 3, 'No Apto'),
(16, 4, 'Apto'),
(16, 5, 'No Apto'),

-- Sergio Aguirre
(17, 1, 'Apto'),
(17, 2, 'No Apto'),
(17, 3, 'Apto'),
(17, 4, 'Apto'),
(17, 5, 'No Apto'),

-- Carlito Carrión
(18, 1, 'Apto'),
(18, 2, 'No Apto'),
(18, 3, 'Apto'),
(18, 4, 'Apto'),
(18, 5, 'Apto'),

-- Haydée Figueroa
(19, 1, 'Apto'),
(19, 2, 'Apto'),
(19, 3, 'Apto'),
(19, 4, 'Apto'),
(19, 5, 'Apto'),

-- Chita Mancebo
(20, 1, 'No Apto'),
(20, 2, 'Apto'),
(20, 3, 'No Apto'),
(20, 4, 'Apto'),
(20, 5, 'Apto'),

-- Joaquina Asensio
(21, 1, 'No Apto'),
(21, 2, 'No Apto'),
(21, 3, 'Apto'),
(21, 4, 'Apto'),
(21, 5, 'Apto'),

-- Cristian Sarabia
(22, 1, 'Apto'),
(22, 2, 'Apto'),
(22, 3, 'No Apto'),
(22, 4, 'Apto'),
(22, 5, 'Apto'),

-- Isabel Ibáñez
(23, 1, 'No Apto'),
(23, 2, 'Apto'),
(23, 3, 'No Apto'),
(23, 4, 'Apto'),
(23, 5, 'Apto'),

-- Desiderio Jordá
(24, 1, 'No Apto'),
(24, 2, 'Apto'),
(24, 3, 'No Apto'),
(24, 4, 'No Apto'),
(24, 5, 'Apto'),

-- Rosalina Llanos
(25, 1, 'Apto'),
(25, 2, 'Apto'),
(25, 3, 'Apto'),
(25, 4, 'Apto'),
(25, 5, 'Apto'),

-- Amor Larrañaga
(26, 6, 'Apto'),
(26, 7, 'Apto'),
(26, 8, 'Apto'),
(26, 9, 'Apto'),
(26, 10, 'No Apto'),

-- Teodoro Alberola
(27, 6, 'No Apto'),
(27, 7, 'No Apto'),
(27, 8, 'Apto'),
(27, 9, 'No Apto'),
(27, 10, 'Apto'),

-- Cleto Plana
(28, 6, 'Apto'),
(28, 7, 'No Apto'),
(28, 8, 'Apto'),
(28, 9, 'No Apto'),
(28, 10, 'Apto'),

-- Aitana Sebastián
(29, 6, 'Apto'),
(29, 7, 'No Apto'),
(29, 8, 'Apto'),
(29, 9, 'No Apto'),
(29, 10, 'Apto'),

-- Dolores Valbuena
(30, 6, 'Apto'),
(30, 7, 'Apto'),
(30, 8, 'Apto'),
(30, 9, 'Apto'),
(30, 10, 'No Apto'),

-- Julie Ferrer
(31, 6, 'No Apto'),
(31, 7, 'No Apto'),
(31, 8, 'No Apto'),
(31, 9, 'Apto'),
(31, 10, 'No Apto'),

-- Mireia Cabañas
(32, 6, 'No Apto'),
(32, 7, 'Apto'),
(32, 8, 'Apto'),
(32, 9, 'Apto'),
(32, 10, 'Apto'),

-- Flavia Amador
(33, 6, 'Apto'),
(33, 7, 'Apto'),
(33, 8, 'No Apto'),
(33, 9, 'Apto'),
(33, 10, 'Apto'),

-- Albino Macias
(34, 6, 'No Apto'),
(34, 7, 'Apto'),
(34, 8, 'Apto'),
(34, 9, 'Apto'),
(34, 10, 'Apto'),

-- Ester Sánchez
(35, 6, 'No Apto'),
(35, 7, 'Apto'),
(35, 8, 'Apto'),
(35, 9, 'No Apto'),
(35, 10, 'Apto'),

-- Luis Miguel Galvez
(36, 6, 'No Apto'),
(36, 7, 'Apto'),
(36, 8, 'Apto'),
(36, 9, 'Apto'),
(36, 10, 'Apto'),

-- Loida Arellano
(37, 6, 'Apto'),
(37, 7, 'Apto'),
(37, 8, 'Apto'),
(37, 9, 'Apto'),
(37, 10, 'Apto'),

-- Heraclio Duque
(38, 6, 'Apto'),
(38, 7, 'Apto'),
(38, 8, 'No Apto'),
(38, 9, 'No Apto'),
(38, 10, 'No Apto'),

-- Herberto Figueras
(39, 6, 'Apto'),
(39, 7, 'Apto'),
(39, 8, 'Apto'),
(39, 9, 'Apto'),
(39, 10, 'Apto'),

-- Teresa Laguna
(40, 6, 'Apto'),
(40, 7, 'Apto'),
(40, 8, 'Apto'),
(40, 9, 'Apto'),
(40, 10, 'Apto'),

-- Estrella Murillo
(41, 6, 'Apto'),
(41, 7, 'Apto'),
(41, 8, 'No Apto'),
(41, 9, 'Apto'),
(41, 10, 'Apto'),

-- Ernesto Uriarte
(42, 6, 'Apto'),
(42, 7, 'Apto'),
(42, 8, 'Apto'),
(42, 9, 'Apto'),
(42, 10, 'Apto'),

-- Daniela Guitart
(43, 6, 'Apto'),
(43, 7, 'No Apto'),
(43, 8, 'No Apto'),
(43, 9, 'Apto'),
(43, 10, 'Apto'),

-- Timoteo Trillo
(44, 6, 'No Apto'),
(44, 7, 'Apto'),
(44, 8, 'Apto'),
(44, 9, 'Apto'),
(44, 10, 'No Apto'),

-- Ricarda Tovar
(45, 6, 'Apto'),
(45, 7, 'Apto'),
(45, 8, 'Apto'),
(45, 9, 'Apto'),
(45, 10, 'Apto'),

-- Alejandra Vilaplana
(46, 6, 'No Apto'),
(46, 7, 'No Apto'),
(46, 8, 'No Apto'),
(46, 9, 'Apto'),
(46, 10, 'Apto'),

-- Daniel Rosselló
(47, 6, 'No Apto'),
(47, 7, 'No Apto'),
(47, 8, 'Apto'),
(47, 9, 'No Apto'),
(47, 10, 'No Apto'),

-- Rita Olivares
(48, 6, 'No Apto'),
(48, 7, 'No Apto'),
(48, 8, 'No Apto'),
(48, 9, 'Apto'),
(48, 10, 'Apto'),

-- Cleto Montes
(49, 6, 'Apto'),
(49, 7, 'Apto'),
(49, 8, 'No Apto'),
(49, 9, 'Apto'),
(49, 10, 'Apto'),

-- Marino Castilla
(50, 6, 'No Apto'),
(50, 7, 'No Apto'),
(50, 8, 'Apto'),
(50, 9, 'No Apto'),
(50, 10, 'No Apto'),

-- Estefanía Valcárcel
(51, 6, 'Apto'),
(51, 7, 'Apto'),
(51, 8, 'No Apto'),
(51, 9, 'No Apto'),
(51, 10, 'Apto'),

-- Noemí Vilanova
(52, 6, 'Apto'),
(52, 7, 'No Apto'),
(52, 8, 'No Apto'),
(52, 9, 'Apto'),
(52, 10, 'Apto');

-- CONSULTAS ----------------------------------------
-- Seleccionar todos los alumnos
SELECT *
FROM alumnos

SELECT 

-- Nº de profesores por vertical en el campus de Madrid
SELECT DISTINCT COUNT(cla.nombre) AS Num_Profesores, v.nombre AS Nombre_Vertical, p.campus 
FROM promociones as p
INNER JOIN curso as cur
ON p.id_promocion = cur.id_promocion
INNER JOIN claustro as cla
ON cur.id_claustro = cla.id_claustro
INNER JOIN vertical as v
ON cla.id_vertical = v.id_vertical
WHERE p.campus = 'Madrid'
GROUP BY p.campus, v.nombre

-- Calificaciones de los proyectos del alumno "Jorge Manzanares"
SELECT a.nombre AS Nombre_Alumno, p.nombre AS Proyecto, cal.nota AS Nota
FROM calificacion AS cal
INNER JOIN proyectos AS p
ON cal.id_proyecto = p.id_proyecto
INNER JOIN alumnos AS a
ON cal.id_alumno = a.id_alumno
WHERE a.nombre = 'Jorge Manzanares';

-- Cuántos alumnos tiene cada promoción
SELECT p.*,COUNT(DISTINCT a.id_alumno) AS Num_Alumnos
FROM alumnos AS a
INNER JOIN promociones as p
ON a.id_promocion = p.id_promocion
INNER JOIN curso as cur
ON a.id_promocion = cur.id_promocion
INNER JOIN vertical as v
ON v.id_vertical = a.id_vertical
GROUP BY 1
ORDER BY 1

-- Cuántos alumnos tiene cada profesor
SELECT cla.nombre, cla.rol,COUNT(DISTINCT a.id_alumno) AS cantidad_estudiantes 
FROM claustro AS cla 
INNER JOIN alumnos AS a
ON cla.id_vertical = a.id_vertical 
GROUP BY cla.nombre, cla.rol

-- Buscar estudiantes de FS en Madrid
SELECT DISTINCT a.nombre, v.nombre 
FROM alumnos AS a 
INNER JOIN vertical AS v
ON a.id_vertical = v.id_vertical 
INNER JOIN promociones AS p
ON a.id_promocion = p.id_promocion
WHERE v.nombre = 'FS' AND p.campus= 'Madrid';
