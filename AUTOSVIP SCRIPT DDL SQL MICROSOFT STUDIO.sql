CREATE DATABASE AUTOSVIP
GO

USE AUTOSVIP
GO

CREATE TABLE MARCA(
  idMarca INT PRIMARY KEY,
  Nombre_Marca VARCHAR(20) NULL
  );
  
CREATE TABLE MODELO(
  idModelo INT PRIMARY KEY,
  Nombre_Modelo VARCHAR(20) NULL,
  FK_idMarca INT,
  CONSTRAINT FKMM FOREIGN KEY (FK_idMarca) REFERENCES MARCA (idMarca)
  );

CREATE TABLE REGION(
  idRegion INT PRIMARY KEY,
  Nombre_Region VARCHAR(20) NULL,
  );

CREATE TABLE CIUDAD(
  idCiudad INT PRIMARY KEY,
  Nombre_Ciudad VARCHAR(20),
  FK_idRegion INT,
  CONSTRAINT FKCR FOREIGN KEY (FK_idRegion) REFERENCES REGION (idRegion)
  ); 

CREATE TABLE COMUNA(
  idComuna INT PRIMARY KEY,
  Nombre_Comuna VARCHAR(30),
  FK_idCiudad INT,
  CONSTRAINT FKCC FOREIGN KEY (FK_idCiudad) REFERENCES CIUDAD (idCiudad)
  );

CREATE TABLE CLIENTE(
  Rut_Cliente INT PRIMARY KEY,
  Nombre_Cliente VARCHAR(15),
  Apellido_Cliente VARCHAR(15),
  Direccion_Cliente VARCHAR(20),
  Email_Cliente VARCHAR(40),
  Comuna_Cliente VARCHAR(20),
  FK_idComuna_Cliente INT,
  CONSTRAINT FKCC2 FOREIGN KEY (FK_idComuna_Cliente) REFERENCES COMUNA (idComuna)
  );

CREATE TABLE AUTOMOVIL(
  idAutomovil INT PRIMARY KEY,
  Patente VARCHAR(20),
  Numero_Motor INT,
  Kilometraje INT,
  Fecha_Automovil DATETIME,
  Color VARCHAR(10),
  FK_idModelo INT,
  FK_Rut_Cliente INT,
  CONSTRAINT FKAM FOREIGN KEY (FK_idModelo) REFERENCES MODELO (idModelo),
  CONSTRAINT FKAC FOREIGN KEY (FK_Rut_Cliente) REFERENCES CLIENTE (Rut_Cliente)
  );

CREATE TABLE RESULTADO(
  idResultado INT PRIMARY KEY,
  Descripcion_Resultado VARCHAR(20),
  FK_idAutomovil INT,
  CONSTRAINT FKRA FOREIGN KEY (FK_idAutomovil) REFERENCES AUTOMOVIL (idAutomovil)
  );

CREATE TABLE COLOR(
  idColor INT PRIMARY KEY,
  Nombre_Color VARCHAR(10),
  Tipo_Color VARCHAR(10),
  FK_idResultado INT,
  CONSTRAINT FKCR2 FOREIGN KEY (FK_idResultado) REFERENCES RESULTADO (idResultado)
  );

CREATE TABLE MECANICO(
  Rut_Mecanico INT PRIMARY KEY,
  Nombre_Mecanico VARCHAR(20),
  Apellido_Mecanico VARCHAR(20),
  Direccion_Mecanico VARCHAR(20),
  Comuna_Mecanico VARCHAR(20),
  FK_idComuna_Mecanico INT,
  CONSTRAINT FKMC FOREIGN KEY (FK_idComuna_Mecanico) REFERENCES COMUNA (idComuna)
  );

CREATE TABLE TIENDA(
  idTienda INT PRIMARY KEY,
  Nombre_Tienda VARCHAR(20),
  Email_Tienda VARCHAR(40),
  Direccion_Tienda VARCHAR(20),
  Comuna_Tienda VARCHAR(15),
  FK_idComuna_Tienda INT,
  CONSTRAINT FKTC FOREIGN KEY (FK_idComuna_Tienda) REFERENCES COMUNA (idComuna)
  );

CREATE TABLE PROVEEDOR(
  idProveedor INT PRIMARY KEY,
  Nombre_Proveedor VARCHAR(15),
  Apellido_Proveedor VARCHAR(15),
  Direccion_Proveedor VARCHAR(20),
  Email_Proveedor VARCHAR(40),
  Comuna_Proveedor VARCHAR(15),
  FK_idComuna_Proveedor INT,
  FK_idTienda INT,
  CONSTRAINT FKPC_P FOREIGN KEY (FK_idComuna_Proveedor) REFERENCES COMUNA (idComuna),
  CONSTRAINT FKPT FOREIGN KEY (FK_idTienda) REFERENCES TIENDA (idTienda)
  );

CREATE TABLE GUIA_DESPACHO(
  idGuia_Despacho INT PRIMARY KEY,
  Nombre_Guia_Despacho VARCHAR(20),
  Insumo INT,
  Detalle_Guia_Despacho VARCHAR(40),
  FK_idProveedor INT,
  CONSTRAINT FKG_DP FOREIGN KEY (FK_idProveedor) REFERENCES PROVEEDOR (idProveedor)
  );

CREATE TABLE TALLER(
  idTaller INT PRIMARY KEY,
  Direccion_Taller VARCHAR(20),
  Email_Taller VARCHAR(30),
  Comuna_Taller VARCHAR(20),
  FK_Rut_Mecanico INT,
  FK_idComuna_Taller INT,
  FK_idGuia_Despacho INT,
  CONSTRAINT FKTR_M FOREIGN KEY (FK_Rut_Mecanico) REFERENCES MECANICO (Rut_Mecanico),
  CONSTRAINT FKTC_T FOREIGN KEY (FK_idComuna_Taller) REFERENCES COMUNA (idComuna),
  CONSTRAINT FKTG_D FOREIGN KEY (FK_idGuia_Despacho) REFERENCES GUIA_DESPACHO (idGuia_Despacho)
  );


CREATE TABLE REPARACION(
  idReparacion INT PRIMARY KEY,
  Descripcion_Reparacion VARCHAR(30),
  Valor_Reparacion INT,
  Fecha_Reparacion DATETIME,
  FK_idAutomovil INT,
  FK_Rut_Mecanico INT,
  FK_idTaller INT,
  CONSTRAINT FKRA2 FOREIGN KEY (FK_idAutomovil) REFERENCES AUTOMOVIL (idAutomovil),
  CONSTRAINT FKRR_M FOREIGN KEY (FK_Rut_Mecanico) REFERENCES MECANICO (Rut_Mecanico),
  CONSTRAINT FKRT FOREIGN KEY (FK_idTaller) REFERENCES TALLER (idTaller)
  );

CREATE TABLE RECEPCION(
  idRecepcion INT PRIMARY KEY,
  Descripcion_Recepcion VARCHAR(30),
  Fecha_Inicio DATETIME,
  Entrega VARCHAR(20),
  FK_Rut_Mecanico INT,
  FK_idAutomovil INT,
  FK_Rut_Cliente INT,
  FK_idTaller INT,
  CONSTRAINT FKRR_M2 FOREIGN KEY (FK_Rut_Mecanico) REFERENCES MECANICO (Rut_Mecanico),
  CONSTRAINT FKRA3 FOREIGN KEY (FK_idAutomovil) REFERENCES AUTOMOVIL (idAutomovil),
  CONSTRAINT FKRR_C FOREIGN KEY (FK_Rut_Cliente) REFERENCES CLIENTE (Rut_Cliente),
  CONSTRAINT FKRT2 FOREIGN KEY (FK_idTaller) REFERENCES TALLER (idTaller)
  );

CREATE TABLE ESTADO(
  idEstado INT PRIMARY KEY,
  Nombre_Estado VARCHAR(30),
  Tipo_Estado VARCHAR(30),
  FK_idAutomovil INT,
  CONSTRAINT FKEA FOREIGN KEY (FK_idAutomovil) REFERENCES AUTOMOVIL (idAutomovil)
  );


CREATE TABLE ORDEN_SERVICIO(
  idOrden_Servicio INT PRIMARY KEY,
  Presupuesto VARCHAR(30),
  Fecha_Inicio_Orden_Servicio DATETIME,
  Tipo_Valor VARCHAR(20),
  Pieza VARCHAR(30),
  Cantidad_Orden_Servicio INT,
  FK_Rut_Mecanico INT,
  FK_idEstado INT,
  FK_idAutomovil INT,
  CONSTRAINT FKO_SR_M FOREIGN KEY (FK_Rut_Mecanico) REFERENCES MECANICO (Rut_Mecanico),
  CONSTRAINT FKO_SE FOREIGN KEY (FK_idEstado) REFERENCES ESTADO (idEstado),
  CONSTRAINT FKO_SA FOREIGN KEY (FK_idAutomovil) REFERENCES AUTOMOVIL (idAutomovil)
  );

CREATE TABLE INVENTARIO(
  idInventario INT PRIMARY KEY,
  Nombre_Inventario VARCHAR(30),
  Descripcion_Inventario VARCHAR(40),
  FK_idTaller INT,
  CONSTRAINT FKIT FOREIGN KEY (FK_idTaller) REFERENCES TALLER (idTaller)
  );

CREATE TABLE PRODUCTO(
  idProducto INT PRIMARY KEY,
  Nombre_Producto VARCHAR(40),
  Precio_Producto INT,
  Stock_Producto INT,
  FK_idInventario INT,
  CONSTRAINT FKPI FOREIGN KEY (FK_idInventario) REFERENCES INVENTARIO (idInventario)
  );

CREATE TABLE FACTURA(
  idFactura_Folio INT PRIMARY KEY,
  Precio_Neto INT,
  Precio_IVA INT,
  IVA INT,
  Fecha_Emision_Factura DATETIME,
  Hora_Emision_Factura DATETIME,
  Datos_Cliente VARCHAR(40),
  Metodo_Pago VARCHAR(20),
  FK_Rut_Cliente INT,
  FK_idOrden_Servicio INT,
  FK_idProducto INT,
  FK_idTienda INT,
  FK_idProveedor INT,
  CONSTRAINT FKFR_C FOREIGN KEY (FK_Rut_Cliente) REFERENCES CLIENTE (Rut_Cliente),
  CONSTRAINT FKFO_S FOREIGN KEY (FK_idOrden_Servicio) REFERENCES ORDEN_SERVICIO (idOrden_Servicio),
  CONSTRAINT FKFP FOREIGN KEY (FK_idProducto) REFERENCES PRODUCTO (idProducto),
  CONSTRAINT FKFT FOREIGN KEY (FK_idTienda) REFERENCES TIENDA (idTienda),
  CONSTRAINT FKFP2 FOREIGN KEY (FK_idProveedor) REFERENCES PROVEEDOR (idProveedor)
  );

CREATE TABLE TELEFONO(
  idTelefono INT PRIMARY KEY,
  Nombre_Telefono VARCHAR(20),
  FK_Fono_Taller INT,
  FK_Fono_Cliente INT,
  FK_Fono_Tienda INT,
  FK_Fono_Proveedor INT,
  FK_Fono_Mecanico INT,
  FK_idFactura_Folio INT,
  CONSTRAINT FKTF_T FOREIGN KEY (FK_Fono_Taller) REFERENCES TALLER (idTaller),
  CONSTRAINT FKTF_C FOREIGN KEY (FK_Fono_Cliente) REFERENCES CLIENTE (Rut_Cliente),
  CONSTRAINT FKTF_T2 FOREIGN KEY (FK_Fono_Tienda) REFERENCES TIENDA (idTienda),
  CONSTRAINT FKTF_P FOREIGN KEY (FK_Fono_Proveedor) REFERENCES PROVEEDOR (idProveedor),
  CONSTRAINT FKTF_M FOREIGN KEY (FK_Fono_Mecanico) REFERENCES MECANICO (Rut_Mecanico),
  CONSTRAINT FKTF_F FOREIGN KEY (FK_idFactura_Folio) REFERENCES FACTURA (idFactura_Folio)
  );

CREATE TABLE DETALLE(
  idDetalle INT PRIMARY KEY,
  FK_idFactura_Folio INT,
  FK_idProducto INT,
  CONSTRAINT FKDF_F FOREIGN KEY (FK_idFactura_Folio) REFERENCES FACTURA (idFactura_Folio),
  CONSTRAINT FKDP FOREIGN KEY (FK_idProducto) REFERENCES PRODUCTO (idProducto)
  );

CREATE TABLE TIPO_ORDEN_SERVICIO(
  idTipo_Orden_Servicio INT PRIMARY KEY,
  Nombre_Tipo_Orden_Servicio VARCHAR(30),
  Descripcion_Tipo_Orden_Servicio VARCHAR(40),
  FK_idOrden_Servicio INT,
  CONSTRAINT FKT_O_SO_S FOREIGN KEY (FK_idOrden_Servicio) REFERENCES ORDEN_SERVICIO (idOrden_Servicio)
  );

CREATE TABLE REPUESTO(
  idRepuesto INT PRIMARY KEY,
  Descripcion_Repuesto VARCHAR(40),
  Stock_Repuesto INT,
  Precio_Repuesto INT,
  Marca_Repuesto VARCHAR(20),
  Modelo_Repuesto VARCHAR(20),
  FK_idTaller INT,
  FK_Rut_Cliente INT,
  CONSTRAINT FKRT3 FOREIGN KEY (FK_idTaller) REFERENCES TALLER (idTaller),
  CONSTRAINT FKRR_C2 FOREIGN KEY (FK_Rut_Cliente) REFERENCES CLIENTE (Rut_Cliente)
  );
