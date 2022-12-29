GRANT CREATE SESSION TO USUARIO32;
GRANT CONNECT TO USUARIO32;

REVOKE CREATE SESSION FROM USUARIO32;
REVOKE CONNECT FROM USUARIO32;

SELECT * FROM DBA_TABLESPACES;
SELECT * FROM DBA_PROFILES;

ALTER USER USUARIO32 PROFILE DEV DEFAULT TABLESPACE EJEMPLO01
QUOTA UNLIMITED ON EJEMPLO01;

/*PRIVILEGIOS DE CREACI�N DE DATOS*/
GRANT CREATE TABLE TO USUARIO32;
REVOKE CREATE TABLE FROM USUARIO32;

CREATE ROLE DEVELOPER;
GRANT CREATE TABLE, CONNECT, CREATE PROCEDURE, CREATE SEQUENCE TO DEVELOPER;

GRANT DEVELOPER TO USUARIO32B;
REVOKE CONNECT FROM DEVELOPER;

GRANT UNLIMITED TABLESPACE TO USUARIO32;

GRANT CONNECT TO DEVELOPER;

/*PERMISOS PARA CRUD*/
GRANT INSERT ANY TABLE, UPDATE ANY TABLE, DELETE ANY TABLE TO USUARIO32;
GRANT SELECT ANY TABLE TO USUARIO32;

GRANT RESOURCE TO USUAURIO32;

SELECT * FROM USER_ROLE_PRIVS;

SELECT USERNAME, GRANTED_ROLE FROM USER_ROLE_PRIVS;











