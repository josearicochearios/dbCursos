-- Crear base de datos dbZAPATERIA
CREATE DATABASE dbZAPATERIA
DEFAULT CHARACTER SET utf8;

-- Poner en uso la Base de Datos
use dbZapateria

-- Creacion de la tabla MARCA
CREATE TABLE MARCA (
    CODMAR char(4) NOT NULL COMMENT 'Código de la marca',
    NOMMAR char(50) NOT NULL COMMENT 'Nombre de la marca',
    CONSTRAINT MARCA_PK PRIMARY KEY (CODMAR)
) COMMENT 'Contiene los datos de la marca';

-- Creacion de la tabla PERSONA
CREATE TABLE PERSONA (
    CODPER char(4) NOT NULL COMMENT 'Código de la persona',
    NOMPER varchar(50) NOT NULL COMMENT 'Nombre de la persona',
    APEPER varchar(50) NOT NULL COMMENT 'Apellido de la persona',
    CELPER char(9) NOT NULL COMMENT 'Celular de la persona',
    DNIPER char(8) NOT NULL COMMENT 'DNI de la persona',
    FLAGPER char(1) NOT NULL COMMENT 'Flag de la persona 
    E = empleado
    C = cliente
    P = proveedor',
    CONSTRAINT PERSONA_PK PRIMARY KEY (CODPER)
) COMMENT 'Contiene los datos de las personas';

-- Creacion de la tabla PRODUCTO
CREATE TABLE PRODUCTO (
    CODPRO char(4) NOT NULL COMMENT 'Código del producto',
    COLPRO varchar(50) NOT NULL COMMENT 'Color del producto',
    TALPRO char(2) NOT NULL COMMENT 'Talla del producto',
    PREPRO decimal(10,2) NOT NULL COMMENT 'Precio del producto',
    TIPPRO varchar(50) NOT NULL COMMENT 'Tipo de producto (sandalia, bota, zapato, etc).',
    STOPRO char(4) NOT NULL COMMENT 'Contiene el stock que se encuentra cada producto de la zapatería.',
    CODMAR char(4) NOT NULL COMMENT 'Código de la marca',
    CODPER char(4) NOT NULL COMMENT 'Código de la persona',
    CONSTRAINT PRODUCTO_PK PRIMARY KEY (CODPRO)
) COMMENT 'Contiene los datos de los productos';

-- Creacion de la tabla VENTA
CREATE TABLE VENTA (
    CODVEN char(4) NOT NULL COMMENT 'Código de la venta',
    FECVEN date NOT NULL COMMENT 'Fecha de la venta',
    CODPER char(4) NOT NULL COMMENT 'Código de la persona',
    CONSTRAINT VENTA_PK PRIMARY KEY (CODVEN)
) COMMENT 'Contiene los datos de la venta';

-- Creacion de la tabla VENTA_DETALLE
CREATE TABLE VENTA_DETALLE (
    CODVENDET char(4) NOT NULL COMMENT 'Código del detalle de la venta',
    CANVENDET char(4) NOT NULL COMMENT 'Detalle de la cantidad de la venta',
    CODPRO char(4) NOT NULL COMMENT 'Código del producto',
    CODVEN char(4) NOT NULL COMMENT 'Código de la venta',
    CONSTRAINT VENTA_DETALLE_PK PRIMARY KEY (CODVENDET)
) COMMENT 'Contiene los detalles de la venta';

-- Relaciones ente las tablas
-- Relacionar la tabla MARCA - PRODUCTO
ALTER TABLE PRODUCTO 
ADD CONSTRAINT MARCA_PRODUCTO
FOREIGN KEY PRODUCTO_MARCA (CODMAR) REFERENCES MARCA (CODMAR);

-- Relacionar la tabla PROVEEDOR - PRODUCTO
ALTER TABLE PRODUCTO 
ADD CONSTRAINT PERSONA_PRODUCTO 
FOREIGN KEY PRODUCTO_PERSONA (CODPER) REFERENCES PERSONA (CODPER);

-- Relacionar la tabla PROVEEDOR - PRODUCTO
ALTER TABLE VENTA_DETALLE 
ADD CONSTRAINT PRODUCTO_VENTA_DETALLE
FOREIGN KEY VENTA_DETALLE_PRODUCTO (CODPRO) REFERENCES PRODUCTO (CODPRO);

-- Relacionar la tabla PROVEEDOR - PRODUCTO
ALTER TABLE VENTA_DETALLE 
ADD CONSTRAINT VENTA_VENTA_DETALLE
FOREIGN KEY VENTA_DETALLE_VENTA (CODVEN) REFERENCES VENTA (CODVEN);

-- Relacionar la tabla PROVEEDOR - PRODUCTO
ALTER TABLE VENTA 
ADD CONSTRAINT PERSONA_VENTA
FOREIGN KEY VENTA_PERSONA (CODPER)REFERENCES PERSONA (CODPER);