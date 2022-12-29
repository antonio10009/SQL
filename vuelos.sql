DROP TABLE EJEMPLO01;

CREATE TABLE PAIS(
ID_PAIS INT PRIMARY KEY,
NOMBRE_PAIS VARCHAR(20)NOT NULL
);


CREATE TABLE CIUDAD(
ID_CIUDAD INT PRIMARY KEY,
NOMBRE_CIUDAD VARCHAR(30) NOT NULL,
FK_PAIS INT NOT NULL,
CONSTRAINT FKCP FOREIGN KEY (FK_PAIS) REFERENCES PAIS(ID_PAIS)
);


CREATE TABLE AEROPUERTO(
ID_AEROPUERTO INT PRIMARY KEY,
NOMBRE_AEROPUERTO VARCHAR(30) NOT NULL,
FK_CIUDAD INT NOT NULL,
CONSTRAINT FKAC FOREIGN KEY (FK_CIUDAD) REFERENCES CIUDAD(ID_CIUDAD)
);


CREATE TABLE BASE(
ID_BASE INT PRIMARY KEY,
NOMBRE_BASE VARCHAR(20) NOT NULL,
FK_AEROPUERTO INT NOT NULL,
CONSTRAINT FKBA FOREIGN KEY (FK_AEROPUERTO) REFERENCES AEROPUERTO(ID_AEROPUERTO)
);

CREATE TABLE AVION(
ID_AVION VARCHAR(10) PRIMARY KEY,
FK_BASE INT NOT NULL,
CONSTRAINT FKAV FOREIGN KEY (FK_BASE) REFERENCES BASE(ID_BASE)
);

CREATE TABLE PERSONA(
RUT_PERSONA VARCHAR(12) PRIMARY KEY,
NOMBRE VARCHAR(20) NOT NULL,
APELLIDO1 VARCHAR(20) NOT NULL,
APELLIDO2 VARCHAR(20),
FK_BASE INT NOT NULL,
CONSTRAINT FKPB FOREIGN KEY (FK_BASE) REFERENCES BASE(ID_BASE)
);

CREATE TABLE PILOTO(
ID_PILOTO INT PRIMARY KEY,
FK_RUT VARCHAR(12) NOT NULL,
HORAS_VUELO INT,
CONSTRAINT FKPP FOREIGN KEY (FK_RUT) REFERENCES PERSONA(RUT_PERSONA)
);

CREATE TABLE TRIPULANTE(
ID_TRIPULANTE INT PRIMARY KEY,
FK_RUT VARCHAR(12) NOT NULL,
CONSTRAINT FKPT FOREIGN KEY (FK_RUT) REFERENCES PERSONA(RUT_PERSONA)
);

CREATE TABLE VUELO(
ID_VUELO INT PRIMARY KEY,
FK_ORIGEN INT NOT NULL,
FK_DESTINO INT NOT NULL,
FK_PILOTO INT,
FK_AVION VARCHAR(10),
FECHA TIMESTAMP NOT NULL,
CONSTRAINT FKVO FOREIGN KEY (FK_ORIGEN) REFERENCES AEROPUERTO(ID_AEROPUERTO),
CONSTRAINT FKVD FOREIGN KEY (FK_DESTINO) REFERENCES AEROPUERTO(ID_AEROPUERTO),
CONSTRAINT FKVP FOREIGN KEY (FK_PILOTO) REFERENCES PILOTO(ID_PILOTO),
CONSTRAINT FKVA FOREIGN KEY (FK_AVION) REFERENCES AVION(ID_AVION)
);

CREATE TABLE TRIPULACION(
ID_TRIPULACION INT PRIMARY KEY,
FK_TRIPULANTE INT NOT NULL,
FK_VUELO INT NOT NULL,
CONSTRAINT FKTT FOREIGN KEY (FK_TRIPULANTE) REFERENCES TRIPULANTE(ID_TRIPULANTE),
CONSTRAINT FKTV FOREIGN KEY (FK_VUELO) REFERENCES VUELO(ID_VUELO)
);











