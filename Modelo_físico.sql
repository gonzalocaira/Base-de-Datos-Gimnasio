create database if not exists gimnasio character set utf8 collate utf8_general_ci;
use gimnasio;
create table if not exists distrito(
	nombre varchar(100) not null primary key
)engine=innodb;
create table if not exists gimnasio(
	codigo int not null primary key,
    nombre varchar(100) not null,
    telefono int not null,
    direccion varchar(100) not null,
    nombre_distrito varchar(100) not null,
    foreign key fk_nom_dist(nombre_distrito) references distrito(nombre)
    on update cascade on delete cascade
)engine=innodb;
create table if not exists promocion(
	codigo int not null primary key,
    nombre varchar(100) not null,
    descripcion text(2000),
    descuento int not null,
    fecha_ini date not null,
    fecha_fin date not null
)engine=innodb;
create table if not exists plan(
	codigo int not null primary key,
    nombre varchar(100) not null,
    precio int not null,
    descripcion text(2000)
)engine=innodb;
create table if not exists persona(
	dni int not null primary key,
    nombre varchar(100) not null,
    direccion varchar(100) not null,
    telefono int not null,
    correo varchar(100),
    fecha_nacimiento date not null,
    sexo varchar(1),
    codigo_gimnasio int not null
)engine=innodb;
create table if not exists cliente(
	dni int not null primary key,
    foreign key fk_dni_empleado(dni) references persona(dni)
    on update cascade on delete cascade,
    fecha_ini date not null,
    fecha_fin date not null,
    ocupacion varchar(50),
    telefono_emergencia int not null,
    codigo_plan int not null,
    foreign key fk_cod_plan(codigo_plan) references plan(codigo)
    on update cascade on delete cascade,
    codigo_promocion int,
    foreign key fk_cod_pro(codigo_promocion) references promocion(codigo)
    on update cascade on delete cascade,
    num_boleta int not null
)engine=innodb;
create table if not exists tecnico(
	dni int not null primary key,
    foreign key fk_dni_empleado(dni) references persona(dni)
    on update cascade on delete cascade,
    empresa_asoc varchar(100)
)engine=innodb;
create table if not exists ListaCosas(
	codigo int not null primary key,
    nombre varchar(120) not null
)engine=innodb;
create table if not exists bienesPropios(
	codigoBien int not null primary key,
    codigoLista int not null,
    foreign key fk_cod_lista(codigoLista) references ListaCosas(codigo)
    on update cascade on delete cascade,
    num_boleta int not null,
    codigo_gimnasio int not null,
    foreign key fk_cod_bgim(codigo_gimnasio) references gimnasio(codigo)
    on update cascade on delete cascade,
    precioEstimado int
)engine=innodb;
create table if not exists maquina(
	codigo int not null primary key,
    foreign key fk_cod_maq(codigo) references bienesPropios(codigoBien)
    on update cascade on delete cascade,
    marca varchar(20),
    modelo varchar(20)
)engine=innodb;
create table if not exists mantenimiento(
	dni_tecnico int not null,
    foreign key fk_mant_tec(dni_tecnico) references tecnico(dni)
    on update cascade on delete cascade,
    codigo_maquina int not null,
    foreign key fk_mant_maq(codigo_maquina) references maquina(codigo)
    on update cascade on delete cascade,
    fecha date not null,
    hora_ini time not null,
    hora_fin time not null,
    primary key (`dni_tecnico`, `codigo_maquina`)
)engine=innodb;
create table if not exists articulo_deportivo(
	codigo int not null primary key,
    foreign key fk_cod_art(codigo) references bienesPropios(codigoBien)
    on update cascade on delete cascade
)engine=innodb;
create table if not exists bienes_gimnasio(
	codigo int not null primary key,
    foreign key fk_cod_bie(codigo) references bienesPropios(codigoBien)
    on update cascade on delete cascade
)engine=innodb;
create table if not exists areas(
	codigo int not null primary key,
    nombre varchar(100) not null,
    piso int not null,
    capacidad int not null,
    codigo_gimnasio int not null,
    foreign key fk_cod_gimnasio(codigo_gimnasio) references gimnasio(codigo) 
    on update cascade on delete cascade
)engine=innodb;
create table if not exists evento(
	codigo int not null primary key,
    nombre varchar(100) not null,
    descripcion text(2000) not null,
    fecha_ini date not null,
    fecha_fin date not null,
    hora_ini time not null,
    hora_fin time not null,
    costo_entrada int not null,
    presupuesto int not null,
    codigo_gimnasio int not null,
    foreign key fk_cod_gim(codigo_gimnasio) references gimnasio(codigo) 
    on update cascade on delete cascade,
    codigo_areas int not null,
    foreign key fk_cod_sal(codigo_areas) references areas(codigo) 
    on update cascade on delete cascade
)engine=innodb;
create table if not exists empleado(
	dni int not null primary key,
    foreign key fk_dni_empleado(dni) references persona(dni)
    on update cascade on delete cascade,
    sueldo double not null
)engine=innodb;
create table if not exists trabaja(
	dni_empleado int not null,
    codigo_area int not null
)engine=innodb;
alter table trabaja add constraint PK_TRABAJA PRIMARY KEY(dni_empleado,codigo_area);
alter table trabaja add constraint CO_EMPLEADO FOREIGN KEY FK_EMPLEADO(dni_empleado) REFERENCES empleado(dni) on delete cascade on update cascade;
alter table trabaja add constraint CO_AREA FOREIGN KEY FK_AREA(codigo_area) REFERENCES areas(codigo) on delete cascade on update cascade;
create table if not exists dias_trabaja(
	dni_empleado int not null,
    foreign key fk_dni_empleado(dni_empleado) references trabaja(dni_empleado)
    on update cascade on delete cascade,
    dia varchar(20) not null,
    hora_ini time not null,
    hora_fin time not null
)engine=innodb;
alter table dias_trabaja add constraint PK_HORARIO PRIMARY KEY(dni_empleado,dia);
create table if not exists instructor(
	dni int not null primary key,
    foreign key fk_dni_empleado(dni) references empleado(dni)
    on update cascade on delete cascade,
    curso varchar(20) not null
)engine=innodb;
create table if not exists entrenador(
	dni int not null primary key,
    foreign key fk_dni_empleado(dni) references empleado(dni)
    on update cascade on delete cascade
)engine=innodb;
create table if not exists nutricionista(
	dni int not null primary key,
    foreign key fk_dni_empleado(dni) references empleado(dni)
    on update cascade on delete cascade,
    colegiatura varchar(20)
)engine=innodb;
create table if not exists enc_limpieza(
	dni int not null primary key,
    foreign key fk_dni_empleado(dni) references empleado(dni)
    on update cascade on delete cascade
)engine=innodb;
create table if not exists recepcionista(
	dni int not null primary key,
    foreign key fk_dni_empleado(dni) references empleado(dni)
    on update cascade on delete cascade
)engine=innodb;
create table if not exists fisioterapeuta(
	dni int not null primary key,
    foreign key fk_dni_empleado(dni) references empleado(dni)
    on update cascade on delete cascade
)engine=innodb;
create table if not exists asesor(
	dni int not null primary key,
    foreign key fk_dni_empleado(dni) references empleado(dni)
    on update cascade on delete cascade
)engine=innodb;
create table if not exists fichaMedica(
	codigo int not null primary key,
    fecha date not null,
    peso int not null,
    talla int not null,
    med_cintura int not null,
    med_cadera int not null,
    med_cuello int not null,
    porc_grasa_corporal int not null,
    masa_corp_magra  int not null,
    objetivo varchar(500) not null,
    dni_nutricionista int not null,
    foreign key fk_dni_nutricionista(dni_nutricionista) references nutricionista(dni)
    on update cascade on delete cascade,
    dni_cliente int not null,
    foreign key fk_dni_cliente(dni_cliente) references cliente(dni)
    on update cascade on delete cascade
)engine=innodb;
create table if not exists vacunas_ficha(
	codigo_ficha int not null primary key,
    foreign key fk_codigo_ficha_medica(codigo_ficha) references fichaMedica(codigo)
    on update cascade on delete cascade,
    vacuna varchar(30) not null
)engine=innodb;
create table if not exists operaciones_ficha(
	codigo_ficha int not null primary key,
    foreign key fk_codigo_ficha_medica(codigo_ficha) references fichaMedica(codigo)
    on update cascade on delete cascade,
    operacion varchar(30) not null
)engine=innodb;
create table if not exists enfermedades_ficha(
	codigo_ficha int not null primary key,
    foreign key fk_codigo_ficha_medica(codigo_ficha) references fichaMedica(codigo)
    on update cascade on delete cascade,
    enfermedad varchar(30) not null
)engine=innodb;
create table if not exists invitado_especial(
	dni int not null primary key,
    foreign key fk_dni_invitado_especial(dni) references persona(dni)
    on update cascade on delete cascade,
    ocupacion varchar(100) not null,
    tarifa_hora int not null
)engine=innodb;
create table if not exists participa(
	dni_invitado int not null primary key,
    foreign key fk_dni_invi(dni_invitado) references invitado_especial(dni)
    on update cascade on delete cascade,
    codigo_evento int not null,
    foreign key fk_codigo_evento(codigo_evento) references evento(codigo)
    on update cascade on delete cascade
)engine=innodb;

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

#funcion1 
drop function if exists get_anio;
delimiter //
create function get_anio(x date) returns integer
begin
    declare anio integer;
    set anio=year(x);
    return anio;
end //
delimiter ;
#funcion2
drop function if exists get_mes;
delimiter //
create function get_mes(x date) returns integer
begin
    declare mes integer;
    set mes=month(x);
    return mes;
end //
delimiter ;
#funcion3
drop function if exists get_imc;
delimiter //
create function get_imc(talla int,peso int) returns integer
begin
    return peso/(talla*talla);
end //
delimiter ;
#funcion4
drop function if exists edad;
delimiter //
create function edad(x date) returns int
begin
	declare anio integer;
    declare mes integer;
    declare dia integer;
    set anio=year(x);
    set mes=month(x);
    set dia=day(x);
    if mes='11' && dia<='20' then return (2018 - anio);end if;
    if mes='11' && dia>'20' then return (2018 - anio - 1);end if;
    if mes<'11' then return (2018 - anio);end if;
    if mes>'11' then return (2018 - anio - 1);end if;
end //
delimiter ;
#reporte1 ver progreso
drop procedure if exists ver_progreso;
delimiter //
create procedure ver_progreso(in dni int)
begin
	select fm.fecha, fm.objetivo, fm.peso, fm.talla, fm.med_cintura, fm.med_cadera, fm.med_cuello, fm.porc_grasa_corporal, 
    fm.masa_corp_magra from fichaMedica fm
    where fm.dni_cliente=dni;
    select imc(fm.peso,fm.talla) as 'IMC';
end //
delimiter ;
#insercion1 nuevo cliente
drop procedure if exists nuevo_cliente;
delimiter //
create procedure nuevo_cliente(in dni int, in nombre varchar(100), in direccion varchar(100), in telefono int, in correo varchar(100), 
in fecha_nacimiento date, in sexo varchar(1), in fecha_ini date, in fecha_fin date, in ocupacion varchar(50), in telefono_emergencia int,
in plan int , in codigo_promocion int, in num_boleta int, in codigo_gimnasio int)
begin
	INSERT INTO persona VALUES (dni,nombre,direccion,telefono,correo,fecha_nacimiento,sexo,codigo_gimnasio);
    INSERT INTO cliente VALUES (dni,fecha_ini,fecha_fin,ocupacion,telefono_emergencia,plan,codigo_promocion,num_boleta);
end //
delimiter ;
#reporte2 ver clases 
drop procedure if exists ver_clases;
delimiter //
create procedure ver_clases(in codigo_gimnasio int, in dni_usuario int)
begin
	select i.curso, dt.dia, dt.hora_ini, dt.hora_fin, t.codigo_area from dias_trabaja dt
    inner join instructor i on i.dni=dt.dni_empleado
    where persona.dni=dni_usuario and persona.codigo_gimnasio=codigo_gimnasio;
end //
delimiter ;
#reporte3 ver horario
drop procedure if exists horario_empleado;
delimiter //
create procedure horario_empleado(in dni int)
begin
	select dt.dia, dt.hora_ini, dt.hora_fin, t.codigo_area from dias_trabaja dt
    inner join trabaja t on t.dni_empleado=dni
    where dt.dni_empleado=dni;
end //
delimiter ;
#reporte4 ver eventos
drop procedure if exists ver_eventos;
delimiter //
create procedure ver_eventos()
begin
	select e.fecha_ini, e.fecha_fin, e.nombre, e.descripcion, e.hora_ini, e.hora_fin, e.costo_entrada from evento e;
end //
delimiter ;
#actualizacion1 actualizar datos de empleado
drop procedure if exists actualizar_mis_datos;
delimiter //
create procedure actualizar_mis_datos(in d int, in tel int, in dir varchar(100), in cor varchar(100))
begin
	update persona set telefono = tel where dni=d;
    update persona set direccion = dir where dni=d;
    update persona set correo = cor where dni=d;
end //
delimiter ;
#reporte5 cantidad de clientes afiliados en el mes x 
drop procedure if exists cant_clientes_afiliados_mes;
delimiter //
create procedure cant_clientes_afiliados_mes(in mes int,in anio int)
begin
	select count(c.dni) from cliente c where get_mes(c.fecha_ini)=mes and get_anio(c.fecha_ini)=anio;
end //
delimiter ;
#reporte6 cantidad de clientes afiliados en el anio x
drop procedure if exists cant_clientes_afiliados_anio;
delimiter //
create procedure cant_clientes_afiliados_anio(in anio int)
begin
	select count(c.dni) from cliente c where get_anio(c.fecha_ini)=anio group by get_mes(c.fecha_ini);
end //
delimiter ;
#insercion2 nuevo evento
drop procedure if exists nuevo_evento;
delimiter //
create procedure nuevo_evento(in codigo int, in nombre varchar(100), in descripcion text(2000), in fecha_ini date, in fecha_fin date,
in hora_ini time, in hora_fin time, in costo_entrada int, in presupuesto int, in codigo_gimnasio int, in codigo_areas int)
begin
	INSERT INTO evento VALUES (codigo, nombre, descripcion, fecha_ini, fecha_fin, hora_ini, hora_fin, costo_entrada,presupuesto, 
    codigo_gimnasio,codigo_areas);
end //
delimiter ;
#insercion3 nuevo empleado
drop procedure if exists nuevo_empleado;
delimiter //
create procedure nuevo_empleado(in dni int, in nombre varchar(100), in direccion varchar(100), in telefono int, in correo varchar(100), 
in fecha_nacimiento date, in sexo varchar(1), in codigo_gimnasio int, in sueldo int)
begin
	INSERT INTO persona VALUES (dni,nombre,direccion,telefono,correo,fecha_nacimiento,sexo,codigo_gimnasio);
    INSERT INTO empleado VALUES (dni,sueldo);
end //
delimiter ;
#insercion4 nuevo invitado especial
drop procedure if exists nuevo_invitado_especial;
delimiter //
create procedure nuevo_invitado_especial(in dni int, in nombre varchar(100), in direccion varchar(100), in telefono int, in correo varchar(100), 
in fecha_nacimiento date, in sexo varchar(1), in codigo_gimnasio int, in ocupacion varchar(100), in tarifa_hora int, in codigo_evento int)
begin
	INSERT INTO persona VALUES (dni,nombre,direccion,telefono,correo,fecha_nacimiento,sexo,codigo_gimnasio);
    INSERT INTO invitado_especial VALUES (dni,ocupacion,tarifa_hora);
    INSERT INTO participa VALUES (dni,codigo_evento);
end //
delimiter ;
#insercion5 asignar invitados para un evento
drop procedure if exists evento_invitado;
delimiter //
create procedure evento_invitado(in dni_invitado int, in codigo_evento int)
begin
    INSERT INTO participa VALUES (dni_invitado,codigo_evento);
end //
delimiter ;
#reporte7 cuantas veces ha recibido mantenimiento una maquina
drop procedure if exists reporteMantenimientosMaquina;
delimiter //
create procedure reporteMantenimientosMaquina(in codigoMaquina int)
begin
	SELECT t.dni_tecnico, m.marca, m.modelo FROM mantenimiento t 
    INNER JOIN maquina m ON t.codigo_maquina=m.codigo WHERE m.codigo=codigoMaquina;
    
end //
delimiter ;
#insercion6 asignar horarios a empleados
drop procedure if exists asignar_horarios;
delimiter //
create procedure asignar_horarios(in dni_empleado int,in codigo_area int,in dia varchar(20),in hora_ini time, in hora_fin time)
begin
	INSERT INTO trabaja VALUES (dni_empleado,codigo_area);
    INSERT INTO dias_trabaja VALUES (dni_empleado,dia,hora_ini,hora_fin);
end //
delimiter ;
#insercion7 crear area
drop procedure if exists crear_area;
delimiter //
create procedure crear_area(in codigo int,in nombre varchar(100),in piso int, in capacidad int,in codigo_gimnasio int)
begin
	INSERT INTO area VALUES (codigo,nombre,piso,capacidad,codigo_gimnasio);
end //
delimiter ;
#insercion8 nuevo tecnico
drop procedure if exists nuevo_tecnico;
delimiter //
create procedure nuevo_tecnico(in dni int, in nombre varchar(100), in direccion varchar(100), in telefono int, in correo varchar(100), 
in fecha_nacimiento date, in sexo varchar(1), in codigo_gimnasio int, in empresa_asoc varchar(100))
begin
	INSERT INTO persona VALUES (dni,nombre,direccion,telefono,correo,fecha_nacimiento,sexo,codigo_gimnasio);
    INSERT INTO tecnico VALUES (dni,empresa_asoc);
end //
delimiter ;
#insercion8 registrar mantenimiento de maquina
drop procedure if exists registrar_mantenimiento;
delimiter //
create procedure registrar_mantenimiento(in dni_tecnico int,in codigo_maquina int,in fecha date,in hora_ini time,in hora_fin time)
begin
	INSERT INTO mantenimiento VALUES (dni,nombre,direccion,telefono,correo,fecha_nacimiento,sexo,codigo_gimnasio);
end //
delimiter ;
#insercion9 crear promocion
drop procedure if exists crear_promocion;
delimiter //
create procedure crear_promocion(in codigo int,in nombre varchar(100),in descripcion int,in descuento int,in fecha_ini date,in fecha_fin date)
begin
	INSERT INTO promocion VALUES (codigo,nombre,descripcion,descuento,fecha_ini,fecha_fin);
end //
delimiter ;
#reporte7  ver promociones
drop procedure if exists ver_promociones;
delimiter //
create procedure ver_promociones()
begin
	SELECT p.nombre,p.descripcion,p.descuento,p.fecha_ini,p.fecha_fin FROM promocion p;
end //
delimiter ;
#insercion10 eliminar promocion
drop procedure if exists eliminar_promocion;
delimiter //
create procedure eliminar_promocion(in codigo int)
begin
	delete from promocion where promocion.codigo=codigo;
end //
delimiter ;
#insertar bien
drop procedure if exists agregarBien;
DELIMITER //
CREATE PROCEDURE agregarBien(in codigo int, in nombre varchar(120))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
	START TRANSACTION;
	IF EXISTS (SELECT e.codigo, e.nombre FROM listacosas e WHERE codigo=e.codigo OR e.nombre=nombre)
		THEN
			SELECT "ERROR";
            ROLLBACK;
	else
		INSERT INTO listacosas VALUES (codigo,nombre);
		COMMIT;
	END IF;

END //
DELIMITER ;
#insertar bien
drop procedure if exists NuevoBienGimnasio;
DELIMITER //
CREATE PROCEDURE NuevoBienGimnasio(in codigoBien int, in codigoLista int ,in num_boleta int,in codigo_gimnasio int,in precioEstimado double)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
	START TRANSACTION;
    INSERT INTO bienesPropios VALUES(codigoBien,codigoLista,num_boleta,codigo_gimnasio,precioEstimado);
	IF NOT EXISTS (SELECT e.codigo FROM listacosas e WHERE codigoLista=e.codigo) OR not exists (SELECT g.codigo FROM gimnasio g WHERE g.codigo=codigo_gimnasio)
		THEN
			SELECT "ERROR";
            ROLLBACK;
	END IF;
END //
DELIMITER ;