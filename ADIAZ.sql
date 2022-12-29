CREATE USER ADIAZ2 IDENTIFIED BY 12345;
ALTER USER ADIAZ2 PROFILE MANAGER;
CREATE USER DEVELOPER IDENTIFIED BY 12345;
ALTER USER DEVELOPER PROFILE DEVELOPER;
CREATE USER MANAGER IDENTIFIED BY 12345;
ALTER USER MANAGER PROFILE MANAGER;
CREATE USER DESARROLLADOR_USER IDENTIFIED BY 12345;
ALTER USER DESARROLLADOR_USER PROFILE DEVELOPER;
CREATE USER REGISTROS_USER IDENTIFIED BY 12345;
ALTER USER REGISTROS_USER PROFILE DEVELOPER;
CREATE USER ADMINISTRADOR_USER IDENTIFIED BY 12345;
ALTER USER ADMINISTRADOR_USER PROFILE MANAGER;

CREATE ROLE ADMINISTRADOR;
GRANT CONNECT TO ADMINISTRADOR;
GRANT RESOURCE TO ADMINISTRADOR;
GRANT UNLIMITED TABLESPACE TO ADMINISTRADOR;
GRANT ADMINISTRADOR TO DESARROLLADOR;

CREATE ROLE DESARROLLADOR;
GRANT CONNECT TO DESARROLLADOR;
GRANT SELECT ANY TABLE TO DESARROLLADOR;
GRANT INSERT ANY TABLE TO DESARROLLADOR;
GRANT UPDATE ANY TABLE TO DESARROLLADOR;
GRANT DELETE ANY TABLE TO DESARROLLADOR;
GRANT CREATE TABLE TO DESARROLLADOR;
GRANT CREATE VIEW TO DESARROLLADOR;
GRANT CREATE ANY VIEW TO DESARROLLADOR;
GRANT DESARROLLADOR TO REGISTROS;

CREATE ROLE REGISTROS;
GRANT CONNECT TO REGISTROS;
GRANT SELECT ON ZOO TO REGISTROS;
GRANT SELECT ON ANIMAL TO REGISTROS;
GRANT INSERT ON ZOO TO REGISTROS;
GRANT INSERT ON ANIMAL TO REGISTROS;
GRANT UPDATE ON ZOO TO REGISTROS;
GRANT UPDATE ON ANIMAL TO REGISTROS;
GRANT DELETE ON ZOO TO REGISTROS;
GRANT DELETE ON ANIMAL TO REGISTROS;

CREATE PROFILE MANAGER LIMIT
CPU_PER_SESSION 15000
CONNECT_TIME 45
IDLE_TIME 5
PRIVATE_SGA 25M
FAILED_LOGIN_ATTEMPTS 3
PASSWORD_LOCK_TIME 7
PASSWORD_LIFE_TIME 90
PASSWORD_GRACE_TIME 10
PASSWORD_REUSE_MAX 5
SESSIONS_PER_USER 5
LOGICAL_READS_PER_SESSION UNLIMITED
;

CREATE PROFILE DEVELOPER LIMIT
CPU_PER_SESSION 15000
CONNECT_TIME 25
IDLE_TIME 5
PRIVATE_SGA 20M
FAILED_LOGIN_ATTEMPTS 5
PASSWORD_LOCK_TIME 1
PASSWORD_LIFE_TIME 30
PASSWORD_GRACE_TIME 5
PASSWORD_REUSE_TIME 7
PASSWORD_REUSE_MAX 3
SESSIONS_PER_USER 3
LOGICAL_READS_PER_SESSION UNLIMITED
;

GRANT ROLE DESARROLLADOR TO USER DEVELOPER;
ALTER USER DEVELOPER DEFAULT ROLE DESARROLLADOR;
GRANT USER DEVELOPER TO ROLE DESARROLLADOR;

ALTER USER DESARROLLADOR_USER PROFILE DEVELOPER DEFAULT TABLESPACE ZOOLOGICOS QUOTA UNLIMITED ON ZOOLOGICOS;
ALTER USER REGISTROS_USER PROFILE DEVELOPER DEFAULT TABLESPACE ZOOLOGICOS QUOTA UNLIMITED ON ZOOLOGICOS;
ALTER USER ADMINISTRADOR_USER PROFILE MANAGER DEFAULT TABLESPACE ZOOLOGICOS QUOTA UNLIMITED ON ZOOLOGICOS;