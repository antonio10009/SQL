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
  Nombre_Region VARCHAR(20) NULL
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
  Apellido_Paterno_Cliente VARCHAR(15),
  Apellido_Materno_Cliente VARCHAR(15),
  Direccion_Cliente VARCHAR(20),
  Email_Cliente VARCHAR(40),
  FK_idComuna_Cliente INT,
  CONSTRAINT FKCC2 FOREIGN KEY (FK_idComuna_Cliente) REFERENCES COMUNA (idComuna)
  );

CREATE TABLE AUTOMOVIL(
  idAutomovil INT PRIMARY KEY,
  Patente VARCHAR(20),
  Numero_Motor INT,
  Kilometraje INT,
  Fecha_Automovil TIMESTAMP,
  FK_idModelo INT,
  FK_Rut_Cliente INT,
  CONSTRAINT FKAM FOREIGN KEY (FK_idModelo) REFERENCES MODELO (idModelo),
  CONSTRAINT FKAC FOREIGN KEY (FK_Rut_Cliente) REFERENCES CLIENTE (Rut_Cliente)
  );
  
CREATE TABLE COLOR(
  idColor INT PRIMARY KEY,
  Nombre_Color VARCHAR(10),
  Tipo_Color VARCHAR(10)
  FK_idAutomovil INT,
  CONSTRAINT FKCR FOREIGN KEY (FK_idAutomovil) REFERENCES AUTOMOVIL (idAutomovil)
  );

CREATE TABLE MECANICO(
  Rut_Mecanico INT PRIMARY KEY,
  Nombre_Mecanico VARCHAR(20),
  Apellido_Mecanico VARCHAR(20),
  Direccion_Mecanico VARCHAR(20),
  FK_idComuna_Mecanico INT,
  FK_idTaller INT,
  CONSTRAINT FKMC FOREIGN KEY (FK_idComuna_Mecanico) REFERENCES COMUNA (idComuna),
  CONSTRAINT FKMC_M FOREIGN KEY (FK_idTaller) REFERENCES TALLER (idTaller)
  );

CREATE TABLE TIENDA(
  idTienda INT PRIMARY KEY,
  Nombre_Tienda VARCHAR(20),
  Email_Tienda VARCHAR(40),
  Direccion_Tienda VARCHAR(20),
  FK_idComuna_Tienda INT,
  CONSTRAINT FKTC FOREIGN KEY (FK_idComuna_Tienda) REFERENCES COMUNA (idComuna)
  );

CREATE TABLE PROVEEDOR(
  idProveedor INT PRIMARY KEY,
  Nombre_Proveedor VARCHAR(15),
  Apellido_Proveedor VARCHAR(15),
  Direccion_Proveedor VARCHAR(20),
  Email_Proveedor VARCHAR(40),
  FK_idComuna_Proveedor INT,
  FK_idTienda INT,
  CONSTRAINT FKPC_P FOREIGN KEY (FK_idComuna_Proveedor) REFERENCES COMUNA (idComuna),
  CONSTRAINT FKPT FOREIGN KEY (FK_idTienda) REFERENCES TIENDA (idTienda)
  );

CREATE TABLE GUIA_DESPACHO(
  idGuia_Despacho INT PRIMARY KEY,
  Nombre_Guia_Despacho VARCHAR(20),
  Descripcion_Guia_Despacho VARCHAR(30),
  Precio_Guia_Despacho INT,
  FK_idProveedor INT,
  CONSTRAINT FKG_DP FOREIGN KEY (FK_idProveedor) REFERENCES PROVEEDOR (idProveedor) 
  );

CREATE TABLE DETALLE_GUIA_DESPACHO(
  idGuia_Despacho INT PRIMARY KEY,
  Tipo_DGD VARCHAR(30),
  Stock_DGD INT,
  FK_idGuia_Despacho INT,
  CONSTRAINT FKD_G_DGD FOREIGN KEY (FK_idGuia_Despacho) REFERENCES GUIA_DESPACHO (idGuia_Despacho)
  );

CREATE TABLE TALLER(
  idTaller INT PRIMARY KEY,
  Direccion_Taller VARCHAR(20),
  Email_Taller VARCHAR(30),
  FK_idComuna_Taller INT,
  CONSTRAINT FKTC_T FOREIGN KEY (FK_idComuna_Taller) REFERENCES COMUNA (idComuna)
  );


CREATE TABLE REPARACION(
  idReparacion INT PRIMARY KEY,
  Descripcion_Reparacion VARCHAR(30),
  Valor_Reparacion INT,
  Fecha_Reparacion TIMESTAMP,
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
  Fecha_Inicio TIMESTAMP,
  Entrega VARCHAR(20),
  FK_Rut_Mecanico INT,
  FK_idAutomovil INT,
  FK_Rut_Cliente INT,
  FK_idTaller INT,
  FK_idOrden_Servicio INT,
  CONSTRAINT FKRR_M2 FOREIGN KEY (FK_Rut_Mecanico) REFERENCES MECANICO (Rut_Mecanico),
  CONSTRAINT FKRA3 FOREIGN KEY (FK_idAutomovil) REFERENCES AUTOMOVIL (idAutomovil),
  CONSTRAINT FKRR_C FOREIGN KEY (FK_Rut_Cliente) REFERENCES CLIENTE (Rut_Cliente),
  CONSTRAINT FKRT2 FOREIGN KEY (FK_idTaller) REFERENCES TALLER (idTaller),
  CONSTRAINT FKR_OT FOREIGN KEY (FK_idOrden_Servicio) REFERENCES ORDEN_SERVICIO (idOrden_Trabajo)
  );

CREATE TABLE ESTADO(
  idEstado INT PRIMARY KEY,
  Nombre_Estado VARCHAR(30),
  Tipo_Estado VARCHAR(30)
  );

CREATE TABLE ORDEN_SERVICIO(
  idOrden_Servicio INT PRIMARY KEY,
  Presupuesto VARCHAR(30),
  Fecha_Inicio_Orden_Servicio TIMESTAMP,
  Tipo_Valor VARCHAR(20),
  Pieza VARCHAR(30),
  Cantidad_Orden_Servicio INT,
  FK_Rut_Mecanico INT,
  FK_idEstado INT,
  FK_idAutomovil INT,
  FK_Rut_Cliente INT,
  CONSTRAINT FKO_SR_M FOREIGN KEY (FK_Rut_Mecanico) REFERENCES MECANICO (Rut_Mecanico),
  CONSTRAINT FKO_SE FOREIGN KEY (FK_idEstado) REFERENCES ESTADO (idEstado),
  CONSTRAINT FKO_SA FOREIGN KEY (FK_idAutomovil) REFERENCES AUTOMOVIL (idAutomovil),
  CONSTRAINT FKO_SC FOREIGN KEY (FK_Rut_Cliente) REFERENCES CLIENTE (Rut_Cliente)
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
  FK_idTaller INT,
  FK_idDetalle_Guia_Despacho INT,
  CONSTRAINT FKPI FOREIGN KEY (FK_idInventario) REFERENCES INVENTARIO (idInventario),
  CONSTRAINT FKPT4 FOREIGN KEY (FK_idTaller) REFERENCES TALLER (idTaller),
  CONSTRAINT FKPDGD FOREIGN KEY (FK_idDetalle_Guia_Despacho) REFERENCES DETALLE_GUIA_DESPACHO (idDetalle_Guia_Despacho)
  );

CREATE TABLE FACTURA(
  idFactura_Folio INT PRIMARY KEY,
  idOrden_Servicio INT PRIMARY KEY,
  Precio_Neto INT,
  Precio_IVA INT,
  IVA INT,
  Fecha_Emision_Factura TIMESTAMP,
  Hora_Emision_Factura TIMESTAMP,
  Datos_Cliente VARCHAR(40),
  FK_Rut_Cliente INT,
  FK_idProducto INT,
  FK_idTienda INT,
  FK_idProveedor INT,
  CONSTRAINT FKFR_C FOREIGN KEY (FK_Rut_Cliente) REFERENCES CLIENTE (Rut_Cliente),
  CONSTRAINT FKFP FOREIGN KEY (FK_idProducto) REFERENCES PRODUCTO (idProducto),
  CONSTRAINT FKFT FOREIGN KEY (FK_idTienda) REFERENCES TIENDA (idTienda),
  CONSTRAINT FKFP2 FOREIGN KEY (FK_idProveedor) REFERENCES PROVEEDOR (idProveedor)
  );
  
CREATE TABLE METODO_PAGO(
  idMetodo_Pago INT PRIMARY KEY,
  Forma_Pago VARCHAR(20),
  FK_idFactura_Folio INT,
  CONSTRAINT FKMPF FOREIGN KEY (FK_idFactura_Folio) REFERENCES FACTURA (idFactura_Folio)
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
  Descripcion_Detalle VARCHAR(30),
  FK_idFactura_Folio INT,
  FK_idProducto INT,
  CONSTRAINT FKDF_F FOREIGN KEY (FK_idFactura_Folio) REFERENCES FACTURA (idFactura_Folio),
  CONSTRAINT FKDP FOREIGN KEY (FK_idProducto) REFERENCES PRODUCTO (idProducto)
  );

CREATE TABLE REPUESTO(
  idRepuesto INT PRIMARY KEY,
  Marca_Repuesto VARCHAR(20),
  Modelo_Repuesto VARCHAR(20),
  Precio_Repuesto INT,
  Descripcion_Repuesto VARCHAR(20)
  );
  
CREATE TABLE DETALLE_REPUESTO(
  idRepuesto INT PRIMARY KEY,
  Tipo_Detalle_Repuesto VARCHAR(30),
  Stock_Detalle_Repuesto INT,
  FK_idTaller INT,
  FK_idRepuesto INT,
  CONSTRAINT FKD_RT FOREIGN KEY (FK_idTaller) REFERENCES TALLER (idTaller),
  CONSTRAINT FKD_RR FOREIGN KEY (FK_idRepuesto) REPUESTO (idRepuesto)
  );