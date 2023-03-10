CREATE TABLE PAIS(
ID_PAIS INT PRIMARY KEY,
NOMBRE_PAIS VARCHAR(20)
);

CREATE TABLE CIUDAD(
ID_CIUDAD INT PRIMARY KEY,
NOMBRE_CIUDAD VARCHAR(30),
FK_PAIS INT,
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
CONSTRAINT FK
