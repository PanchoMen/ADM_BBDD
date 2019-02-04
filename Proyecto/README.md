# Proyecto final <div><img src="https://github.com/PanchoMen/ProyectoII/blob/master/Recursos/Logo_ULL_2018.png" width="200" align="right"/></div>
## Administración y Diseño de Bases de Datos  
## Universidad de La Laguna


* Francisco Javier Mendoza Álvarez
* Adrian Tomas Herrera Darias

### Requisitos
Se pretende implementar una base de datos para gestionar los servicios de alojamiento de la ULL, para ello se han seguido los [requisitos](https://drive.google.com/open?id=18X2F9KKsFTftdkPXKZWIaLqdXvKgmT6LyWXxzgqpHZA)

### Modelo Entidad/Relación
Suguiendo los requisitos anteriores, se ha diseñado el siguiente diagrama Entidad/Relación:

![Modelo E/R](https://github.com/PanchoMen/ADM_BBDD/blob/master/Proyecto/Entidad-Relaci%C3%B3n%20VERSION%202.png "Modelo E/R")

### Modelo Relacional
Tras construir el diagrama Entidad/Relación, del mismo obtuvimos el siguiente Grafo Relacional:
![Grafo Relacional Parte 1](https://github.com/PanchoMen/ADM_BBDD/blob/master/Proyecto/Imagenes/Captura%20de%20pantalla%202019-02-03%20a%20las%2023.50.41.png "Grafo Relacional Parte 1")
![Grafo Relacional Parte 2](https://github.com/PanchoMen/ADM_BBDD/blob/master/Proyecto/Imagenes/Captura%20de%20pantalla%202019-02-03%20a%20las%2023.49.24.png "Grafo Relacional Parte 2")

### Diseño de la Base de Datos

![BDR](https://github.com/PanchoMen/ADM_BBDD/blob/master/Proyecto/ERDDiagram.png "BDR")

#### Código generado

```SQL
CREATE TABLE public.usuario (
	dni_usuario varchar(9) NOT NULL,
	niu varchar(13) NOT NULL,
	password varchar(32) NOT NULL,
	nombre varchar(20) NOT NULL,
	apellidos varchar(30) NOT NULL,
	email varchar(50),
	n_telefono varchar(9),
	curso_ingreso varchar(9) NOT NULL,
	posicion_antiguedad integer NOT NULL,
	PRIMARY KEY (dni_usuario)
);

ALTER TABLE public.usuario
	ADD UNIQUE (niu);


CREATE TABLE public.becario (
	dni_usuario varchar(9) NOT NULL,
	orden integer NOT NULL,
	n_avisos INTEGER DEFAULT 0 NOT NULL,
	PRIMARY KEY (dni_usuario)
);

ALTER TABLE public.becario
	ADD UNIQUE (orden);


CREATE TABLE public.habitacion (
	numero integer NOT NULL,
	planta integer NOT NULL,
	orientacion varchar(20) NOT NULL,
	tipo varchar(20) NOT NULL,
	reformada boolean NOT NULL,
	observaciones text,
	PRIMARY KEY (numero)
);


CREATE TABLE public.turnob (
	id_turno serial NOT NULL,
	servicio varchar(15) NOT NULL,
	dia varchar(10) NOT NULL,
	hora_e time without time zone NOT NULL,
	hora_s time without time zone NOT NULL,
	PRIMARY KEY (id_turno)
);


CREATE TABLE public.pago (
	referencia varchar(20) NOT NULL,
	mes varchar(10) NOT NULL,
	curso varchar(9) NOT NULL,
	importe numeric(6,2) NOT NULL,
	PRIMARY KEY (referencia)
);


CREATE TABLE public.lavadora (
	id_lavadora integer NOT NULL,
	disponible boolean NOT NULL,
	observaciones text,
	PRIMARY KEY (id_lavadora)
);


CREATE TABLE public.material (
	id_material serial NOT NULL,
	nombre varchar(20) NOT NULL,
	stock integer NOT NULL,
	prestadas INTEGER DEFAULT 0 NOT NULL,
	PRIMARY KEY (id_material)
);


CREATE TABLE public.secadora (
	id_secadora integer NOT NULL,
	disponible boolean NOT NULL,
	observaciones text,
	PRIMARY KEY (id_secadora)
);


CREATE TABLE public.visita (
	dni_usuario varchar(9) NOT NULL,
	dni_visita varchar(9) NOT NULL,
	fecha DATE DEFAULT current_date NOT NULL,
	nombre varchar(20) NOT NULL,
	apellidos varchar(30) NOT NULL,
	entrada TIME DEFAULT current_time NOT NULL,
	salida time without time zone,
	PRIMARY KEY (dni_usuario, dni_visita, fecha)
);


CREATE TABLE public.libro (
	isbn varchar(13) NOT NULL,
	titulo text NOT NULL,
	categoria text NOT NULL,
	PRIMARY KEY (isbn)
);


CREATE TABLE public.ordenador (
	id_ordenador integer NOT NULL,
	so varchar(20) NOT NULL,
	PRIMARY KEY (id_ordenador)
);


CREATE TABLE public.bono_fotocopias (
	dni_usuario varchar(9) NOT NULL,
	periodo varchar(30) NOT NULL,
	n_impresiones integer NOT NULL,
	realizadas integer NOT NULL,
	restantes integer NOT NULL,
	PRIMARY KEY (dni_usuario, periodo)
);


CREATE TABLE public.turnol (
	id_lavadora integer NOT NULL,
	id_secadora integer NOT NULL,
	fecha date NOT NULL,
	inicio time without time zone NOT NULL,
	cambio time without time zone,
	fin time without time zone NOT NULL,
	PRIMARY KEY (id_lavadora, id_secadora, fecha, inicio)
);


CREATE TABLE public.prestamo_material (
	dni_usuario varchar(9) NOT NULL,
	id_material integer NOT NULL,
	fecha_prestamo DATE DEFAULT current_date NOT NULL,
	fecha_devolucion date,
	PRIMARY KEY (dni_usuario, id_material, fecha_prestamo)
);


CREATE TABLE public.uso_ordenador (
	dni_usuario varchar(9) NOT NULL,
	id_ordenador integer NOT NULL,
	inicio TIMESTAMP DEFAULT current_timestamp NOT NULL,
	fin timestamp without time zone,
	PRIMARY KEY (dni_usuario, id_ordenador, inicio)
);


CREATE TABLE public.realiza_pago (
	dni_usuario varchar(9) NOT NULL,
	referencia varchar(20) NOT NULL,
	fecha_pago TIMESTAMP DEFAULT current_timestamp NOT NULL,
	PRIMARY KEY (dni_usuario, referencia)
);


CREATE TABLE public.becario_tiene_turno (
	dni_usuario varchar(9) NOT NULL,
	id_turno integer NOT NULL,
	PRIMARY KEY (dni_usuario, id_turno)
);


CREATE TABLE public.becario_realiza_turno (
	dni_usuario varchar(9) NOT NULL,
	id_turno integer NOT NULL,
	entrada TIMESTAMP DEFAULT current_timestamp NOT NULL,
	salida timestamp without time zone,
	PRIMARY KEY (dni_usuario, id_turno, entrada)
);


CREATE TABLE public.prestamo_libro (
	dni_usuario varchar(9) NOT NULL,
	isbn varchar(13) NOT NULL,
	fecha_prestamo TIMESTAMP DEFAULT current_timestamp NOT NULL,
	validez DATE DEFAULT current_date+10 NOT NULL,
	fecha_devolucion timestamp without time zone,
	PRIMARY KEY (dni_usuario, isbn, fecha_prestamo)
);


CREATE TABLE public.reserva_lavadora (
	dni_usuario varchar(9) NOT NULL,
	id_lavadora integer NOT NULL,
	id_secadora integer NOT NULL,
	fecha date NOT NULL,
	hora time without time zone NOT NULL,
	PRIMARY KEY (dni_usuario, id_lavadora, id_secadora, fecha, hora)
);


CREATE TABLE public.usa_lavadora (
	dni_usuario varchar(9) NOT NULL,
	id_lavadora integer NOT NULL,
	id_secadora integer NOT NULL,
	fecha date NOT NULL,
	hora time without time zone NOT NULL,
	PRIMARY KEY (dni_usuario, id_lavadora, id_secadora, fecha, hora)
);


ALTER TABLE public.becario ADD CONSTRAINT FK_becario__dni_usuario FOREIGN KEY (dni_usuario) REFERENCES public.usuario(dni_usuario);
ALTER TABLE public.visita ADD CONSTRAINT FK_visita__dni_usuario FOREIGN KEY (dni_usuario) REFERENCES public.usuario(dni_usuario);
ALTER TABLE public.bono_fotocopias ADD CONSTRAINT FK_bono_fotocopias__dni_usuario FOREIGN KEY (dni_usuario) REFERENCES public.usuario(dni_usuario);
ALTER TABLE public.turnol ADD CONSTRAINT FK_turnol__id_lavadora FOREIGN KEY (id_lavadora) REFERENCES public.lavadora(id_lavadora);
ALTER TABLE public.turnol ADD CONSTRAINT FK_turnol__id_secadora FOREIGN KEY (id_secadora) REFERENCES public.secadora(id_secadora);
ALTER TABLE public.prestamo_material ADD CONSTRAINT FK_prestamo_material__dni_usuario FOREIGN KEY (dni_usuario) REFERENCES public.usuario(dni_usuario);
ALTER TABLE public.prestamo_material ADD CONSTRAINT FK_prestamo_material__id_material FOREIGN KEY (id_material) REFERENCES public.material(id_material);
ALTER TABLE public.uso_ordenador ADD CONSTRAINT FK_uso_ordenador__dni_usuario FOREIGN KEY (dni_usuario) REFERENCES public.usuario(dni_usuario);
ALTER TABLE public.uso_ordenador ADD CONSTRAINT FK_uso_ordenador__id_ordenador FOREIGN KEY (id_ordenador) REFERENCES public.ordenador(id_ordenador);
ALTER TABLE public.realiza_pago ADD CONSTRAINT FK_realiza_pago__dni_usuario FOREIGN KEY (dni_usuario) REFERENCES public.usuario(dni_usuario);
ALTER TABLE public.realiza_pago ADD CONSTRAINT FK_realiza_pago__referencia FOREIGN KEY (referencia) REFERENCES public.pago(referencia);
ALTER TABLE public.becario_tiene_turno ADD CONSTRAINT FK_becario_tiene_turno__dni_usuario FOREIGN KEY (dni_usuario) REFERENCES public.becario(dni_usuario);
ALTER TABLE public.becario_tiene_turno ADD CONSTRAINT FK_becario_tiene_turno__id_turno FOREIGN KEY (id_turno) REFERENCES public.turnob(id_turno);
ALTER TABLE public.becario_realiza_turno ADD CONSTRAINT FK_becario_realiza_turno__dni_usuario FOREIGN KEY (dni_usuario) REFERENCES public.becario(dni_usuario);
ALTER TABLE public.becario_realiza_turno ADD CONSTRAINT FK_becario_realiza_turno__id_turno FOREIGN KEY (id_turno) REFERENCES public.turnob(id_turno);
ALTER TABLE public.prestamo_libro ADD CONSTRAINT FK_prestamo_libro__dni_usuario FOREIGN KEY (dni_usuario) REFERENCES public.usuario(dni_usuario);
ALTER TABLE public.prestamo_libro ADD CONSTRAINT FK_prestamo_libro__isbn FOREIGN KEY (isbn) REFERENCES public.libro(isbn);
ALTER TABLE public.reserva_lavadora ADD CONSTRAINT FK_reserva_lavadora__dni_usuario FOREIGN KEY (dni_usuario) REFERENCES public.usuario(dni_usuario);
ALTER TABLE public.reserva_lavadora ADD CONSTRAINT FK_reserva_lavadora__id_lavadora FOREIGN KEY (id_lavadora) REFERENCES public.turnol(id_lavadora);
ALTER TABLE public.reserva_lavadora ADD CONSTRAINT FK_reserva_lavadora__id_secadora FOREIGN KEY (id_secadora) REFERENCES public.turnol(id_secadora);
ALTER TABLE public.reserva_lavadora ADD CONSTRAINT FK_reserva_lavadora__fecha FOREIGN KEY (fecha) REFERENCES public.turnol(fecha);
ALTER TABLE public.reserva_lavadora ADD CONSTRAINT FK_reserva_lavadora__hora FOREIGN KEY (hora) REFERENCES public.turnol(inicio);
ALTER TABLE public.usa_lavadora ADD CONSTRAINT FK_usa_lavadora__dni_usuario FOREIGN KEY (dni_usuario) REFERENCES public.usuario(dni_usuario);
ALTER TABLE public.usa_lavadora ADD CONSTRAINT FK_usa_lavadora__id_lavadora FOREIGN KEY (id_lavadora) REFERENCES public.turnol(id_lavadora);
ALTER TABLE public.usa_lavadora ADD CONSTRAINT FK_usa_lavadora__id_secadora FOREIGN KEY (id_secadora) REFERENCES public.turnol(id_secadora);
ALTER TABLE public.usa_lavadora ADD CONSTRAINT FK_usa_lavadora__fecha FOREIGN KEY (fecha) REFERENCES public.turnol(fecha);
ALTER TABLE public.usa_lavadora ADD CONSTRAINT FK_usa_lavadora__hora FOREIGN KEY (hora) REFERENCES public.turnol(inicio);

```



![BDROO](https://github.com/PanchoMen/ADM_BBDD/blob/master/Proyecto/Imagenes/Orientado%20a%20Objetos.png "BDROO")

#### Código generado

```SQL
                    --Usuario--
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

                     --Pago--
CREATE TABLE Pago
(
Referencia  INTEGER PRIMARY KEY NOT NULL,
Curso  text NOT NULL,
Mes text NOT NULL,
Importe FLOAT
);

                    --Visita--
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

                   --Becario--
CREATE TABLE Becario
(
orden INTEGER NOT NULL,
n_avisos INTEGER NOT NULL
)INHERITS(usuario);

                    --Libro--
CREATE TABLE Libro
(
ISBN text PRIMARY KEY,
Titulo text NOT NULL,
Categoria text NOT NULL
);

                 --Fotocopia--
CREATE TABLE FotoCopia 
(
Periodo text PRIMARY KEY,
N_Impresiones INTEGER,
Realizadas INTEGER,
Restantes INTEGER
);
                    
                 --Ordenadores--
CREATE TABLE FotoCopia 
(
Periodo text PRIMARY KEY,
N_Impresiones INTEGER,
Realizadas INTEGER,
Restantes INTEGER
);
                 --Lavadoras--

CREATE TABLE Lavadoras
(
Id  INTEGER PRIMARY KEY NOT NULL,
Observacion text,
Disponible BOOLEAN NOT NULL
);

                 --Secadoras--
CREATE TABLE Secadoras
(
Id  INTEGER PRIMARY KEY NOT NULL,
Observacion text,
Disponible BOOLEAN NOT NULL
);

                 --Material--
CREATE TABLE Material
(
Id  SERIAL PRIMARY KEY NOT NULL,
Nombre text  NOT NULL,
Stock INTEGER NOt NULL,
prestadas INTEGER 
);

                --Habitación--
CREATE TABLE Habitacion
(
Numero INTEGER PRIMARY KEY NOT NULL,
Planta INTEGER NOT NULL,
Orientacion text NOT NULL,
observaciones text
);

               --TurnoL--
(
ID_Turno INTEGER NOT NULL,
Inicio TIMESTAMP,
Fin TIMESTAMP,
Cambio TIMESTAMP,
Fecha text NOT NULL,
PRIMARY KEY(Fecha,Inicio,ID_Turno)
);

                --TurnoB--
(
ID_Turno INTEGER NOT NULL,
Inicio TIMESTAMP,
Fin TIMESTAMP,
Cambio TIMESTAMP,
Fecha text NOT NULL,
PRIMARY KEY(Fecha,Inicio,ID_Turno)
);
```

### Creación de la Base de Datos
![Creacion BD](https://github.com/PanchoMen/ADM_BBDD/blob/master/Proyecto/Imagenes/Captura%20de%20pantalla%202019-02-03%20a%20las%2019.34.38.png "Creacion BD")
![Tablas](https://github.com/PanchoMen/ADM_BBDD/blob/master/Proyecto/Imagenes/Captura%20de%20pantalla%202019-02-03%20a%20las%2019.38.18.png "Tablas")

### Carga de Datos
```SQL
-- USUARIOS

INSERT INTO usuario VALUES('43832003Y', 'alu0100846768', md5('12345'), 'Francisco Javier', 'Mendoza Álvarez', NULL, NULL, '2015-2016', 15);
INSERT INTO usuario VALUES('43786534G', 'alu0100834564', md5('absdf'), 'Pedro', 'Rodriguez Darias', NULL, 616873456, '2015-2016', 20);
INSERT INTO usuario VALUES('34897654R', 'alu0100908872', md5('phajsa'), 'Raúl', 'Herrera Arteaga', NULL, NULL, '2016-2017', 1);
INSERT INTO usuario VALUES('56781234T', 'alu0101009856', md5('a_00'), 'Elena', 'Mesa Cruz', NULL, 619087236, '2016-2017', 2);
INSERT INTO usuario VALUES('45673928P', 'alu0100990123', md5('sadasdsad'), 'Nerea', 'Darias Lago', 'NereaDL@gmail.com', NULL, '2017-2018', 6);

-- BECARIOS

INSERT INTO becario VALUES('43832003Y', 1);
INSERT INTO becario VALUES('34897654R', 5);
INSERT INTO becario VALUES('45673928P', 3);

-- HABITACIONES

INSERT INTO habitacion VALUES(101, 1, 'Detrás', 'Doble', FALSE);
INSERT INTO habitacion VALUES(102, 1, 'Detrás', 'Individual', FALSE);
INSERT INTO habitacion VALUES(103, 1, 'Detrás', 'Individual', FALSE);
INSERT INTO habitacion VALUES(104, 1, 'Detrás', 'Doble', FALSE);
INSERT INTO habitacion VALUES(105, 1, 'Detrás', 'Doble', FALSE);
INSERT INTO habitacion VALUES(106, 1, 'Delante', 'Doble', FALSE);
INSERT INTO habitacion VALUES(107, 1, 'Delante', 'Doble', FALSE);
INSERT INTO habitacion VALUES(108, 1, 'Delante', 'Individual', FALSE);
INSERT INTO habitacion VALUES(109, 1, 'Delante', 'Individual', FALSE);
INSERT INTO habitacion VALUES(110, 1, 'Delante', 'Doble', FALSE);
INSERT INTO habitacion VALUES(111, 1, 'Delante', 'Doble', TRUE);
INSERT INTO habitacion VALUES(112, 1, 'Delante', 'Individual', TRUE);
INSERT INTO habitacion VALUES(113, 1, 'Delante', 'Individual', FALSE);
INSERT INTO habitacion VALUES(114, 1, 'Delante', 'Doble', FALSE);
INSERT INTO habitacion VALUES(115, 1, 'Delante', 'Doble', FALSE);
INSERT INTO habitacion VALUES(116, 1, 'Detrás', 'Doble', FALSE);
INSERT INTO habitacion VALUES(117, 1, 'Detrás', 'Individual', TRUE);
INSERT INTO habitacion VALUES(118, 1, 'Detrás', 'Individual', TRUE);
INSERT INTO habitacion VALUES(119, 1, 'Detrás', 'Doble', TRUE);
INSERT INTO habitacion VALUES(120, 1, 'Detrás', 'Doble', TRUE);

-- LAVADORAS

INSERT INTO lavadora VALUES(1, TRUE);
INSERT INTO lavadora VALUES(2, TRUE);
INSERT INTO lavadora VALUES(3, TRUE);
INSERT INTO lavadora VALUES(4, TRUE);
INSERT INTO lavadora VALUES(5, TRUE);
INSERT INTO lavadora VALUES(6, TRUE);
INSERT INTO lavadora VALUES(7, TRUE);

-- SECADORAS

INSERT INTO secadora VALUES(1, TRUE);
INSERT INTO secadora VALUES(2, TRUE);
INSERT INTO secadora VALUES(3, TRUE);
INSERT INTO secadora VALUES(4, TRUE);
INSERT INTO secadora VALUES(5, TRUE);
INSERT INTO secadora VALUES(6, TRUE);
INSERT INTO secadora VALUES(7, TRUE);

-- BONOS FOTOCOPIAS

INSERT INTO bono_fotocopias VALUES('43832003Y', 'DIC-ENE-FEB', 300, 0, 300);
INSERT INTO bono_fotocopias VALUES('43786534G', 'DIC-ENE-FEB', 300, 0, 300);
INSERT INTO bono_fotocopias VALUES('34897654R', 'DIC-ENE-FEB', 300, 0, 300);
INSERT INTO bono_fotocopias VALUES('56781234T', 'DIC-ENE-FEB', 300, 0, 300);
INSERT INTO bono_fotocopias VALUES('45673928P', 'DIC-ENE-FEB', 300, 0, 300);

-- TURNOS DE RESERVAS

INSERT INTO turnol VALUES(1, 1, '2019-01-04', '10:00', '11:30', '13:00');
INSERT INTO turnol VALUES(2, 2, '2019-01-04', '10:00', '11:30', '13:00');
INSERT INTO turnol VALUES(3, 3, '2019-01-04', '10:00', '11:30', '13:00');
INSERT INTO turnol VALUES(4, 4, '2019-01-04', '10:00', '11:30', '13:00');

INSERT INTO turnol VALUES(1, 1, '2019-01-04', '11:30', '13:00', '14:30');
INSERT INTO turnol VALUES(2, 2, '2019-01-04', '11:30', '13:00', '14:30');
INSERT INTO turnol VALUES(3, 3, '2019-01-04', '11:30', '13:00', '14:30');
INSERT INTO turnol VALUES(4, 4, '2019-01-04', '11:30', '13:00', '14:30');

-- TURNOS DE BECAS

								-- LAVANDERÍA --

INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Lavanderia', 'Lunes', '10:00', '13:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Lavanderia', 'Lunes', '15:00', '18:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Lavanderia', 'Lunes', '18:00', '21:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Lavanderia', 'Lunes', '21:30', '00:30');

INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Lavanderia', 'Martes', '10:00', '13:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Lavanderia', 'Martes', '15:00', '18:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Lavanderia', 'Martes', '18:00', '21:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Lavanderia', 'Martes', '21:30', '00:30');

INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Lavanderia', 'Miercoles', '10:00', '13:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Lavanderia', 'Miercoles', '15:00', '18:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Lavanderia', 'Miercoles', '18:00', '21:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Lavanderia', 'Miercoles', '21:30', '00:30');

INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Lavanderia', 'Jueves', '10:00', '13:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Lavanderia', 'Jueves', '15:00', '18:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Lavanderia', 'Jueves', '18:00', '21:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Lavanderia', 'Jueves', '21:30', '00:30');

INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Lavanderia', 'Viernes', '10:00', '13:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Lavanderia', 'Viernes', '15:00', '18:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Lavanderia', 'Viernes', '18:00', '21:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Lavanderia', 'Viernes', '21:30', '00:30');

INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Lavanderia', 'Sabado', '10:00', '13:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Lavanderia', 'Sabado', '15:00', '18:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Lavanderia', 'Sabado', '18:00', '21:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Lavanderia', 'Sabado', '21:30', '00:30');

INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Lavanderia', 'Domingo', '10:00', '13:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Lavanderia', 'Domingo', '15:00', '18:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Lavanderia', 'Domingo', '18:00', '21:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Lavanderia', 'Domingo', '21:30', '00:30');


								-- ORDENADORES --

INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Ordenadores', 'Lunes', '10:00', '13:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Ordenadores', 'Lunes', '15:00', '18:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Ordenadores', 'Lunes', '18:00', '21:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Ordenadores', 'Lunes', '21:30', '00:30');

INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Ordenadores', 'Martes', '10:00', '13:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Ordenadores', 'Martes', '15:00', '18:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Ordenadores', 'Martes', '18:00', '21:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Ordenadores', 'Martes', '21:30', '00:30');

INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Ordenadores', 'Miercoles', '10:00', '13:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Ordenadores', 'Miercoles', '15:00', '18:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Ordenadores', 'Miercoles', '18:00', '21:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Ordenadores', 'Miercoles', '21:30', '00:30');

INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Ordenadores', 'Jueves', '10:00', '13:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Ordenadores', 'Jueves', '15:00', '18:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Ordenadores', 'Jueves', '18:00', '21:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Ordenadores', 'Jueves', '21:30', '00:30');

INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Ordenadores', 'Viernes', '10:00', '13:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Ordenadores', 'Viernes', '15:00', '18:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Ordenadores', 'Viernes', '18:00', '21:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Ordenadores', 'Viernes', '21:30', '00:30');

INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Ordenadores', 'Sabado', '10:00', '13:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Ordenadores', 'Sabado', '15:00', '18:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Ordenadores', 'Sabado', '18:00', '21:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Ordenadores', 'Sabado', '21:30', '00:30');

INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Ordenadores', 'Domingo', '10:00', '13:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Ordenadores', 'Domingo', '15:00', '18:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Ordenadores', 'Domingo', '18:00', '21:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Ordenadores', 'Domingo', '21:30', '00:30');


								-- BIBLIOTECA --

INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Biblioteca', 'Lunes', '10:00', '13:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Biblioteca', 'Lunes', '15:00', '18:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Biblioteca', 'Lunes', '18:00', '21:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Biblioteca', 'Lunes', '21:30', '00:30');

INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Biblioteca', 'Martes', '10:00', '13:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Biblioteca', 'Martes', '15:00', '18:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Biblioteca', 'Martes', '18:00', '21:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Biblioteca', 'Martes', '21:30', '00:30');

INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Biblioteca', 'Miercoles', '10:00', '13:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Biblioteca', 'Miercoles', '15:00', '18:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Biblioteca', 'Miercoles', '18:00', '21:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Biblioteca', 'Miercoles', '21:30', '00:30');

INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Biblioteca', 'Jueves', '10:00', '13:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Biblioteca', 'Jueves', '15:00', '18:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Biblioteca', 'Jueves', '18:00', '21:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Biblioteca', 'Jueves', '21:30', '00:30');

INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Biblioteca', 'Viernes', '10:00', '13:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Biblioteca', 'Viernes', '15:00', '18:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Biblioteca', 'Viernes', '18:00', '21:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Biblioteca', 'Viernes', '21:30', '00:30');

INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Biblioteca', 'Sabado', '10:00', '13:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Biblioteca', 'Sabado', '15:00', '18:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Biblioteca', 'Sabado', '18:00', '21:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Biblioteca', 'Sabado', '21:30', '00:30');

INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Biblioteca', 'Domingo', '10:00', '13:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Biblioteca', 'Domingo', '15:00', '18:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Biblioteca', 'Domingo', '18:00', '21:00');
INSERT INTO turnob (servicio, dia, hora_e, hora_s) VALUES('Biblioteca', 'Domingo', '21:30', '00:30');

-- HISTORIAL DE BECAS REALIZADAS

INSERT INTO becario_realiza_turno (dni_usuario, id_turno) VALUES('43832003Y', 1);

-- LIBROS

INSERT INTO libro VALUES('9788480869089', 'Farmacología', 'Medicina');
INSERT INTO libro VALUES('9823749372409', 'Estadística básica', 'Matemáticas');
INSERT INTO libro VALUES('9788489708679', 'Godwin y los orígenes del anarquismo individualista', 'Politica-Filosofía');

-- MATERIALES

INSERT INTO material (nombre, stock) VALUES('Almohadas', 80);
INSERT INTO material (nombre, stock) VALUES('Funda de almohada', 80);
INSERT INTO material (nombre, stock) VALUES('Edredón', 70);

-- ORDENADOR

INSERT INTO ordenador VALUES(1, 'Windows 10');
INSERT INTO ordenador VALUES(2, 'Windows 10');
INSERT INTO ordenador VALUES(4, 'Ubuntu 16.04');
INSERT INTO ordenador VALUES(5, 'Ubuntu 18.04');

---------------------------------------------------------------------------------

-- PAGO

INSERT INTO pago VALUES('0983029478934', 'Octubre', '2018-2019', 224.42);
INSERT INTO pago VALUES('9823749283233', 'Octubre', '2018-2019', 224.42);
INSERT INTO pago VALUES('8273984732873', 'Noviembre', '2018-2019', 224.42);
INSERT INTO pago VALUES('8213982713822', 'Febrero', '2018-2019', 224.42);


-- VISITA

INSERT INTO visita (dni_usuario, dni_visita, fecha, nombre, apellidos, entrada, salida) VALUES('43832003Y', '34652671J', '2018-11-11', 'Benito', 'Perez Rodriguez', '15:00', '18:02');
INSERT INTO visita (dni_usuario, dni_visita, nombre, apellidos) VALUES('43832003Y', '34652671J', 'Benito', 'Perez Rodriguez');

-- ASIGNACIÓN TURNOS DE BECA

INSERT INTO becario_tiene_turno VALUES('43832003Y', 3);
INSERT INTO becario_tiene_turno VALUES('43832003Y', 12);
INSERT INTO becario_tiene_turno VALUES('34897654R', 31);
INSERT INTO becario_tiene_turno VALUES('34897654R', 32);
INSERT INTO becario_tiene_turno VALUES('45673928P', 60);
INSERT INTO becario_tiene_turno VALUES('45673928P', 72);

-- PRESTAMOS DE LIBROS

INSERT INTO prestamo_libro (dni_usuario, isbn, fecha_prestamo, fecha_devolucion) VALUES('56781234T', '9788489708679', '2018-12-2', '2018-12-10');
INSERT INTO prestamo_libro (dni_usuario, isbn) VALUES('43832003Y', '9823749372409');

-- PRESTAMOS DE MATERIAL

INSERT INTO prestamo_material (dni_usuario, id_material, fecha_prestamo, fecha_devolucion) VALUES('56781234T', '1', '2017-10-2', '2018-07-10');
INSERT INTO prestamo_material (dni_usuario, id_material) VALUES('34897654R', 1);

-- PAGOS REALIZADOS

INSERT INTO realiza_pago (dni_usuario, referencia, fecha_pago) VALUES('43832003Y', '0983029478934', '2018-10-13');
INSERT INTO realiza_pago (dni_usuario, referencia) VALUES('43832003Y', '8213982713822');

-- RESERVAS LAVADORAS

INSERT INTO reserva_lavadora VALUES('43832003Y', 4, 4, '2019-01-04', '10:00');
INSERT INTO reserva_lavadora VALUES('34897654R', 1, 1, '2019-01-04', '11:30');

-- USO DE LAVADORAS

INSERT INTO usa_lavadora VALUES('43832003Y', 4, 4, '2019-01-04', '10:00');
INSERT INTO usa_lavadora VALUES('43832003Y', 2, 2, '2019-01-04', '10:00');

-- USO ORDENADORES

INSERT INTO uso_ordenador VALUES('43786534G', 1, '2018-10-29 18:00', '2018-10-29 18:57');
INSERT INTO uso_ordenador VALUES('45673928P', 4, '2018-12-13 23:00', '2018-12-14 00:15');
INSERT INTO uso_ordenador (dni_usuario, id_ordenador) VALUES('43786534G', 2);
```

![Carga de Datos](https://github.com/PanchoMen/ADM_BBDD/blob/master/Proyecto/Imagenes/Captura%20de%20pantalla%202019-02-03%20a%20las%2019.36.29.png "Carga de Datos")

### Creación de Triggers
```SQL
CREATE OR REPLACE FUNCTION actualiza_Stock_Materiales() RETURNS TRIGGER AS $$
BEGIN
	IF NEW.fecha_devolucion IS NULL THEN
	  UPDATE material
	  SET stock = stock - 1
	  WHERE id_material = NEW.id_material;
	  
	  UPDATE material
	  SET prestadas = prestadas + 1
	  WHERE id_material = NEW.id_material;
	END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER actualizaStockMateriales BEFORE INSERT ON prestamo_material
FOR EACH ROW EXECUTE PROCEDURE actualiza_Stock_Materiales();

CREATE OR REPLACE FUNCTION actualiza_Stock_Materiales_Devueltos() RETURNS TRIGGER AS $$
BEGIN
	IF OLD.fecha_devolucion IS NULL AND NEW.fecha_devolucion IS NOT NULL THEN
	  UPDATE material
	  SET stock = stock + 1
	  WHERE id_material = NEW.id_material;
	  
	  UPDATE material
	  SET prestadas = prestadas - 1
	  WHERE id_material = NEW.id_material;
	END IF;
  	RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER actualizaStockMaterialesDevueltos AFTER UPDATE OF fecha_devolucion ON prestamo_material
FOR EACH ROW EXECUTE PROCEDURE actualiza_Stock_Materiales_Devueltos();
```

![Creacion Triggers](https://github.com/PanchoMen/ADM_BBDD/blob/master/Proyecto/Imagenes/Captura%20de%20pantalla%202019-02-03%20a%20las%2019.34.58.png "Creacion Triggers")
![Demostración Triggers](https://github.com/PanchoMen/ADM_BBDD/blob/master/Proyecto/Imagenes/Captura%20de%20pantalla%202019-02-04%20a%20las%200.18.39.png "Demostración Triggers")

### Documentos

[Modelo Conceptual (ER/E)](https://docs.google.com/document/d/1YyA7ncFUrWx-Qj04xc_uT3zIPUx9xvYZ1xDwMXrUMsI/edit)

[Modelo Lógico Relacional](https://docs.google.com/document/d/12NWO4yWV7Tdxjb-c83uA3DQr4VqoBzWgWpdW-EpUZCg/edit)

[Modelo Lógico Objeto-Relacional (UML)](https://docs.google.com/document/d/1Q4XFyFXeUylCZWycXaC_e-gI20L48b4pv-OQDFO4uUI/edit)

[Generación de Código (Scripts)](https://docs.google.com/document/d/1h85ybZ_a63iFDp155WGMczX3KedW5epCV1iWBbZeV5Y/edit)

[Carga de datos](https://docs.google.com/document/d/1PIFQGy_2bH2C8DyfVkYP3LiDT7AEl762h5ET7Wayx8I/edit)
