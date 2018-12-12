
INSERT INTO distrito VALUES ('Cercado');

INSERT INTO gimnasio VALUES (01,'Revo Sport Cercado',400001,'Calle Paucarpata 101','Cercado');

INSERT INTO promocion VALUES (001,'Navidenia','Descuento del 10% en cualquier plan. Acumulable con otras promociones.',10,'2018-12-01','2018-12-31');
INSERT INTO promocion VALUES (002,'Universitario','Descuento del 20% en cualquier plan. No acumulable con otras promociones.',20,'2018-01-01','2018-12-31');
INSERT INTO promocion VALUES (003,'Deportista','Descuento del 10% los tres primeros meses en plan semestral y anual. No acumulable con otras promociones.',10,'2018-06-01','2018-10-15');

INSERT INTO plan VALUES (1,'Mensual',140,'Incluye control nutricional.');
INSERT INTO plan VALUES (2,'Trimestral',250,'Incluye control nutricional. Acceso gratis a 1 evento.');
INSERT INTO plan VALUES (3,'Semestral',370,'Incluye control nutricional. Acceso gratis a 3 eventos.');
INSERT INTO plan VALUES (4,'Anual',599,'Incluye control nutricional. Acceso gratis a todos los eventos.');

INSERT INTO persona VALUES (70000001,'Jose Trauco','Arequipa 100',600001,'joset@gmail.com','1980-11-21','M',01);
INSERT INTO persona VALUES (70000002,'Marco Martinez','Arequipa 200',600002,'marcom@gmail.com','1980-12-21','M',01);
INSERT INTO persona VALUES (70000003,'Martin Vizcarra','Arequipa 300',600003,'martinv@gmail.com','1980-10-21','M',01);
INSERT INTO persona VALUES (70000004,'Alan Garcia','Arequipa 400',600004,'alang@gmail.com','1980-01-21','M',01);
INSERT INTO persona VALUES (70000005,'Ollanta Humala','Arequipa 500',600005,'ollantah@gmail.com','1981-03-21','M',01);
INSERT INTO persona VALUES (70000006,'Popi Olivera','Arequipa 600',600006,'popio@gmail.com','1978-05-21','M',01);
INSERT INTO persona VALUES (70000007,'Maria Gomez','Arequipa 700',600007,'mariag@gmail.com','1978-05-21','F',01);
INSERT INTO persona VALUES (70000008,'Mario Olivera','Arequipa 800',600008,'marioo@gmail.com','1979-06-22','M',01);
INSERT INTO persona VALUES (70000009,'Fernanda Olivera','Arequipa 900',600009,'fernandao@gmail.com','1979-07-23','F',01);

INSERT INTO persona VALUES (70000010,'Luz Martinez','Arequipa',6000010,'luz@gmail.com','1980-11-21','F',01);
INSERT INTO persona VALUES (70000011,'Miguel Martinez','Arequipa',6000011,'miguel@gmail.com','1980-11-21','M',01);
INSERT INTO persona VALUES (70000012,'Jesus Martinez','Arequipa',6000012,'jesus@gmail.com','1980-11-21','M',01);
INSERT INTO persona VALUES (70000013,'Lucia Martinez','Arequipa',6000013,'lucia@gmail.com','1980-11-21','F',01);
INSERT INTO persona VALUES (70000014,'Mario Martinez','Arequipa',6000014,'mario@gmail.com','1980-11-21','M',01);
INSERT INTO persona VALUES (70000015,'Sebastian Martinez','Arequipa',6000015,'sebastian@gmail.com','1980-11-21','M',01);
INSERT INTO persona VALUES (70000016,'Marcelo Martinez','Arequipa',6000016,'marcelo@gmail.com','1980-11-21','M',01);
INSERT INTO persona VALUES (70000017,'Melo Martinez','Arequipa',6000017,'melo@gmail.com','1980-11-21','M',01);
INSERT INTO persona VALUES (70000018,'Rodrigo Martinez','Arequipa',600018,'rodrigo@gmail.com','1980-11-21','M',01);
INSERT INTO persona VALUES (70000019,'Rocio Martinez','Arequipa',6000019,'rocio@gmail.com','1980-11-21','F',01);
INSERT INTO persona VALUES (70000020,'Mariano Martinez','Arequipa',6000020,'mariano@gmail.com','1980-11-21','M',01);

INSERT INTO persona VALUES (70000021,'Elon Musk','Lima',600021,'elon@gmail.com','1980-11-21','M',01);
INSERT INTO persona VALUES (70000022,'Jacinto Martinez','Arequipa',6000022,'j@gmail.com','1980-11-21','M',01);
INSERT INTO persona VALUES (70000023,'Lourdez Martinez','Arequipa',6000023,'l@gmail.com','1980-11-21','F',01);
INSERT INTO persona VALUES (70000024,'Martin Martinez','Arequipa',6000024,'m@gmail.com','1980-11-21','M',01);
INSERT INTO persona VALUES (70000025,'Sejota Martinez','Arequipa',6000025,'se@gmail.com','1980-11-21','M',01);
INSERT INTO persona VALUES (70000026,'Marco Polo Martinez','Arequipa',6000026,'m@gmail.com','1980-11-21','M',01);
INSERT INTO persona VALUES (70000027,'Pepe Martinez','Arequipa',6000027,'pp@gmail.com','1980-11-21','M',01);
INSERT INTO persona VALUES (70000028,'Rosa Martinez','Arequipa',600028,'ro@gmail.com','1980-11-21','F',01);
INSERT INTO persona VALUES (70000029,'Rio Martinez','Arequipa',6000029,'rio@gmail.com','1980-11-21','F',01);
INSERT INTO persona VALUES (70000030,'Miguel Martinez','Arequipa',6000030,'m@gmail.com','1980-11-21','M',01);
INSERT INTO persona VALUES (70000031,'Diego Maradon','Lima',600031,'diego@gmail.com','1980-11-21','M',01);

INSERT INTO cliente VALUES (70000001,'2018-10-01','2018-11-01','Universitario',600011,1,002,300);
INSERT INTO cliente VALUES (70000010,'2018-05-01','2018-07-01','Universitario',600010,1,002,300);
INSERT INTO cliente VALUES (70000011,'2018-05-01','2018-07-01','Deportista',600011,1,002,300);
INSERT INTO cliente VALUES (70000012,'2018-03-01','2018-05-01','Deportista',600012,1,002,400);
INSERT INTO cliente VALUES (70000013,'2018-03-01','2018-05-01','Deportista',600013,1,002,400);
INSERT INTO cliente VALUES (70000014,'2018-04-01','2018-06-01','Docente',600014,1,002,400);
INSERT INTO cliente VALUES (70000015,'2018-04-01','2018-06-01','Docente',600015,1,002,500);
INSERT INTO cliente VALUES (70000016,'2018-02-01','2018-11-01','Estudiante',600016,1,002,500);
INSERT INTO cliente VALUES (70000017,'2018-02-01','2018-11-01','Estudiante',600017,1,002,500);
INSERT INTO cliente VALUES (70000018,'2018-01-01','2018-07-01','Universitario',600018,1,002,600);
INSERT INTO cliente VALUES (70000019,'2018-01-01','2018-07-01','Universitario',600018,1,002,600);
INSERT INTO cliente VALUES (70000020,'2018-10-01','2018-12-01','Universitario',600020,1,002,600);

INSERT INTO tecnico VALUES (70000002,'Andenes Tec');
INSERT INTO tecnico VALUES (70000021,'Reparacion Fast');
INSERT INTO tecnico VALUES (70000022,'Star Tec');

INSERT INTO areas VALUES (100,'Recepcion',1,20,01);
INSERT INTO areas VALUES (300,'Area de musculatura',3,80,01);
INSERT INTO areas VALUES (101,'Area de clases',1,50,01);
INSERT INTO areas VALUES (301,'Area de chequeo nutricional',3,10,01);

INSERT into evento VALUES (00101,'Evento A','Descripcion A','2018-03-01','2018-03-06','10:00','14:00',35,600,01,101);

INSERT INTO empleado VALUES (70000003,1000);
INSERT INTO empleado VALUES (70000004,1000);
INSERT INTO empleado VALUES (70000005,1000);
INSERT INTO empleado VALUES (70000006,1000);
INSERT INTO empleado VALUES (70000007,1000);
INSERT INTO empleado VALUES (70000008,1000);
INSERT INTO empleado VALUES (70000009,1000);

INSERT INTO recepcionista VALUE (70000003);
INSERT INTO instructor VALUES (70000004,'Baile');
INSERT INTO entrenador VALUE  (70000005);
INSERT INTO asesor VALUE (70000006);
INSERT INTO nutricionista VALUES (70000007,64537);
INSERT INTO enc_limpieza VALUE (70000008);
INSERT INTO fisioterapeuta VALUE (70000009);

INSERT INTO trabaja VALUES (70000003,100);
INSERT INTO trabaja VALUES (70000004,101);
INSERT INTO trabaja VALUES (70000005,300);
INSERT INTO trabaja VALUES (70000006,100);
INSERT INTO trabaja VALUES (70000007,301);
INSERT INTO trabaja VALUES (70000009,301);

INSERT INTO dias_trabaja VALUES (70000003,'Lunes','6:00','23:00');
INSERT INTO dias_trabaja VALUES (70000003,'Martes','6:00','23:00');
INSERT INTO dias_trabaja VALUES (70000003,'Miercoles','6:00','23:00');
INSERT INTO dias_trabaja VALUES (70000003,'Jueves','6:00','23:00');
INSERT INTO dias_trabaja VALUES (70000003,'Viernes','6:00','23:00');
INSERT INTO dias_trabaja VALUES (70000003,'Sabado','6:00','23:00');
INSERT INTO dias_trabaja VALUES (70000003,'Domingo','6:00','23:00');

INSERT INTO dias_trabaja VALUES (70000004,'Viernes','10:00','14:00');
INSERT INTO dias_trabaja VALUES (70000004,'Sabado','6:00','10:00');
INSERT INTO dias_trabaja VALUES (70000004,'Domingo','10:00','14:00');

INSERT INTO dias_trabaja VALUES (70000005,'Lunes','6:00','23:00');
INSERT INTO dias_trabaja VALUES (70000005,'Martes','6:00','23:00');
INSERT INTO dias_trabaja VALUES (70000005,'Miercoles','6:00','23:00');
INSERT INTO dias_trabaja VALUES (70000005,'Jueves','6:00','23:00');
INSERT INTO dias_trabaja VALUES (70000005,'Viernes','6:00','23:00');
INSERT INTO dias_trabaja VALUES (70000005,'Sabado','6:00','23:00');
INSERT INTO dias_trabaja VALUES (70000005,'Domingo','6:00','23:00');

INSERT INTO dias_trabaja VALUES (70000006,'Lunes','6:00','23:00');
INSERT INTO dias_trabaja VALUES (70000006,'Martes','6:00','23:00');
INSERT INTO dias_trabaja VALUES (70000006,'Miercoles','6:00','23:00');
INSERT INTO dias_trabaja VALUES (70000006,'Jueves','6:00','23:00');
INSERT INTO dias_trabaja VALUES (70000006,'Viernes','6:00','23:00');
INSERT INTO dias_trabaja VALUES (70000006,'Sabado','6:00','23:00');
INSERT INTO dias_trabaja VALUES (70000006,'Domingo','6:00','23:00');

INSERT INTO dias_trabaja VALUES (70000007,'Viernes','10:00','14:00');
INSERT INTO dias_trabaja VALUES (70000007,'Sabado','10:00','14:00');
INSERT INTO dias_trabaja VALUES (70000007,'Domingo','10:00','14:00');

INSERT INTO dias_trabaja VALUES (70000009,'Viernes','10:00','14:00');
INSERT INTO dias_trabaja VALUES (70000009,'Sabado','10:00','14:00');
INSERT INTO dias_trabaja VALUES (70000009,'Domingo','10:00','14:00');

INSERT INTO fichaMedica VALUES (0001,'2018-10-02',90,160,75,80,20,40,50,'Aumentar masa muscular',70000007,70000001);
INSERT INTO fichaMedica VALUES (0002,'2018-10-15',92,154,76,81,25,47,50,'Aumentar masa muscular',70000007,70000001);
INSERT INTO fichaMedica VALUES (0003,'2018-10-02',91,161,74,83,21,40,50,'Desarrollo de resistencia',70000007,70000011);
INSERT INTO fichaMedica VALUES (0004,'2018-10-15',92,154,76,81,25,47,50,'Desarrollo de resistencia',70000007,70000012);
INSERT INTO fichaMedica VALUES (0005,'2018-10-02',90,161,75,80,20,40,50,'Desrrollo de Bipces',70000007,70000013);
INSERT INTO fichaMedica VALUES (0006,'2018-10-15',91,152,76,81,25,47,50,'Desrrollo de Bipces',70000007,70000014);
INSERT INTO fichaMedica VALUES (0007,'2018-10-02',89,162,75,80,20,40,50,'Desrrollo de Bipces',70000007,70000015);
INSERT INTO fichaMedica VALUES (0008,'2018-10-15',88,164,76,81,25,47,50,'Aumento de estatura',70000007,70000016);
INSERT INTO fichaMedica VALUES (0009,'2018-10-02',89,161,75,80,20,40,50,'Aumento de estatura',70000007,70000017);
INSERT INTO fichaMedica VALUES (0010,'2018-10-15',91,155,76,81,25,47,50,'Aumento de estatura',70000007,70000018);
INSERT INTO fichaMedica VALUES (0011,'2018-10-02',90,159,75,80,20,40,50,'Aumentar masa muscular',70000007,70000019);
INSERT INTO fichaMedica VALUES (0012,'2018-10-15',87,154,76,81,25,47,50,'Aumentar masa muscular',70000007,70000020);

INSERT INTO vacunas_ficha VALUES (0001,'Vacuna A');
INSERT INTO vacunas_ficha VALUES (0002,'Vacuna A');
INSERT INTO vacunas_ficha VALUES (0003,'Vacuna A');
INSERT INTO vacunas_ficha VALUES (0004,'Vacuna B');
INSERT INTO vacunas_ficha VALUES (0005,'Vacuna B');
INSERT INTO vacunas_ficha VALUES (0006,'Vacuna B');
INSERT INTO vacunas_ficha VALUES (0007,'Vacuna C');
INSERT INTO vacunas_ficha VALUES (0008,'Vacuna C');
INSERT INTO vacunas_ficha VALUES (0009,'Vacuna C');
INSERT INTO vacunas_ficha VALUES (0010,'Vacuna D');
INSERT INTO vacunas_ficha VALUES (0011,'Vacuna D');
INSERT INTO vacunas_ficha VALUES (0012,'Vacuna D');

INSERT INTO operaciones_ficha VALUES (0001,'Opercion A');
INSERT INTO operaciones_ficha VALUES (0002,'Opercion A');
INSERT INTO operaciones_ficha VALUES (0003,'Opercion A');
INSERT INTO operaciones_ficha VALUES (0004,'Opercion B');
INSERT INTO operaciones_ficha VALUES (0005,'Opercion B');
INSERT INTO operaciones_ficha VALUES (0006,'Opercion B');
INSERT INTO operaciones_ficha VALUES (0007,'Opercion C');
INSERT INTO operaciones_ficha VALUES (0008,'Opercion C');
INSERT INTO operaciones_ficha VALUES (0009,'Opercion C');
INSERT INTO operaciones_ficha VALUES (0010,'Opercion D');
INSERT INTO operaciones_ficha VALUES (0011,'Opercion D');
INSERT INTO operaciones_ficha VALUES (0012,'Opercion D');

INSERT INTO enfermedades_ficha VALUES (0001,'Enfermedad A');
INSERT INTO enfermedades_ficha VALUES (0002,'Enfermedad A');
INSERT INTO enfermedades_ficha VALUES (0003,'Enfermedad A');
INSERT INTO enfermedades_ficha VALUES (0004,'Enfermedad B');
INSERT INTO enfermedades_ficha VALUES (0005,'Enfermedad B');
INSERT INTO enfermedades_ficha VALUES (0006,'Enfermedad B');
INSERT INTO enfermedades_ficha VALUES (0007,'Enfermedad C');
INSERT INTO enfermedades_ficha VALUES (0008,'Enfermedad C');
INSERT INTO enfermedades_ficha VALUES (0009,'Enfermedad C');
INSERT INTO enfermedades_ficha VALUES (0010,'Enfermedad D');
INSERT INTO enfermedades_ficha VALUES (0011,'Enfermedad D');
INSERT INTO enfermedades_ficha VALUES (0012,'Enfermedad D');

INSERT INTO invitado_especial VALUES (70000031,'Deportista Profesional',100);


INSERT INTO listacosas VALUES (110,'Maquina caminadora 1');
INSERT INTO listacosas VALUES (111,'Maquina caminadora 2');
INSERT INTO listacosas VALUES (112,'Maquina ');
INSERT INTO listacosas VALUES (113,'Maquina Eliptica 1');
INSERT INTO listacosas VALUES (114,'Mancuernas 1');
INSERT INTO listacosas VALUES (115,'Pulley Machine');
INSERT INTO listacosas VALUES (116,'smith Machine');
INSERT INTO listacosas VALUES (117,'MYTHO Hip Truster');
INSERT INTO listacosas VALUES (118,'Body Solid Maquina Pro Lat');
INSERT INTO listacosas VALUES (119,'Strength Tibia Dorsi Flexion');

INSERT INTO listacosas VALUES (201,'Computadora');
INSERT INTO listacosas VALUES (202,'laptop');
INSERT INTO listacosas VALUES (203,'Camara de Seguraidad');
INSERT INTO listacosas VALUES (204,'EXTINTOR');

INSERT INTO listacosas VALUES (301,'Pesas 1kg');
INSERT INTO listacosas VALUES (302,'pesas 2kg');
INSERT INTO listacosas VALUES (303,'Pesas 5kg');
INSERT INTO listacosas VALUES (304,'Pesas 10kg');
INSERT INTO listacosas VALUES (305,'Pesas 20kg');
INSERT INTO listacosas VALUES (306,'Pesas 50kg');


INSERT INTO bienespropios VALUES(10001,110,2001,01,1200 );
INSERT INTO bienespropios VALUES(10002,111,2001,01,456 );
INSERT INTO bienespropios VALUES(10003,112,2001,01,1200 );
INSERT INTO bienespropios VALUES(10004,113,2001,01,3567 );
INSERT INTO bienespropios VALUES(10005,114,2001,01,3336 );
INSERT INTO bienespropios VALUES(10006,115,2001,01,3777 );
INSERT INTO bienespropios VALUES(10007,116,2001,01,3333 );
INSERT INTO bienespropios VALUES(10008,117,2001,01,8858 );
INSERT INTO bienespropios VALUES(10009,118,2001,01,888 );
INSERT INTO bienespropios VALUES(10010,201,2002,01,100 );
INSERT INTO bienespropios VALUES(10011,204,2003,01,1200 );
INSERT INTO bienespropios VALUES(10012,204,2004,01,600 );
INSERT INTO bienespropios VALUES(10013,204,2005,01,600 );
INSERT INTO bienespropios VALUES(10014,202,2006,01,1200 );
INSERT INTO bienespropios VALUES(10015,301,2007,01,1200 );
INSERT INTO bienespropios VALUES(10016,301,2008,01,50 );
INSERT INTO bienespropios VALUES(10017,301,2008,01,50 );
INSERT INTO bienespropios VALUES(10018,302,2008,01,50 );
INSERT INTO bienespropios VALUES(10019,302,2008,01,40 );
INSERT INTO bienespropios VALUES(10020,303,2008,01,30 );
INSERT INTO bienespropios VALUES(10021,303,2008,01,200 );
INSERT INTO bienespropios VALUES(10022,303,2008,01,300 );


