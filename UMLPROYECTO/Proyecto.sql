CREATE TABLE Usuario
( 
DNI text,
Nombre text,
Apellido text,
Email text,
Telefono text  );
INSERT INTO USUARIO VALUES('28359601','Andres ','Cruz Sanchez','andresflow@gmail.com','682356435690');

CREATE TABLE Pago
(
Referencia  INTEGER,
Curso  text,
Mes text,
Importe FLOAT
);

CREATE TABLE Visita
(
DNI text,
Nombre text,
Apellido text
);

CREATE TABLE Horario
(
Dia text ,
Hora TIMESTAMP
);

CREATE TABLE Habitacion
(
Numero INTEGER,
Planta INTEGER,
Orientacion text,
);


CREATE TABLE Lavadoras
(
Id  INTEGER,
Modelo text,
Disponible BOOLEAN
);

CREATE TABLE Material
(
Id  INTEGER,
Nombre text,
Observacion text,
);

CREATE TABLE Libro
(
ISBN text,
Titulo text,
Categoria text
);
CREATE TABLE FotoCopia 
(
DNI_USUARIO text,
N_Impresiones INTEGER,
Realizadas INTEGER,
Restantes INTEGER
);

CREATE TABLE Ordenadores
(
Id  INTEGER,
Sistema Operativo text
);