CREATE TABLE Usuario
( 
DNI_USUARIO text PRIMARY KEY,
NIU text NOT NULL,
Password text NOT NULL,
Nombre text NOT NULL,
Apellido text NOT NULL,
Email text NOT NULL,
Telefono text NOT  NULL,
curso_ingreso text NOT NULL,
posicion_antiguedad INTEGER NOT NULL
);
INSERT INTO USUARIO VALUES('28359601','alu0102223467','Zdertiertgu','Andres ','Cruz Sanchez','andres@gmail.com','722564353','2017',2);
INSERT INTO USUARIO VALUES('283535521','alu0102118222','ZD$56256','Pedro ','Ruiz Padron','pedro@gmail.com','625566190','2018',1);
INSERT INTO USUARIO VALUES('43635960','alu0100812522','OLsfjjw1222','Talia ','Lorca Perez','natalia@gmail.com','623566922','2015',3);
INSERT INTO USUARIO VALUES('43283591','alu0180812122','dbfhbafb','Juan ','Rodriguez Medina','juan@gmail.com','682356435690','2013',5);


CREATE TABLE Pago
(
Referencia  INTEGER PRIMARY KEY NOT NULL,
Curso  text NOT NULL,
Mes text NOT NULL,
Importe FLOAT
);

CREATE TABLE Visita
(
DNI_VISITA text NOT NULL,
fecha TIMESTAMP  NOT NULL,
Nombre text NOT NULL,
Apellido text NOT NULL,
Entrada TIMESTAMP NOT NULL,
Salida TIMESTAMP NOT NULL
PRIMARY KEY(DNI_VISITA,fecha)

);

CREATE TABLE TurnoB
(
ID_Turno INTEGER PRIMARY KEY,
Hora_E TIMESTAMP,
HORA_S TIMESTAMP,
Dia String,
Servicio String
);

CREATE TABLE TurnoL
(
ID_Turno INTEGER NOT NULL,
Inicio TIMESTAMP,
Fin TIMESTAMP,
Cambio TIMESTAMP,
Fecha text NOT NULL,
PRIMARY KEY(Fecha,Inicio,ID_Turno)
);

CREATE TABLE Habitacion
(
Numero INTEGER PRIMARY KEY NOT NULL,
Planta INTEGER NOT NULL,
Orientacion text NOT NULL,
observaciones text
);


CREATE TABLE Lavadoras
(
Id  INTEGER PRIMARY KEY NOT NULL,
Observacion text,
Disponible BOOLEAN NOT NULL
);
CREATE TABLE Secadoras
(
Id  INTEGER PRIMARY KEY NOT NULL,
Observacion text,
Disponible BOOLEAN NOT NULL
);
CREATE TABLE Material
(
Id  SERIAL PRIMARY KEY NOT NULL,
Nombre text  NOT NULL,
Stock INTEGER NOt NULL,
prestadas INTEGER 
);

CREATE TABLE Becario
(
orden INTEGER NOT NULL,
n_avisos INTEGER NOT NULL
)INHERITS(usuario);

CREATE TABLE Libro
(
ISBN text PRIMARY KEY,
Titulo text NOT NULL,
Categoria text NOT NULL
);
CREATE TABLE FotoCopia 
(
Periodo text PRIMARY KEY,
N_Impresiones INTEGER,
Realizadas INTEGER,
Restantes INTEGER
);

CREATE TABLE Ordenadores
(
Id  INTEGER PRIMARY KEY NOT NULL,
SistemaOperativo text NOT NULL
);