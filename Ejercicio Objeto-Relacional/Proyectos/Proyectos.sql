CREATE TABLE jefe
( 
Codigo INTEGER,
Nombre text,
Direccion text,
Telefono text  );
INSERT INTO jefe VALUES(829152,'Alfredo Padilla','Calle Malavida nº5','682356435690');

CREATE TABLE proyecto
(
Codigo  INTEGER,
Nombre  text
);

CREATE TABLE Plano
(
N_Id INTEGER,
fecha_entrega text,
Arquitectos text,
);

CREATE TABLE Figura
(
Id INTEGER,
Nombre text ,
Color text ,
);

CREATE TABLE Poligonos
(
N_Lineas INTEGER
)INHERITS (Figura);

CREATE TYPE Coordenada AS
(
 x INTEGER,
 y INTEGER
);

CREATE TABLE Linea 
(
Id : INTEGER,
Origen Coordenada,
Destino Coordenada
);
