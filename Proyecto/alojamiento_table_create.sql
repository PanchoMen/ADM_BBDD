CREATE TABLE public.usuario (
	dni_usuario varchar(9) NOT NULL,
	niu varchar(13) NOT NULL,
	password varchar(23) NOT NULL,
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
	n_avisos integer NOT NULL,
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
	servicio varchar(10) NOT NULL,
	dia varchar(10) NOT NULL,
	hora_e time without time zone NOT NULL,
	hora_s  NOT NULL,
	PRIMARY KEY (servicio, dia, hora_e)
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
	id_material integer NOT NULL,
	nombre varchar(20) NOT NULL,
	stock integer NOT NULL,
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
	fecha date NOT NULL,
	nombre varchar(20) NOT NULL,
	apellidos varchar(30) NOT NULL,
	entrada time without time zone NOT NULL,
	salida time without time zone,
	PRIMARY KEY (dni_usuario, dni_visita, fecha)
);


CREATE TABLE public.libro (
	isbn varchar(13) NOT NULL,
	titulo varchar(50) NOT NULL,
	categoria varchar(50) NOT NULL,
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


CREATE TABLE public.reserva_lavadora (
	dni_usuario varchar(9) NOT NULL,
	id_lavadora integer NOT NULL,
	PRIMARY KEY (dni_usuario, id_lavadora)
);


CREATE TABLE public.prestamo_material (
	dni_usuario varchar(9) NOT NULL,
	id_material integer NOT NULL,
	fecha_prestamo date NOT NULL,
	fecha_devolucion date,
	PRIMARY KEY (dni_usuario, id_material, fecha_prestamo)
);


CREATE TABLE public.uso_ordenador (
	dni_usuario varchar(9) NOT NULL,
	id_ordenador integer NOT NULL,
	inicio timestamp without time zone NOT NULL,
	fin timestamp without time zone,
	PRIMARY KEY (dni_usuario, id_ordenador, inicio)
);


CREATE TABLE public.realiza_pago (
	dni_usuario varchar(9) NOT NULL,
	referencia varchar(20) NOT NULL,
	fecha_pago timestamp without time zone NOT NULL,
	PRIMARY KEY (dni_usuario, referencia)
);


CREATE TABLE public.becario_tiene_turno (
	dni_usuario varchar(9) NOT NULL,
	servicio varchar(10) NOT NULL,
	dia varchar(10) NOT NULL,
	hora_e time without time zone NOT NULL,
	PRIMARY KEY (dni_usuario, servicio, dia, hora_e)
);


CREATE TABLE public.becario_realiza_turno (
	dni_usuario varchar(9) NOT NULL,
	servicio varchar(10) NOT NULL,
	dia varchar(10) NOT NULL,
	hora_e time without time zone NOT NULL,
	entrada timestamp without time zone NOT NULL,
	salida timestamp without time zone,
	PRIMARY KEY (dni_usuario, servicio, dia, hora_e, entrada)
);


CREATE TABLE public.prestamo_libro (
	dni_usuario varchar(9) NOT NULL,
	isbn varchar(13) NOT NULL,
	fecha_prestamo timestamp without time zone NOT NULL,
	fecha_devolucion timestamp without time zone,
	PRIMARY KEY (dni_usuario, isbn, fecha_prestamo)
);


CREATE TABLE public.reserva_lavadora (
	dni_usuario varchar(9) NOT NULL,
	id_lavadora integer NOT NULL,
	fecha date NOT NULL,
	hora time without time zone NOT NULL,
	PRIMARY KEY (dni_usuario, id_lavadora, fecha, hora)
);


CREATE TABLE public.usa_lavadora (
	dni_usuario varchar(9) NOT NULL,
	id_lavadora integer NOT NULL,
	fecha date NOT NULL,
	hora time without time zone NOT NULL,
	PRIMARY KEY (dni_usuario, id_lavadora, fecha, hora)
);


ALTER TABLE public.becario ADD CONSTRAINT FK_becario__dni_usuario FOREIGN KEY (dni_usuario) REFERENCES public.usuario(dni_usuario);
ALTER TABLE public.visita ADD CONSTRAINT FK_visita__dni_usuario FOREIGN KEY (dni_usuario) REFERENCES public.usuario(dni_usuario);
ALTER TABLE public.bono_fotocopias ADD CONSTRAINT FK_bono_fotocopias__dni_usuario FOREIGN KEY (dni_usuario) REFERENCES public.usuario(dni_usuario);
ALTER TABLE public.turnol ADD CONSTRAINT FK_turnol__id_lavadora FOREIGN KEY (id_lavadora) REFERENCES public.lavadora(id_lavadora);
ALTER TABLE public.turnol ADD CONSTRAINT FK_turnol__id_secadora FOREIGN KEY (id_secadora) REFERENCES public.secadora(id_secadora);
ALTER TABLE public.reserva_lavadora ADD CONSTRAINT FK_reserva_lavadora__dni_usuario FOREIGN KEY (dni_usuario) REFERENCES public.usuario(dni_usuario);
ALTER TABLE public.reserva_lavadora ADD CONSTRAINT FK_reserva_lavadora__id_lavadora FOREIGN KEY (id_lavadora) REFERENCES public.lavadora(id_lavadora);
ALTER TABLE public.prestamo_material ADD CONSTRAINT FK_prestamo_material__dni_usuario FOREIGN KEY (dni_usuario) REFERENCES public.usuario(dni_usuario);
ALTER TABLE public.prestamo_material ADD CONSTRAINT FK_prestamo_material__id_material FOREIGN KEY (id_material) REFERENCES public.material(id_material);
ALTER TABLE public.uso_ordenador ADD CONSTRAINT FK_uso_ordenador__dni_usuario FOREIGN KEY (dni_usuario) REFERENCES public.usuario(dni_usuario);
ALTER TABLE public.uso_ordenador ADD CONSTRAINT FK_uso_ordenador__id_ordenador FOREIGN KEY (id_ordenador) REFERENCES public.ordenador(id_ordenador);
ALTER TABLE public.realiza_pago ADD CONSTRAINT FK_realiza_pago__dni_usuario FOREIGN KEY (dni_usuario) REFERENCES public.usuario(dni_usuario);
ALTER TABLE public.realiza_pago ADD CONSTRAINT FK_realiza_pago__referencia FOREIGN KEY (referencia) REFERENCES public.pago(referencia);
ALTER TABLE public.becario_tiene_turno ADD CONSTRAINT FK_becario_tiene_turno__dni_usuario FOREIGN KEY (dni_usuario) REFERENCES public.becario(dni_usuario);
ALTER TABLE public.becario_tiene_turno ADD CONSTRAINT FK_becario_tiene_turno__servicio FOREIGN KEY (servicio) REFERENCES public.turnob(servicio);
ALTER TABLE public.becario_tiene_turno ADD CONSTRAINT FK_becario_tiene_turno__dia FOREIGN KEY (dia) REFERENCES public.turnob(dia);
ALTER TABLE public.becario_tiene_turno ADD CONSTRAINT FK_becario_tiene_turno__hora_e FOREIGN KEY (hora_e) REFERENCES public.turnob(hora_e);
ALTER TABLE public.becario_realiza_turno ADD CONSTRAINT FK_becario_realiza_turno__dni_usuario FOREIGN KEY (dni_usuario) REFERENCES public.becario(dni_usuario);
ALTER TABLE public.becario_realiza_turno ADD CONSTRAINT FK_becario_realiza_turno__servicio FOREIGN KEY (servicio) REFERENCES public.turnob(servicio);
ALTER TABLE public.becario_realiza_turno ADD CONSTRAINT FK_becario_realiza_turno__dia FOREIGN KEY (dia) REFERENCES public.turnob(dia);
ALTER TABLE public.becario_realiza_turno ADD CONSTRAINT FK_becario_realiza_turno__hora_e FOREIGN KEY (hora_e) REFERENCES public.turnob(hora_e);
ALTER TABLE public.prestamo_libro ADD CONSTRAINT FK_prestamo_libro__dni_usuario FOREIGN KEY (dni_usuario) REFERENCES public.usuario(dni_usuario);
ALTER TABLE public.prestamo_libro ADD CONSTRAINT FK_prestamo_libro__isbn FOREIGN KEY (isbn) REFERENCES public.libro(isbn);
ALTER TABLE public.reserva_lavadora ADD CONSTRAINT FK_reserva_lavadora__dni_usuario FOREIGN KEY (dni_usuario) REFERENCES public.usuario(dni_usuario);
ALTER TABLE public.reserva_lavadora ADD CONSTRAINT FK_reserva_lavadora__id_lavadora FOREIGN KEY (id_lavadora) REFERENCES public.lavadora(id_lavadora);
ALTER TABLE public.usa_lavadora ADD CONSTRAINT FK_usa_lavadora__dni_usuario FOREIGN KEY (dni_usuario) REFERENCES public.usuario(dni_usuario);
ALTER TABLE public.usa_lavadora ADD CONSTRAINT FK_usa_lavadora__id_lavadora FOREIGN KEY (id_lavadora) REFERENCES public.lavadora(id_lavadora);