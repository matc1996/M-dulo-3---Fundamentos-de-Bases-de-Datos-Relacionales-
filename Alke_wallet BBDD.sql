/*creacion de schema y indicar su uso. */
create schema Alke_wallet;
use alke_wallet;

/*creacion de las tablas.*/
create table Usuario(
id_usuario int not null primary key,
nombre varchar(50),
correo_electronico varchar(100),
contraseña varchar(10),
saldo int 
);

create table Transaccion(
id_transaccion int not null primary key,
id_usuario_remitente int,
id_usuario_receptor int,
moneda_id int,
importe int,
fecha_transaccion varchar(10),
foreign key(id_usuario_remitente) references usuario(id_usuario),
foreign key(id_usuario_receptor) references usuario(id_usuario),
foreign key(moneda_id) references Moneda(id_moneda)
);

create table Moneda(
id_moneda int not null primary key,
nombre_moneda varchar(20),
simbolo_moneda varchar(5)
);

/*poblado de las tablas.*/

INSERT INTO Usuario (id_usuario, nombre, correo_electronico, contraseña, saldo)
VALUES (1, 'Juan Perez', 'juan@example.com', '123456', 1000),
       (2, 'María López', 'maria@example.com', 'abcdef', 2000),
       (3, 'Carlos García', 'carlos@example.com', 'qwerty', 1500),
       (4, 'Ana Martínez', 'ana@example.com', 'zxcvbn', 1800),
       (5, 'Pedro Rodríguez', 'pedro@example.com', 'asdfgh', 1200),
       (6, 'Laura Gómez', 'laura@example.com', '123abc', 2200),
       (7, 'Jorge Hernández', 'jorge@example.com', '456def', 1300),
       (8, 'Sofía Fernández', 'sofia@example.com', '789ghi', 1700),
       (9, 'Miguel López', 'miguel@example.com', 'abc123', 1900),
       (10, 'Alejandra Pérez', 'alejandra@example.com', 'def456', 1100),
       (11, 'Luis Ramírez', 'luis@example.com', 'ghi789', 1600),
       (12, 'Patricia Rodríguez', 'patricia@example.com', '123456', 2000),
       (13, 'Mario Gutiérrez', 'mario@example.com', 'abcdef', 1400),
       (14, 'Elena Martínez', 'elena@example.com', 'qwerty', 2300),
       (15, 'Roberto Sánchez', 'roberto@example.com', 'zxcvbn', 1000),
       (16, 'Isabel Pérez', 'isabel@example.com', 'asdfgh', 2100),
       (17, 'Gabriel Gómez', 'gabriel@example.com', '123abc', 2500),
       (18, 'Carmen López', 'carmen@example.com', '456def', 1700),
       (19, 'Francisco Hernández', 'francisco@example.com', '789ghi', 1800),
       (20, 'Lucía Fernández', 'lucia@example.com', 'abc123', 1600);
       
INSERT INTO Moneda (id_moneda, nombre_moneda, simbolo_moneda)
VALUES (1, 'Dólar', 'USD'),
       (2, 'Euro', 'EUR'),
       (3, 'Peso', 'ARS'),
       (4, 'Yen', 'JPY'),
       (5, 'Libra esterlina', 'GBP');

INSERT INTO Transaccion (id_transaccion, id_usuario_remitente, id_usuario_receptor, moneda_id, importe, fecha_transaccion)
VALUES (1, 1, 2, 1, 500, '2024-04-10'),
       (2, 2, 1, 2, 300, '2024-04-09'),
       (3, 3, 4, 3, 200, '2024-04-08'),
       (4, 4, 5, 4, 100, '2024-04-07'),
       (5, 5, 6, 5, 150, '2024-04-06'),
       (6, 6, 7, 1, 250, '2024-04-05'),
       (7, 7, 8, 2, 350, '2024-04-04'),
       (8, 8, 9, 3, 450, '2024-04-03'),
       (9, 9, 10, 4, 550, '2024-04-02'),
       (10, 10, 11, 5, 650, '2024-04-01'),
       (11, 11, 12, 1, 750, '2024-03-31'),
       (12, 12, 13, 2, 850, '2024-03-30'),
       (13, 13, 14, 3, 950, '2024-03-29'),
       (14, 14, 15, 4, 1050, '2024-03-28'),
       (15, 15, 16, 5, 1150, '2024-03-27'),
       (16, 16, 17, 1, 1250, '2024-03-26'),
       (17, 17, 18, 2, 1350, '2024-03-25'),
       (18, 18, 19, 3, 1450, '2024-03-24'),
       (19, 19, 20, 4, 1550, '2024-03-23'),
       (20, 20, 1, 5, 1650, '2024-03-22');
       (21, 2, 15, 1, 500, '2024-04-11');
	
/*Creacion de consultas.*/

/*obtener el nombre de la moneda elegida por un usuario especifico*/
select m.nombre_moneda, t.fecha_transaccion
from transaccion t
inner join moneda m on t.moneda_id = m.id_moneda
where t.id_usuario_remitente = 4;	

/*obtener todas las transacciones registradas*/
select * from transaccion;

/*obtener todas las transacciones realizadas por un usuario especifico*/
select * 
from transaccion
where id_usuario_remitente = 2; 

/*modificar el campo correo electronico de un usuario especifico*/
update Usuario set correo_electronico = 'nuevo_correo@example.com'
where id_usuario = 5;


/*eliminar los datos de una transaccion*/
delete from Transaccion 
where id_transaccion = 6;

/*--------------------------------------------------------------------------------------------*/

