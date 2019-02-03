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
