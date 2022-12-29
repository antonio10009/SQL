/*Revisar parametro de auditoria*/
SHOW PARAMETER AUDIT_TRAIL;

/*Activar auditoria modificando archivo de sistema*/
ALTER SYSTEM SET AUDIT_TRAIL='none' scope=spfile;
/*Recordar reiniciar la base de datos*/

/*Escribir los comandos en SQL COMMAND LINE*/
SHUTDOWN IMMEDIATE; /*Bajar la base de datos*/
STARTUP MOUNT; /*Iniciar la base de datos*/
ALTER DATABASE OPEN; /*Abrir la base de datos*/

/*Recopilar datos*/
SELECT * FROM DBA_OBJ_AUDIT_OPTS; /*Describir los criterios de auditoria en un objeto cualquiera*/
SELECT * FROM USER_OBJ_AUDIT_OPTS; /*Describe los criterios de auditoria de un objeto del usuario actual*/

SELECT * FROM DBA_PRIV_AUDIT_OPTS; /*Describe criterios sobre los privilegios de sistema activos*/
SELECT * FROM DBA_AUDIT_SESSION /*Muestra los registros de los intentos de inicios de sesion*/

/*Activaciones de auditoria*/

/*Auditoria sobre un objeto (Tabla)*/
CREATE USER USUARIO32 IDENTIFIED BY 1234;
GRANT UNLIMITED TABLESPACE, CONNECT, RESOURCE TO USUARIO32;

AUDIT SESSION WHENEVER NOT SUCCESSFUL; /*Auditar conexiones fallidas*/
NOAUDIT SESSION WHENEVER NOT SUCCESSFUL;

AUDIT SESSION WHENEVER SUCCESSFUL; /*Audita conexiones exitosas*/

AUDIT SESSION; /*Audita todas las sesiones*/
NOAUDIT SESSION;

/*Auditorias sobre un objeto*/
AUDIT SELECT, INSERT, UPDATE, DELETE ON USUARIO32.EJEMPLO; /*Crea auditoria especifica*/

/*Revisar auditoria*/
SELECT USERNAME, ACTION_NAME, SQL_TEXT, OBJ_NAME, TIMESTAMP FROM DBA_AUDIT_TRAIL;

/*Auditoria sobre objeto (Usuario)*/
AUDIT SELECT TABLE BY USUARIO33;
AUDIT CREATE TABLE BY USUARIO33;
AUDIT UPDATE TABLE BY USUARIO33;
AUDIT DROP TABLE BY USUARIO33;

