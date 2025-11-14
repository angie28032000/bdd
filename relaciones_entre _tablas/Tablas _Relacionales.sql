-- ---------------------------------------
-- Tablas principales y sus relaciones
-- ---------------------------------------

-- 1) tabla usuario
CREATE TABLE usuario (
    cedula CHAR(10) PRIMARY KEY,
    nombre VARCHAR(25) NOT NULL,
    apellido VARCHAR(25) NOT NULL,
    tipo_cuenta VARCHAR(25),
    limite_credito NUMERIC(10,2)
);

-- 2) tabla cuentas (relacionada con usuario)
CREATE TABLE cuentas (
    numero_cuenta CHAR(15) PRIMARY KEY,
    cedula_propietario CHAR(10) NOT NULL,
    fecha_creacion DATE NOT NULL,
    saldo NUMERIC(10,2) NOT NULL,
    CONSTRAINT fk_cuentas_usuario FOREIGN KEY (cedula_propietario) REFERENCES usuario(cedula)
);

-- 3) tabla clientes
CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    cedula CHAR(10) UNIQUE NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL
);

-- 4) tabla compras (relacionada con clientes)
CREATE TABLE compras (
    id_compra SERIAL PRIMARY KEY,
    cedula CHAR(10) NOT NULL,
    fecha_compra DATE NOT NULL,
    monto NUMERIC(10,2) NOT NULL,
    CONSTRAINT fk_compras_clientes FOREIGN KEY (cedula) REFERENCES clientes(cedula)
);

-- 5) tabla productos
CREATE TABLE productos (
    codigo SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio NUMERIC(10,2) NOT NULL,
    stock INT NOT NULL
);

-- 6) tabla ventas (relacionada con productos; suponemos venta por producto simple)
CREATE TABLE ventas (
    id_venta SERIAL PRIMARY KEY,
    codigo_producto INT NOT NULL,
    fecha_venta DATE NOT NULL,
    cantidad INT NOT NULL,
    CONSTRAINT fk_ventas_productos FOREIGN KEY (codigo_producto) REFERENCES productos(codigo)
);


CREATE TABLE videojuegos (
    codigo SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(300),
    valoracion INT
);

CREATE TABLE plataformas (
    id_plataforma SERIAL PRIMARY KEY,
    nombre_plataforma VARCHAR(50) NOT NULL,
    codigo_videojuego INT NOT NULL,
    CONSTRAINT fk_plataformas_videojuegos FOREIGN KEY (codigo_videojuego)
        REFERENCES videojuegos(codigo)
);

CREATE TABLE profesores (
    codigo SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE estudiantes (
    cedula CHAR(10) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(50),
    fecha_nacimiento DATE,
    codigo_profesor INT NOT NULL,
    CONSTRAINT fk_estudiantes_profesor FOREIGN KEY (codigo_profesor)
        REFERENCES profesores(codigo)
);

CREATE TABLE empleado(
    codigo_empleado INT PRIMARY KEY,
    nombre VARCHAR(25) NOT NULL,
    fecha DATE,
    hora TIME
);

CREATE TABLE registros_entrada(
    codigo_registro INT PRIMARY KEY,
    cedula CHAR(10),
    fecha DATE,
    hora TIME,
    codigo_empleado INT,
    FOREIGN KEY (codigo_empleado) REFERENCES empleado(codigo_empleado)
);

CREATE TABLE persona(
    cedula CHAR(10) PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    estatura DECIMAL(4,2),
    fecha_nacimiento DATE,
    hora_nacimiento TIME,
    cantidad_ahorrada MONEY,
    numero_hijos INT
);

CREATE TABLE prestamo(
    cedula CHAR(10),
    monto MONEY,
    fecha_prestamo DATE,
    hora_prestamo TIME,
    garante VARCHAR(40),
    FOREIGN KEY (cedula) REFERENCES persona(cedula)
);


CREATE TABLE banco(
    codigo_banco INT PRIMARY KEY,
    codigo_transaccion INT,
    detalle VARCHAR(100)
);

CREATE TABLE transacciones(
    codigo INT PRIMARY KEY,
    numero_cuenta INT,
    monto MONEY,
    tipo CHAR(1),
    fecha DATE,
    hora TIME
);
--------INSERTS -----------------


INSERT INTO usuario(cedula, nombre, apellido, tipo_cuenta, limite_credito) VALUES
('0100000001','Juan','Perez','Ahorro', 5000.00),
('0100000002','Ana','Lopez','Corriente', 3000.00),
('0100000003','Luis','Garcia','Ahorro', 2000.00),
('0100000004','Marcos','Rios','Corriente', 1500.00),
('0100000005','Sofia','Quintero','Ahorro', 4000.00),
('0100000006','Carlos','Mendez','Corriente', 2500.00),
('0100007007','Teresa','Castro','Ahorro', 3500.00), -- cédula con 7
('0100000008','Monica','Diaz','Ahorro', 6000.00),   -- nombre Monica
('0100000009','Diego','Ruiz','Corriente', 1000.00),
('0100000010','Lucia','Vega','Ahorro', 4500.00);


INSERT INTO clientes(cedula, nombre, apellido) VALUES
('0200000001','Pedro','Alvarez'),
('0200000002','Laura','Gomez'),
('0200007003','Ricardo','Torres'), -- cédula que contiene 7
('0200000004','Monica','Sanchez'), -- cliente Monica
('0200000005','Paula','Ortiz'),
('0200000006','Andres','Vargas'),
('0200000007','Valeria','Lopez'),
('0200000008','Martin','Escobar'),
('0200000009','Isabel','Ramos'),
('0200000010','Hector','Nava');


INSERT INTO productos(nombre, descripcion, precio, stock) VALUES
('Manzana roja','Fruta fresca', 0.80, 100),     -- contiene m
('Mermelada de fresa','Envase 300g', 2.50, 50),-- contiene m
('Jamón cocido','Paquete 200g', 3.20, 30),     -- contiene m
('Pan integral','Sin azucar', 1.00, 80),
('Queso fresco', NULL, 2.00, 20),              -- descripcion NULL
('Arroz largo','Bolsa 1kg', 1.20, 120),
('Leche entera','Litro', 0.98, 200),
('Tomate','Producto natural', 0.70, 70),
('Menta fresca','Ramillete', 0.50, 40),        -- contiene m
('Aceite vegetal','Botella 1L', 4.00, 60);

INSERT INTO cuentas(numero_cuenta, cedula_propietario, fecha_creacion, saldo) VALUES
('ACC0000000001','0100000001','2022-08-21', 150.00),
('ACC0000000002','0100000002','2022-09-15', 250.50),
('ACC0000000003','0100000003','2022-12-01', 500.00),
('ACC0000000004','0100000004','2023-01-20', 999.99),
('ACC0000000005','0100000005','2023-03-10', 300.00),
('ACC0000000006','0100000006','2023-04-05', 120.00),
('ACC0000000007','0100007007','2023-05-18', 450.00),
('ACC0000000008','0100000008','2023-06-30', 600.00),
('ACC0000000009','0100000009','2023-07-22', 200.00),
('ACC0000000010','0100000010','2023-09-21', 100.00);

INSERT INTO compras(cedula, fecha_compra, monto) VALUES
('0200000001','2023-01-05', 50.00),
('0200000002','2023-02-10', 120.00),
('0200007003','2023-03-12', 80.00),
('0200000004','2023-04-20', 200.00),
('0200000005','2023-05-01', 15.00),
('0200000006','2023-06-14', 300.00),
('0200000007','2023-07-07', 45.00),
('0200000008','2023-08-09', 75.50),
('0200000009','2023-09-11', 99.99),
('0200000010','2023-09-21', 10.00);

INSERT INTO ventas(codigo_producto, fecha_venta, cantidad) VALUES
(1,'2023-01-10', 2),
(2,'2023-02-11', 1),
(3,'2023-03-12', 5),  -- al menos una venta con cantidad 5
(4,'2023-04-13', 3),
(5,'2023-05-14', 2),
(6,'2023-06-15', 4),
(7,'2023-07-16', 1),
(8,'2023-08-17', 6),
(9,'2023-09-18', 2),
(10,'2023-09-21', 5);


INSERT INTO videojuegos(nombre, descripcion, valoracion) VALUES
('God of War', 'Juego basado en dioses y Guerra épica', 95),
('Call of Duty', 'Videojuego de Guerra moderna', 92),              -- inicia con C
('Cyberpunk 2077', 'Ciudad futurista con acción intensa', 88),      -- inicia con C
('Dark Souls', 'Desafío extremo en un mundo oscuro', 93),           -- inicia con D
('Doom Eternal', 'Disparos y Guerra contra demonios', 90),          -- inicia con D
('Age of Empires', 'Estrategia en tiempos de Guerra', 89),
('Gears of War', 'Combate y Guerra contra los Locust', 87),
('The Last of Us', 'Supervivencia en un mundo devastado', 96),
('Minecraft', 'Juego creativo en mundos infinitos', 85),
('Fortnite', 'Batallas y construcción en tiempo real', 80);


INSERT INTO plataformas(nombre_plataforma, codigo_videojuego) VALUES
('PlayStation 5', 1),
('PC', 1),
('Xbox Series X', 2),
('PlayStation 4', 2),
('Nintendo Switch', 3),
('PC', 3),
('Xbox One', 4),
('PlayStation 5', 5),
('PC', 6),
('Xbox Series S', 7);


INSERT INTO profesores(nombre) VALUES
('Francisco'),
('María'),
('Ana'),
('Carlos'),
('Pedro'),
('Elena'),
('Fernando'),
('Julia'),
('Miguel'),
('Sofía');

INSERT INTO estudiantes(cedula, nombre, apellido, email, fecha_nacimiento, codigo_profesor) VALUES
('0100000001','Luis','Benavides','luis@gmail.com','2010-01-05', 1),   -- profesor Francisco
('0100000002','Ana','Mendoza','ana@gmail.com','2011-02-10', 2),       -- contiene n
('0100000003','Carlos','Santos','carlos@gmail.com','2009-03-12', 3),  -- contiene n
('0100000004','Lucia','Cañizares','lucia@gmail.com','2008-04-15', 4), -- contiene n
('0100000005','Daniel','Herrera','daniel@gmail.com','2012-05-11', 5),
('0100000006','María','Fernandez','maria@gmail.com','2011-06-20', 6), -- contiene n
('0100000007','Sofia','Benitez','sofia@gmail.com','2010-07-09', 7),   -- contiene n
('0100000008','Pedro','Morales','pedro@gmail.com','2009-08-21', 8),
('0100000009','Camila','Naranjo','camila@gmail.com','2008-09-17', 9), -- contiene n
('0100000010','Javier','Lopez','javier@gmail.com','2012-10-10', 10);


INSERT INTO empleado VALUES
(2201, 'Mario Torres', '2023-05-10', '09:00');


INSERT INTO registros_entrada VALUES
(1, '0102030405', '2023-08-10', '08:15', 2201),
(2, '2233445566', '2023-09-12', '09:30', 2201),
(3, '3344556677', '2023-10-01', '10:45', 2201),
(4, '4455667788', '2023-11-20', '12:50', 2201),
(5, '5566778899', '2023-12-05', '13:00', 2201),
(6, '6677889900', '2023-08-25', '08:40', 2201),
(7, '7788990011', '2023-09-03', '09:10', 2201),
(8, '8899001122', '2023-10-14', '11:20', 2201),
(9, '9900112233', '2023-11-28', '12:10', 2201),
(10,'1112223334', '2023-12-30', '08:55', 2201);

INSERT INTO persona VALUES
('1111111111', 'Sean', 'Perez', 1.75, '1990-02-10', '06:50', 2000, 1),
('2222222222', 'Laura', 'Mora', 1.62, '1995-08-12', '08:20', 1500, 0);


INSERT INTO prestamo VALUES
('1111111111', 300, '2024-01-10', '10:00', 'Carlos'),
('1111111111', 950, '2024-03-15', '14:30', 'María'),
('2222222222', 500, '2024-02-01', '09:00', 'Pedro'),
('2222222222', 800, '2024-02-20', '11:15', 'Luis'),
('2222222222', 120, '2024-03-11', '16:45', 'Ana');


INSERT INTO transacciones VALUES
(1, 205000, 300, 'C', '2024-01-10', '09:00'),
(2, 210500, 500, 'C', '2024-02-12', '10:15'),
(3, 299999, 1200, 'C', '2024-03-01', '11:45'),
(4, 250000, 800, 'D', '2024-03-05', '08:50'),
(5, 260000, 700, 'D', '2024-03-09', '12:10');


INSERT INTO banco VALUES
(10, 1, 'Depósito cuenta 205000'),
(11, 2, 'Depósito cuenta 210500'),
(12, 3, 'Depósito cuenta 299999'),
(13, 4, 'Débito cuenta 250000'),
(14, 5, 'Débito cuenta 260000');



