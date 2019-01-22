# PRACTICA OBJETO-RELACION PROYECTOS 

### Adrián Herrera Darias

### Francisco Javier Mendoza Alvarez

Se mostrará ejemplos de como se han introduccido los datos en postgres y la realizacion de consultas:

## 1 Captura : Creacion de tablas

![Creacion de tablas](https://github.com/PanchoMen/ADM_BBDD/blob/master/Ejercicio%20Objeto-Relacional/Proyectos/Creaciontablas.png "Creacion de tablas")

## 2 Captura : Creacion con Herencia

![Creacion con Herencia](https://github.com/PanchoMen/ADM_BBDD/blob/master/Ejercicio%20Objeto-Relacional/Proyectos/Herencia.png "Creacion con Herencia")

## 3 Captura : Creacion Tipo de Datos

![Creacion Tipo de Datos](https://github.com/PanchoMen/ADM_BBDD/blob/master/Ejercicio%20Objeto-Relacional/Proyectos/UML.jpeg "Creacion Tipo de Datos")

## 4 Captura : Inseccion y Seleccion

![Inseccion y Seleccion](https://github.com/PanchoMen/ADM_BBDD/blob/master/Ejercicio%20Objeto-Relacional/Proyectos/Insercionyselecciondatos.png "Inseccion y Seleccion")

## 5 Captura : Operacion de Datos

![Operacion de Datos](https://github.com/PanchoMen/ADM_BBDD/blob/master/Ejercicio%20Objeto-Relacional/Proyectos/OperacionDeDatos.png "Operacion de Datos")

## Scripts

```SQL
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
```

