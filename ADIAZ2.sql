CREATE TABLE REGION1(
  IdRegion1 INT PRIMARY KEY,
  Nombre_Region VARCHAR(20)
  );
  
CREATE TABLE CIUDAD1(
  IdCiudad1 INT PRIMARY KEY,
  Nombre_Ciudad VARCHAR(20),
  FK_IdRegion1 INT,
  CONSTRAINT FKCR6 FOREIGN KEY (FK_IdRegion1) REFERENCES REGION1 (IdRegion1)
  );
  
CREATE TABLE COMUNA1(
  IdComuna1 INT PRIMARY KEY,
  Nombre_Comuna VARCHAR(20),
  FK_IdCiudad1 INT,
  CONSTRAINT FKCC7 FOREIGN KEY (FK_IdCiudad1) REFERENCES CIUDAD1 (IdCiudad1)
  );
  
CREATE TABLE ZOO(
  IdZoo INT PRIMARY KEY,
  Nombre_Zoo VARCHAR(30),
  Tamano_Zoo VARCHAR(30),
  FK_IdComuna1 INT,
  CONSTRAINT FKZC FOREIGN KEY (FK_IdComuna1) REFERENCES COMUNA1 (IdComuna1)
  );
  
CREATE TABLE FAMILIA(
  IdFamilia INT PRIMARY KEY,
  Nombre_Familia VARCHAR(20)
  );  

CREATE TABLE ESPECIE(
  IdEspecie INT PRIMARY KEY,
  Nombre_Especie VARCHAR(20),
  FK_idFamilia INT,
  CONSTRAINT FKEF FOREIGN KEY (FK_IdFamilia) REFERENCES FAMILIA (IdFamilia)
  );

CREATE TABLE ANIMAL(
  IdAnimal INT PRIMARY KEY,
  Nombre_Animal VARCHAR(20),
  Nombre_Vulgar VARCHAR(20),
  Nombre_Cientifico VARCHAR(20),
  Fecha_Nacimiento TIMESTAMP,
  FK_IdZoo INT,
  FK_IdEspecie INT,
  CONSTRAINT FKAZ FOREIGN KEY (FK_IdZoo) REFERENCES ZOO (IdZoo),
  CONSTRAINT FKAE FOREIGN KEY (FK_IdEspecie) REFERENCES ESPECIE (IdEspecie)
  ); 
  
INSERT INTO REGION1 (IdRegion1, Nombre_Region) VALUES (1, 'SANTIAGO')
INSERT INTO CIUDAD1 (IdCiudad1, Nombre_Ciudad) VALUES (2, 'SANTIAGO CENTRO')
INSERT INTO COMUNA1 (IdComuna1, Nombre_Comuna) VALUES (3, 'RENCA')
INSERT INTO ZOO (IdZoo, Nombre_Zoo, Tamano_Zoo) VALUES (4, 'PARQUE METROPOLITANO', '4,8')
INSERT INTO ZOO (IdZoo, Nombre_Zoo, Tamano_Zoo) VALUES (42, 'QUILICURA', '5')
INSERT INTO FAMILIA (IdFamilia, Nombre_Familia) VALUES (5, 'FELIDOS')
INSERT INTO FAMILIA (IdFamilia, Nombre_Familia) VALUES (6, 'CANIDOS')
INSERT INTO ESPECIE (IdEspecie, Nombre_Especie) VALUES (7, 'MAMIFEROS')
INSERT INTO ANIMAL (IdAnimal, Nombre_Animal, Nombre_Vulgar, Nombre_Cientifico, Fecha_Nacimiento) VALUES (8, 'JOE', 'LEON', 'PANTHERA LEO', '15-05-2006')
INSERT INTO ANIMAL (IdAnimal, Nombre_Animal, Nombre_Vulgar, Nombre_Cientifico, Fecha_Nacimiento) VALUES (9, 'OTTO', 'TIGRE', 'PANTHERA TIGRIS', '28-06-2009')
INSERT INTO ANIMAL (IdAnimal, Nombre_Animal, Nombre_Vulgar, Nombre_Cientifico, Fecha_Nacimiento) VALUES (10, 'ROY', 'LOBO GRIS', 'CANIS LUPUS', '11-02-2012')}
