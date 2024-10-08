CREATE TABLE MATERIAS (
	ID_MATERIA NUMBER(6),
	NOMBRE_MATERIA VARCHAR2(45) NOT NULL,
	COSTO_MATERIA NUMBER(7) NOT NULL,
	CONSTRAINT MATERIAS_ID_MATERIA_PK PRIMARY KEY (ID_MATERIA)
)

CREATE TABLE CARRERAS (
	ID_CARRERA NUMBER(5),
	NOMBRE_CARRERA VARCHAR2(30) NOT NULL,
	TOTAL_HORAS NUMBER(2) NOT NULL,
	TITULO_HABILITANTE VARCHAR2(30) NOT NULL,
	FECHA_HABILITACION DATE NOT NULL,
	FECHA_CANCELACION DATE NOT NULL,
	CONSTRAINT CARRERAS_ID_CARRERA_PK PRIMARY KEY (ID_CARRERA)
)

CREATE TABLE ESTUDIANTES (
	CEDULA NUMBER(8),
	NOMBRE VARCHAR2(45) NOT NULL,
	DIRECCION VARCHAR2(45) NOT NULL,
	APELLIDO VARCHAR2(45) NOT NULL,
	TELEFONO VARCHAR2(15) NOT NULL,
	TELEFONO_TRABAJO VARCHAR2(15) NULL,
	DIRECCION_TRABAJO VARCHAR2(45) NULL,
	E_MAIL VARCHAR2(30) NULL,
	FECHA_PRIMERA_INSCRIPCION DATE NULL,
	FECHA_NACIMIENTO DATE NOT NULL,
	CONSTRAINT ESTUDIANTES_CEDULA_PK PRIMARY KEY (CEDULA)
)
CREATE TABLE PROGRAMA_CURRICULAR(
	ID_MATERIA NUMBER(5) NOT NULL,
	ID_CARRERA NUMBER(5) NOT NULL,
	ELECTIVA VARCHAR2(1) NOT NULL,
	CARGA_HORARIA NUMBER(1) NOT NULL,
	CANT_CREDITOS NUMBER(2) NOT NULL,
	CONSTRAINT PC_ID_MATERIA_ID_CARRERA_PK PRIMARY KEY (ID_MATERIA,ID_CARRERA),
	CONSTRAINT PC_ID_MATERIA_FK FOREIGN KEY (ID_MATERIA) REFERENCES MATERIAS(ID_MATERIA),
    	CONSTRAINT PC_ID_CARRERA_FK FOREIGN KEY (ID_CARRERA) REFERENCES CARRERAS(ID_CARRERA)
)
CREATE TABLE PROFESORES (
    PROFESOR NUMBER(4) GENERATED BY DEFAULT AS IDENTITY
        START WITH 1
        MINVALUE 1 MAXVALUE 999999
        INCREMENT BY 1
        NOCACHE NOCYCLE,
    NOMBRE_PROFESOR VARCHAR2(60) NOT NULL,
    DIRECCION_PROFESOR VARCHAR2(45) NOT NULL,
    TELEFONO_PROFESOR VARCHAR2(15) NOT NULL,
    E_MAIL_PROFESOR VARCHAR2(30) NULL,
    CONSTRAINT PROFESORES_PROFESOR_PK PRIMARY KEY (PROFESOR)
)
CREATE TABLE ACTA (
	NUMERO_ACTA NUMBER(8),
	FECHA_ACTA DATE NOT NULL,
	TIPO_EXAMEN VARCHAR2(5) NOT NULL,
	CONSTRAINT ACTA_NUMERO_ACTA_PK PRIMARY KEY (NUMERO_ACTA)
)
CREATE TABLE MATERIA_SECCION (
	ID_CARRERA NUMBER(5),
	ID_MATERIA NUMBER(5),
	SECCION VARCHAR2(1),
	PROFESOR NUMBER(4) NULL,
	CONSTRAINT MATERIA_SECCION_PK PRIMARY KEY (ID_CARRERA, ID_MATERIA, SECCION),
	CONSTRAINT MATERIA_SECCION_ID_CARRERA_FK FOREIGN KEY (ID_CARRERA) REFERENCES CARRERAS (ID_CARRERA),
	CONSTRAINT MATERIA_SECCION_ID_MATERIA_FK FOREIGN KEY (ID_MATERIA) REFERENCES MATERIAS (ID_MATERIA)
)

CREATE TABLE MATRICULA(
	ID_MATRICULA NUMBER(8) GENERATED ALWAYS AS IDENTITY
	START WITH 1
	MINVALUE 1 MAXVALUE 9999999
	INCREMENT BY 1
	NOCACHE NOCYCLE,
	CEDULA NUMBER (8) NOT NULL,
	FECHA_INSCRIPCION DATE NOT NULL,
	FECHA_FIN_MATRICULA DATE NULL,
	MOTIVO_CANCELACION VARCHAR2(1) NULL,
	ID_CARRERA NUMBER (5) NULL,
	ID_MATERIA NUMBER (5) NULL,
	SECCION VARCHAR2 (1) NULL,
	CONSTRAINT MATRICULA_ID_CARRERA_FK FOREIGN KEY (ID_CARRERA, ID_MATERIA, SECCION) REFERENCES MATERIA_SECCION(ID_CARRERA, ID_MATERIA, SECCION),
	CONSTRAINT MATRICULA_ID_MATRICULA_PK PRIMARY KEY (ID_MATRICULA),
	CONSTRAINT MATRICULA_CEDULA_FK FOREIGN KEY (CEDULA) REFERENCES ESTUDIANTES (CEDULA)
)
CREATE TABLE CALIFICACIONES (
	ID_MATRICULA NUMBER(8),
	NUMERO_ACTA NUMBER(8),
	PUNTAJE NUMBER(3) NOT NULL,
	CONSTRAINT CALIFICACIONES_PK PRIMARY KEY (ID_MATRICULA,NUMERO_ACTA),
	CONSTRAINT CALIFICACIONES_ID_MATRICULA_FK FOREIGN KEY (ID_MATRICULA) REFERENCES MATRICULA(ID_MATRICULA),
	CONSTRAINT CALIFICACIONES_NUMERO_ACTA_FK FOREIGN KEY (NUMERO_ACTA) REFERENCES ACTA (NUMERO_ACTA)
)
/
