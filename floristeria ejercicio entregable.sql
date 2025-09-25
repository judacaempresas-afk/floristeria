CREATE DATABASE floristeria;
USE floristeria;


 TABLA CLIENTE

CREATE TABLE Cliente (
    DNI VARCHAR(20) PRIMARY KEY, -- Documento único
    Nombre VARCHAR(100) NOT NULL,
    Direccion VARCHAR(150),
    Telefono VARCHAR(20),
    Correo VARCHAR(100) UNIQUE
);

 TABLA PROVEEDOR

CREATE TABLE Proveedor (
    RUC VARCHAR(20) PRIMARY KEY, -- Registro Único de Contribuyente
    NombreEmpresa VARCHAR(100) NOT NULL,
    Direccion VARCHAR(150),
    Telefono VARCHAR(20),
    Correo VARCHAR(100) UNIQUE
);


 TABLA PRODUCTO

CREATE TABLE Producto (
    Codigo VARCHAR(20) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Tipo VARCHAR(50) CHECK (Tipo IN ('Ramo', 'Centro de mesa', 'Bouquet', 'Otro')),
    Precio DECIMAL(10,2) NOT NULL CHECK (Precio > 0),
    Disponibilidad INT NOT NULL CHECK (Disponibilidad >= 0)
);


 TABLA PEDIDO

CREATE TABLE Pedido (
    ID_Pedido INT AUTO_INCREMENT PRIMARY KEY,
    Fecha_Pedido DATE NOT NULL,
    Fecha_Entrega DATE,
    DireccionEntrega VARCHAR(150),
    MetodoPago VARCHAR(50) CHECK (MetodoPago IN ('Efectivo', 'Transferencia')),
    DNI_Cliente VARCHAR(20) NOT NULL,
    FOREIGN KEY (DNI_Cliente) REFERENCES Cliente(DNI)
);

 TABLA DETALLEPEDIDO
 (Relaciona Pedido con Producto)

CREATE TABLE DetallePedido (
    ID_Pedido INT,
    Codigo VARCHAR(20),
    Cantidad INT NOT NULL CHECK (Cantidad > 0),
    Subtotal DECIMAL(10,2) NOT NULL CHECK (Subtotal > 0),
    PRIMARY KEY (ID_Pedido, Codigo),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido),
    FOREIGN KEY (Codigo) REFERENCES Producto(Codigo)
);


 TABLA PROVEEDOR_PRODUCTO
 (Relaciona Proveedor con Producto)

CREATE TABLE Proveedor_Producto (
    RUC VARCHAR(20),
    Codigo VARCHAR(20),
    PRIMARY KEY (RUC, Codigo),
    FOREIGN KEY (RUC) REFERENCES Proveedor(RUC),
    FOREIGN KEY (Codigo) REFERENCES Producto(Codigo)
);


DESCRIBE Proveedor_producto;
DESCRIBE DetallePedido;
DESCRIBE Pedido;
DESCRIBE Producto;
DESCRIBE Proveedor;
DESCRIBE Cliente;

