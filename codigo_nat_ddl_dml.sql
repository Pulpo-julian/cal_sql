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


