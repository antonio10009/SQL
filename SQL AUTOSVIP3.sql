-- MySQL Script generated by MySQL Workbench
-- Sat May  1 23:54:14 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`MARCA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MARCA` (
  `idMarca` INT(20) NULL,
  `Nombre_Marca` VARCHAR(20) NULL,
  PRIMARY KEY (`idMarca`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MODELO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MODELO` (
  `idModelo` INT(20) NULL,
  `Nombre_Modelo` VARCHAR(20) NULL,
  `idMarca` INT(20) NOT NULL,
  PRIMARY KEY (`idModelo`),
  INDEX `idMarca_idx` (`idMarca` ASC) VISIBLE,
  CONSTRAINT `idMarca`
    FOREIGN KEY (`idMarca`)
    REFERENCES `mydb`.`MARCA` (`idMarca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`REGION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`REGION` (
  `idRegion` INT(20) NULL,
  `Nombre_Region` VARCHAR(20) NULL,
  PRIMARY KEY (`idRegion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CIUDAD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CIUDAD` (
  `idCiudad` INT(20) NULL,
  `Nombre_Ciudad` VARCHAR(20) NULL,
  `idRegion` INT(20) NOT NULL,
  PRIMARY KEY (`idCiudad`),
  INDEX `idRegion_idx` (`idRegion` ASC) VISIBLE,
  CONSTRAINT `idRegion`
    FOREIGN KEY (`idRegion`)
    REFERENCES `mydb`.`REGION` (`idRegion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`COMUNA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`COMUNA` (
  `idComuna` INT(20) NULL,
  `Nombre_Comuna` VARCHAR(30) NULL,
  `idCiudad` INT(20) NOT NULL,
  PRIMARY KEY (`idComuna`),
  INDEX `idCiudad_idx` (`idCiudad` ASC) VISIBLE,
  CONSTRAINT `idCiudad`
    FOREIGN KEY (`idCiudad`)
    REFERENCES `mydb`.`CIUDAD` (`idCiudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CLIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CLIENTE` (
  `Rut_Cliente` INT(10) NULL,
  `Nombre_Cliente` VARCHAR(15) NULL,
  `Apellido_Cliente` VARCHAR(15) NULL,
  `Direccion_Cliente` VARCHAR(20) NULL,
  `Email_Cliente` VARCHAR(40) NULL,
  `Comuna_Cliente` VARCHAR(20) NULL,
  `idComuna_Cliente` INT(20) NOT NULL,
  PRIMARY KEY (`Rut_Cliente`),
  INDEX `idComuna_Cliente_idx` (`idComuna_Cliente` ASC) VISIBLE,
  CONSTRAINT `idComuna_Cliente`
    FOREIGN KEY (`idComuna_Cliente`)
    REFERENCES `mydb`.`COMUNA` (`idComuna`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`AUTOMOVIL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`AUTOMOVIL` (
  `idAutomovil` INT(10) NULL,
  `Patente` VARCHAR(20) NULL,
  `Numero_Motor` INT(10) NULL,
  `Kilometraje` INT(20) NULL,
  `Fecha_Automovil` DATETIME NULL,
  `Color` VARCHAR(10) NULL,
  `idModelo` INT(20) NOT NULL,
  `Rut_Cliente` INT(10) NOT NULL,
  PRIMARY KEY (`idAutomovil`),
  INDEX `idModelo_idx` (`idModelo` ASC) VISIBLE,
  INDEX `Rut_Cliente_idx` (`Rut_Cliente` ASC) VISIBLE,
  CONSTRAINT `idModelo`
    FOREIGN KEY (`idModelo`)
    REFERENCES `mydb`.`MODELO` (`idModelo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Rut_Cliente`
    FOREIGN KEY (`Rut_Cliente`)
    REFERENCES `mydb`.`CLIENTE` (`Rut_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`RESULTADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RESULTADO` (
  `idResultado` INT(10) NULL,
  `Descripcion_Resultado` VARCHAR(20) NULL,
  `idAutomovil` INT(10) NOT NULL,
  PRIMARY KEY (`idResultado`),
  INDEX `ID_Automovil_idx` (`idAutomovil` ASC) VISIBLE,
  CONSTRAINT `ID_Automovil`
    FOREIGN KEY (`idAutomovil`)
    REFERENCES `mydb`.`AUTOMOVIL` (`idAutomovil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`COLOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`COLOR` (
  `idColor` INT(10) NULL,
  `Nombre_Color` VARCHAR(10) NULL,
  `Tipo_Color` VARCHAR(10) NULL,
  `idResultado` INT(10) NOT NULL,
  PRIMARY KEY (`idColor`),
  INDEX `idResultado_idx` (`idResultado` ASC) VISIBLE,
  CONSTRAINT `idResultado`
    FOREIGN KEY (`idResultado`)
    REFERENCES `mydb`.`RESULTADO` (`idResultado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MECANICO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MECANICO` (
  `Rut_Mecanico` INT(10) NOT NULL,
  `Nombre_Mecanico` VARCHAR(20) NULL,
  `Apellido_Mecanico` VARCHAR(20) NULL,
  `Direccion_Mecanico` VARCHAR(20) NULL,
  `Comuna_Mecanico` VARCHAR(20) NULL,
  `idComuna_Mecanico` INT(20) NOT NULL,
  PRIMARY KEY (`Rut_Mecanico`),
  INDEX `idComuna_Mecanico_idx` (`idComuna_Mecanico` ASC) VISIBLE,
  CONSTRAINT `idComuna_Mecanico`
    FOREIGN KEY (`idComuna_Mecanico`)
    REFERENCES `mydb`.`COMUNA` (`idComuna`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TIENDA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TIENDA` (
  `idTienda` INT(30) NOT NULL,
  `Nombre_Tienda` VARCHAR(20) NULL,
  `Email_Tienda` VARCHAR(40) NULL,
  `Direccion_Tienda` VARCHAR(20) NULL,
  `Comuna_Tienda` VARCHAR(15) NULL,
  `idComuna_Tienda` INT(20) NOT NULL,
  PRIMARY KEY (`idTienda`),
  INDEX `idComuna_Tienda_idx` (`idComuna_Tienda` ASC) VISIBLE,
  CONSTRAINT `idComuna_Tienda`
    FOREIGN KEY (`idComuna_Tienda`)
    REFERENCES `mydb`.`COMUNA` (`idComuna`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PROVEEDOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PROVEEDOR` (
  `idProveedor` INT(20) NULL,
  `Nombre_Proveedor` VARCHAR(15) NULL,
  `Apellido_Proveedor` VARCHAR(15) NULL,
  `Direccion_Proveedor` VARCHAR(20) NULL,
  `Email_Proveedor` VARCHAR(40) NULL,
  `Comuna_Proveedor` VARCHAR(15) NULL,
  `idComuna_Proveedor` INT(20) NOT NULL,
  `idTienda` INT(30) NOT NULL,
  PRIMARY KEY (`idProveedor`),
  INDEX `idComuna_Proveedor_idx` (`idComuna_Proveedor` ASC) VISIBLE,
  INDEX `idTienda_idx` (`idTienda` ASC) VISIBLE,
  CONSTRAINT `idComuna_Proveedor`
    FOREIGN KEY (`idComuna_Proveedor`)
    REFERENCES `mydb`.`COMUNA` (`idComuna`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idTienda`
    FOREIGN KEY (`idTienda`)
    REFERENCES `mydb`.`TIENDA` (`idTienda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`GUIA_DESPACHO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`GUIA_DESPACHO` (
  `idGuia_Despacho` INT(20) NULL,
  `Nombre_Guia_Despacho` VARCHAR(20) NULL,
  `Insumo` INT(20) NULL,
  `Detalle_Guia_Despacho` VARCHAR(40) NULL,
  `idProveedor` INT(20) NOT NULL,
  PRIMARY KEY (`idGuia_Despacho`),
  INDEX `idProveedor_idx` (`idProveedor` ASC) VISIBLE,
  CONSTRAINT `idProveedor`
    FOREIGN KEY (`idProveedor`)
    REFERENCES `mydb`.`PROVEEDOR` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TALLER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TALLER` (
  `idTaller` INT(20) NOT NULL,
  `Direccion_Taller` VARCHAR(20) NULL,
  `Email_Taller` VARCHAR(30) NULL,
  `Comuna_Taller` VARCHAR(20) NULL,
  `Rut_Mecanico` INT(10) NOT NULL,
  `idComuna_Taller` INT(20) NOT NULL,
  `idGuia_Despacho` INT(20) NOT NULL,
  PRIMARY KEY (`idTaller`),
  INDEX `Rut_Mecanico_idx` (`Rut_Mecanico` ASC) VISIBLE,
  INDEX `idComuna_idx` (`idComuna_Taller` ASC) VISIBLE,
  INDEX `idGuia_Despacho_idx` (`idGuia_Despacho` ASC) VISIBLE,
  CONSTRAINT `Rut_Mecanico`
    FOREIGN KEY (`Rut_Mecanico`)
    REFERENCES `mydb`.`MECANICO` (`Rut_Mecanico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idComuna_Taller`
    FOREIGN KEY (`idComuna_Taller`)
    REFERENCES `mydb`.`COMUNA` (`idComuna`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idGuia_Despacho`
    FOREIGN KEY (`idGuia_Despacho`)
    REFERENCES `mydb`.`GUIA_DESPACHO` (`idGuia_Despacho`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`REPARACION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`REPARACION` (
  `idReparacion` INT(20) NOT NULL,
  `Descripcion_Reparacion` VARCHAR(30) NULL,
  `Valor_Reparacion` INT(30) NULL,
  `Fecha_Reparacion` DATETIME NULL,
  `idAutomovil` INT(10) NOT NULL,
  `Rut_Mecanico` INT(10) NOT NULL,
  `idTaller` INT(20) NOT NULL,
  PRIMARY KEY (`idReparacion`),
  INDEX `idAutomovil_idx` (`idAutomovil` ASC) VISIBLE,
  INDEX `Rut_Mecanico_idx` (`Rut_Mecanico` ASC) VISIBLE,
  INDEX `idTaller_idx` (`idTaller` ASC) VISIBLE,
  CONSTRAINT `idAutomovil`
    FOREIGN KEY (`idAutomovil`)
    REFERENCES `mydb`.`AUTOMOVIL` (`idAutomovil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Rut_Mecanico`
    FOREIGN KEY (`Rut_Mecanico`)
    REFERENCES `mydb`.`MECANICO` (`Rut_Mecanico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idTaller`
    FOREIGN KEY (`idTaller`)
    REFERENCES `mydb`.`TALLER` (`idTaller`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`RECEPCION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RECEPCION` (
  `idRecepcion` INT(20) NULL,
  `Descripcion_Recepcion` VARCHAR(30) NULL,
  `Fecha_Inicio` DATETIME NULL,
  `Entrega` VARCHAR(20) NULL,
  `Rut_Mecanico` INT(10) NOT NULL,
  `idAutomovil` INT(10) NOT NULL,
  `Rut_Cliente` INT(10) NOT NULL,
  `idTaller` INT(20) NOT NULL,
  PRIMARY KEY (`idRecepcion`),
  INDEX `Rut_Mecanico_idx` (`Rut_Mecanico` ASC) VISIBLE,
  INDEX `idAutomovil_idx` (`idAutomovil` ASC) VISIBLE,
  INDEX `Rut_Cliente_idx` (`Rut_Cliente` ASC) VISIBLE,
  INDEX `idTaller_idx` (`idTaller` ASC) VISIBLE,
  CONSTRAINT `Rut_Mecanico`
    FOREIGN KEY (`Rut_Mecanico`)
    REFERENCES `mydb`.`MECANICO` (`Rut_Mecanico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idAutomovil`
    FOREIGN KEY (`idAutomovil`)
    REFERENCES `mydb`.`AUTOMOVIL` (`idAutomovil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Rut_Cliente`
    FOREIGN KEY (`Rut_Cliente`)
    REFERENCES `mydb`.`CLIENTE` (`Rut_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idTaller`
    FOREIGN KEY (`idTaller`)
    REFERENCES `mydb`.`TALLER` (`idTaller`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ESTADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ESTADO` (
  `idEstado` INT(10) NULL,
  `Nombre_Estado` VARCHAR(30) NULL,
  `Tipo_Estado` VARCHAR(30) NULL,
  `idAutomovil` INT(10) NOT NULL,
  PRIMARY KEY (`idEstado`),
  INDEX `idAutomovil_idx` (`idAutomovil` ASC) VISIBLE,
  CONSTRAINT `idAutomovil`
    FOREIGN KEY (`idAutomovil`)
    REFERENCES `mydb`.`AUTOMOVIL` (`idAutomovil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ORDEN_SERVICIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ORDEN_SERVICIO` (
  `idOrden_Servicio` INT(20) NULL,
  `Presupuesto` VARCHAR(30) NULL,
  `Fecha_Inicio_Orden_Servicio` DATETIME NULL,
  `Tipo_Valor` VARCHAR(20) NULL,
  `Pieza` VARCHAR(30) NULL,
  `Cantidad_Orden_Servicio` INT(30) NULL,
  `Rut_Mecanico` INT(10) NOT NULL,
  `idEstado` INT(10) NOT NULL,
  `idAutomovil` INT(10) NOT NULL,
  PRIMARY KEY (`idOrden_Servicio`),
  INDEX `Rut_Mecanico_idx` (`Rut_Mecanico` ASC) VISIBLE,
  INDEX `idEstado_idx` (`idEstado` ASC) VISIBLE,
  INDEX `idAutomovil_idx` (`idAutomovil` ASC) VISIBLE,
  CONSTRAINT `Rut_Mecanico`
    FOREIGN KEY (`Rut_Mecanico`)
    REFERENCES `mydb`.`MECANICO` (`Rut_Mecanico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idEstado`
    FOREIGN KEY (`idEstado`)
    REFERENCES `mydb`.`ESTADO` (`idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idAutomovil`
    FOREIGN KEY (`idAutomovil`)
    REFERENCES `mydb`.`AUTOMOVIL` (`idAutomovil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`INVENTARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`INVENTARIO` (
  `idInventario` INT(20) NULL,
  `Nombre_Inventario` VARCHAR(30) NULL,
  `Descripcion_Inventario` VARCHAR(40) NULL,
  `idTaller` INT(20) NOT NULL,
  PRIMARY KEY (`idInventario`),
  INDEX `idTaller_idx` (`idTaller` ASC) VISIBLE,
  CONSTRAINT `idTaller`
    FOREIGN KEY (`idTaller`)
    REFERENCES `mydb`.`TALLER` (`idTaller`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PRODUCTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PRODUCTO` (
  `idProducto` INT(20) NOT NULL,
  `Nombre_Producto` VARCHAR(40) NULL,
  `Precio_Producto` INT(30) NULL,
  `Stock_Producto` INT(30) NULL,
  `idInventario` INT(20) NOT NULL,
  PRIMARY KEY (`idProducto`),
  INDEX `idInventario_idx` (`idInventario` ASC) VISIBLE,
  CONSTRAINT `idInventario`
    FOREIGN KEY (`idInventario`)
    REFERENCES `mydb`.`INVENTARIO` (`idInventario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FACTURA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FACTURA` (
  `idFactura_Folio` INT(30) NOT NULL,
  `Precio_Neto` INT(40) NULL,
  `Precio_IVA` INT(30) NULL,
  `IVA` INT(30) NULL,
  `Fecha_Emision_Factura` DATETIME NULL,
  `Hora_Emision_Factura` DATETIME NULL,
  `Datos_Cliente` VARCHAR(40) NULL,
  `Metodo_Pago` VARCHAR(20) NULL,
  `Rut_Cliente` INT(10) NOT NULL,
  `idOrden_Servicio` INT(20) NOT NULL,
  `idProducto` INT(20) NOT NULL,
  `idTienda` INT(30) NOT NULL,
  `idProveedor` INT(20) NOT NULL,
  PRIMARY KEY (`idFactura_Folio`),
  INDEX `Rut_Cliente_idx` (`Rut_Cliente` ASC) VISIBLE,
  INDEX `idOrden_Servicio_idx` (`idOrden_Servicio` ASC) VISIBLE,
  INDEX `idProducto_idx` (`idProducto` ASC) VISIBLE,
  INDEX `idTienda_idx` (`idTienda` ASC) VISIBLE,
  INDEX `idProveedor_idx` (`idProveedor` ASC) VISIBLE,
  CONSTRAINT `Rut_Cliente`
    FOREIGN KEY (`Rut_Cliente`)
    REFERENCES `mydb`.`CLIENTE` (`Rut_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idOrden_Servicio`
    FOREIGN KEY (`idOrden_Servicio`)
    REFERENCES `mydb`.`ORDEN_SERVICIO` (`idOrden_Servicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idProducto`
    FOREIGN KEY (`idProducto`)
    REFERENCES `mydb`.`PRODUCTO` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idTienda`
    FOREIGN KEY (`idTienda`)
    REFERENCES `mydb`.`TIENDA` (`idTienda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idProveedor`
    FOREIGN KEY (`idProveedor`)
    REFERENCES `mydb`.`PROVEEDOR` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TELEFONO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TELEFONO` (
  `idTelefono` INT(20) NOT NULL,
  `Nombre_Telefono` VARCHAR(20) NULL,
  `Fono_Taller` INT(10) NOT NULL,
  `Fono_Cliente` INT(10) NOT NULL,
  `Fono_Tienda` INT(10) NOT NULL,
  `Fono_Proveedor` INT(10) NOT NULL,
  `Fono_Mecanico` INT(10) NOT NULL,
  `idFactura_Folio` INT(30) NOT NULL,
  PRIMARY KEY (`idTelefono`),
  INDEX `Fono_Taller_idx` (`Fono_Taller` ASC) VISIBLE,
  INDEX `Fono_Cliente_idx` (`Fono_Cliente` ASC) VISIBLE,
  INDEX `Fono_Tienda_idx` (`Fono_Tienda` ASC) VISIBLE,
  INDEX `Fono_Proveedor_idx` (`Fono_Proveedor` ASC) VISIBLE,
  INDEX `Fono_Mecanico_idx` (`Fono_Mecanico` ASC) VISIBLE,
  INDEX `idFactura_Folio_idx` (`idFactura_Folio` ASC) VISIBLE,
  CONSTRAINT `Fono_Taller`
    FOREIGN KEY (`Fono_Taller`)
    REFERENCES `mydb`.`TALLER` (`idTaller`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Fono_Cliente`
    FOREIGN KEY (`Fono_Cliente`)
    REFERENCES `mydb`.`CLIENTE` (`Rut_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Fono_Tienda`
    FOREIGN KEY (`Fono_Tienda`)
    REFERENCES `mydb`.`TIENDA` (`idTienda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Fono_Proveedor`
    FOREIGN KEY (`Fono_Proveedor`)
    REFERENCES `mydb`.`PROVEEDOR` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Fono_Mecanico`
    FOREIGN KEY (`Fono_Mecanico`)
    REFERENCES `mydb`.`MECANICO` (`Rut_Mecanico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idFactura_Folio`
    FOREIGN KEY (`idFactura_Folio`)
    REFERENCES `mydb`.`FACTURA` (`idFactura_Folio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DETALLE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DETALLE` (
  `idDetalle` INT(20) NULL,
  `idFactura_Folio` INT(30) NOT NULL,
  `idProducto` INT(20) NOT NULL,
  PRIMARY KEY (`idDetalle`),
  INDEX `idFactura_Folio_idx` (`idFactura_Folio` ASC) VISIBLE,
  INDEX `idProducto_idx` (`idProducto` ASC) VISIBLE,
  CONSTRAINT `idFactura_Folio`
    FOREIGN KEY (`idFactura_Folio`)
    REFERENCES `mydb`.`FACTURA` (`idFactura_Folio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idProducto`
    FOREIGN KEY (`idProducto`)
    REFERENCES `mydb`.`PRODUCTO` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TIPO_ORDEN_SERVICIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TIPO_ORDEN_SERVICIO` (
  `idTipo_Orden_Servicio` INT(20) NULL,
  `Nombre_Tipo_Orden_Servicio` VARCHAR(30) NULL,
  `Descripcion_Tipo_Orden_Servicio` VARCHAR(40) NULL,
  `idOrden_Servicio` INT(20) NOT NULL,
  PRIMARY KEY (`idTipo_Orden_Servicio`),
  INDEX `idOrden_Servicio_idx` (`idOrden_Servicio` ASC) VISIBLE,
  CONSTRAINT `idOrden_Servicio`
    FOREIGN KEY (`idOrden_Servicio`)
    REFERENCES `mydb`.`ORDEN_SERVICIO` (`idOrden_Servicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`REPUESTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`REPUESTO` (
  `idRepuesto` INT(20) NOT NULL,
  `Descripcion_Repuesto` VARCHAR(40) NULL,
  `Stock_Repuesto` INT(30) NULL,
  `Precio_Repuesto` INT(30) NULL,
  `Marca_Repuesto` VARCHAR(20) NULL,
  `Modelo_Repuesto` VARCHAR(20) NULL,
  `idTaller` INT(20) NOT NULL,
  `Rut_Cliente` INT(10) NOT NULL,
  PRIMARY KEY (`idRepuesto`),
  INDEX `idTaller_idx` (`idTaller` ASC) VISIBLE,
  INDEX `Rut_Cliente_idx` (`Rut_Cliente` ASC) VISIBLE,
  CONSTRAINT `idTaller`
    FOREIGN KEY (`idTaller`)
    REFERENCES `mydb`.`TALLER` (`idTaller`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Rut_Cliente`
    FOREIGN KEY (`Rut_Cliente`)
    REFERENCES `mydb`.`CLIENTE` (`Rut_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;