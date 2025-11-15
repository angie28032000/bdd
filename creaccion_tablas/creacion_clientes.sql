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







