CREATE TABLE ASUNTO(
  Numero_Expediente INT PRIMARY KEY,
  Nombre_Asunto VARCHAR(20),
  Estado VARCHAR(20),
  Fecha_Inicio TIMESTAMP,
  Fecha_Fin TIMESTAMP
  );

CREATE TABLE PROCURADOR(
  Rut_Procurador INT PRIMARY KEY,
  Nombre_Procurador VARCHAR(20),
  Direccion_Procurador VARCHAR(50),
  Telefono_Procurador INT,
  Correo_Procurador VARCHAR(50),
  FK_Numero_Expediente INT,
  CONSTRAINT FKPN_E FOREIGN KEY (FK_Numero_Expediente) REFERENCES ASUNTO (Numero_Expediente)
  );
  
CREATE TABLE ABOGADO(
  Rut_Abogado INT PRIMARY KEY,
  Nombre_Abogado VARCHAR(20),
  Direccion_Abogado VARCHAR(50),
  Telefono_Abogado INT,
  Correo_Abogado VARCHAR(50),
  Especialidad_Abogado VARCHAR(50),
  FK_Numero_Expediente INT,
  CONSTRAINT FKAN_E FOREIGN KEY (FK_Numero_Expediente) REFERENCES ASUNTO (Numero_Expediente)
  );
  
CREATE TABLE CLIENTE2(
  Rut_Cliente2 INT PRIMARY KEY,
  Nombre_Cliente2 VARCHAR(20),
  Direccion_Cliente2 VARCHAR(50),
  Telefono_Cliente2 INT,
  Correo_Cliente2 VARCHAR(50)
  );
  
INSERT INTO ASUNTO (Numero_Expediente, Nombre_Asunto, Estado, Fecha_Inicio, Fecha_Fin) VALUES (101, 'AreaInternet', 'En_Tramite', '21-03-21', '25-06-21');
INSERT INTO ASUNTO (Numero_Expediente, Nombre_Asunto, Estado, Fecha_Inicio, Fecha_Fin) VALUES (102, 'AreaTelecomunaciones', 'Finalizado', '14-04-21', '22-05-21');
INSERT INTO PROCURADOR (Rut_Procurador, Nombre_Procurador, Direccion_Procurador, Telefono_Procurador, Correo_Procurador) VALUES (124504212, 'Fernando', 'El Poniente 420', '56984201354', 'fernando123@hotmail.com');
INSERT INTO PROCURADOR (Rut_Procurador, Nombre_Procurador, Direccion_Procurador, Telefono_Procurador, Correo_Procurador) VALUES (155004513, 'Camilo', 'Las Camelias 124', '56985671321', 'camilo123@hotmail.com');
INSERT INTO ABOGADO (Rut_Abogado, Nombre_Abogado, Direccion_Abogado, Telefono_Abogado, Correo_Abogado, Especialidad_Abogado) VALUES (112592515, 'Juan', 'San Diego 2048', '56935815860', 'juan123@hotmail.com', 'Caso Civiles');
INSERT INTO ABOGADO (Rut_Abogado, Nombre_Abogado, Direccion_Abogado, Telefono_Abogado, Correo_Abogado, Especialidad_Abogado) VALUES (132251542, 'David', 'Camilo Flores 246', '56921232621', 'david123@hotmail.com', 'Caso Economicos');
INSERT INTO CLIENTE2 (Rut_Cliente2, Nombre_Cliente2, Direccion_Cliente2, Telefono_Cliente2, Correo_Cliente2) VALUES (152592557, 'Cesar', 'San Andres 825', '56976258463', 'cesar123@hotmail.com');
INSERT INTO CLIENTE2 (Rut_Cliente2, Nombre_Cliente2, Direccion_Cliente2, Telefono_Cliente2, Correo_Cliente2) VALUES (175151319, 'Tomas', 'San Bernando 5210', '56924156389', 'tomas123@hotmail.com');


SELECT Rut_Abogado, Nombre_Abogado, Rut_Cliente2, Nombre_Cliente2, Fecha_Inicio, Fecha_Fin, Estado
FROM ABOGADO NATURAL JOIN CLIENTE2 NATURAL JOIN ASUNTO;

SELECT * FROM CLIENTE2;
SELECT * FROM ABOGADO;