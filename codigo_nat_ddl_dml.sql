-- SE CREA BASE DE DATOS CARTERAEMPLEADOS
CREATE DATABASE CarteraEmpleados;
USE CarteraEmpleados;

-- TABLA PRODUCTOS
CREATE TABLE tblProducto
(
    codigo VARCHAR(15) NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    PRIMARY KEY(codigo)
);

-- TABLA EMPRESA
CREATE TABLE tblEmpresa
(
    nit VARCHAR(12) NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefonoMovil VARCHAR(11) NULL,
    telefonoFijo VARCHAR(15) NULL,
    PRIMARY KEY(nit)
);

-- TABLA ABONO
CREATE TABLE tblAbono 
(
    consecutivo INT NOT NULL,
    cartera INT,
    fecha DATETIME NOT NULL,
    valor INT NOT NULL,
    PRIMARY KEY(consecutivo)
);

-- TABLA SUPERMERCADO
CREATE TABLE tblSupermercado
(
    nit VARCHAR(12) NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefonoMovil VARCHAR(11) NULL,
    telefonoFijo VARCHAR(15) NULL,
    PRIMARY KEY(nit)
);

-- TABLA EMPLEADO
CREATE TABLE tblEmpleado
(
    documento VARCHAR(13) NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefonoMovil VARCHAR(15) NULL,
    telefonoFijo VARCHAR(15) NOT NULL,
    empresa VARCHAR(12),
    salario INT NOT NULL,
    PRIMARY KEY(documento)
);

-- TABLA CARTERA
CREATE TABLE tblCartera
(
    consecutivo INT AUTO_INCREMENT,
    empleado VARCHAR(13),
    saldo INT NOT NULL,
    PRIMARY KEY(consecutivo)
);

-- TABLA FACTURA
CREATE TABLE tblFactura
(
    numero INT AUTO_INCREMENT,
    empleado VARCHAR(13),
    supermercado VARCHAR(12),
    fecha DATETIME NOT NULL,
    PRIMARY KEY(numero) 
);

-- TABLA FACTURAPRODUCTO
CREATE TABLE tblFacturaProducto
(
    numeroFactura INT,
    codigoProducto VARCHAR(15),
    cantidad INT NOT NULL,
    valor INT NOT NULL,
    PRIMARY KEY(numeroFactura, codigoProducto)
);

-- RELACIONES 

-- EMPLEADO EMPRESA
ALTER TABLE tblEmpleado 
ADD CONSTRAINT tblempresa_tblempleado_empresa FOREIGN KEY(empresa)
REFERENCES tblEmpresa(nit);

-- CARTERA EMPLEADO
ALTER TABLE tblCartera 
ADD CONSTRAINT tblEmpleado_tblCartera_empleado FOREIGN KEY(empleado)
REFERENCES tblEmpleado(documento);

-- ABONO CARTERA
ALTER TABLE tblAbono 
ADD CONSTRAINT tblCartera_tblAbono_cartera FOREIGN KEY(cartera)
REFERENCES tblCartera(consecutivo);

-- FACTURA EMPLEADO SUPERMERCADO
ALTER TABLE tblFactura 
ADD CONSTRAINT tblEmpleado_tblFactura_empleado FOREIGN KEY(empleado)
REFERENCES tblEmpleado(documento);

ALTER TABLE tblFactura 
ADD CONSTRAINT tblSupermercado_tblFactura_supermercado FOREIGN KEY(supermercado)
REFERENCES tblSupermercado(nit);

-- FACTURAPRODUCTO FACTURA PRODUCTO
ALTER TABLE tblFacturaProducto 
ADD CONSTRAINT tblFactura_tblFacturaPro_numfact FOREIGN KEY(numeroFactura)
REFERENCES tblFactura(numero);

ALTER TABLE tblFacturaProducto 
ADD CONSTRAINT tblProducto_tblFacturaPro_codpro FOREIGN KEY(codigoProducto)
REFERENCES tblProducto(codigo);

-- PUNTO 3
ALTER TABLE tblEmpleado CHANGE direccion direccion VARCHAR(100) NOT NULL;

-- PUNTO 4
ALTER TABLE tblProducto ADD COLUMN costo INT NOT NULL;

-- PUNTO 5
ALTER TABLE tblEmpresa DROP COLUMN telefonoMovil;



-- PUNTO 6


INSERT INTO tblEmpresa VALUES
('1','exito','CLL 23 #52-15','5605859'),
('2','Microsoft','CLL 15 #56-110','5896060'),
('3','Apple','CLL 50 #33-32','5102360');

INSERT INTO tblEmpleado VALUES
('1','camilo andres','portilla andrade','cll 23 #54-59',NULL,'5601256','1',2500000),
('2','tatiana maria','jiminez gonzales','cll 45 #12-89','3104458789','5601256','2',1200000),
('3','carlos andres','martinez gil','cll 30 #85-10',NULL,'5404584','3',5000000);

-- PUNTO 7
INSERT INTO tblCartera VALUES
(NULL,'1',1200000),
(NULL,'2',600000),
(NULL,'3',85000);

-- PUNTO 8
UPDATE tblAbono 
SET fecha = '2021/03/22'
WHERE consecutivo = 26;

-- PUNTO 9
DELETE FROM tblCartera WHERE consecutivo = 170;

-- PUNTO 10
DELETE FROM tblAbono WHERE valor >=700000 AND valor <=800000; 