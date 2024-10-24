-- CREACIÓN DE TABLAS
--Tabla de Proyectos 
CREATE TABLE Proyectos (
    id_proyecto SERIAL PRIMARY KEY,
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

-- Tabla de promociones 
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

--Tabla de Vertical 
CREATE TABLE Vertical (
    id_vertical SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- INSERCIÓN DE DATOS


-- QUERIES
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

-- Calificaciones de los proyectos del alumno "Jorge Manzanares"
SELECT a.nombre AS Nombre_Alumno, p.nombre AS Proyecto, cal.nota AS Nota
FROM calificacion AS cal
INNER JOIN proyectos AS p
ON cal.id_proyecto = p.id_proyecto
INNER JOIN alumnos AS a
ON cal.id_alumno = a.id_alumno
WHERE a.nombre = 'Jorge Manzanares';

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
