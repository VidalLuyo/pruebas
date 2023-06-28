-- Borra la base de datos si es que existe
USE master;
DROP DATABASE IF EXISTS futora;

CREATE DATABASE futora;

USE futora;

-- CREACION DE TABLA APODERADO:

CREATE TABLE APODERADO(
    id int IDENTITY(1,1) NOT NULL,
    document_type char(3) NOT NULL CHECK (document_type IN ('DNI', 'CNE')),
    document_number varchar(15) NOT NULL UNIQUE CHECK ((LEN(document_number) = 8) OR (LEN(document_number) = 15)),
    status char(1) NOT NULL DEFAULT 'A' CHECK (status in ('A', 'I')),
	gender char(1)  CHECK (gender in ('M', 'F')),
    names varchar(50)  NOT NULL,
    last_names varchar(50)  NOT NULL,
    email varchar(60)  NOT NULL UNIQUE CHECK (email LIKE '%@gmail.com' OR email LIKE '%@hotmail.com' OR email LIKE '%@outlook.com' OR email LIKE '%@yahoo.com'),
    phone char(9) NOT NULL UNIQUE CHECK (phone like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	CONSTRAINT person_pk PRIMARY KEY  (id)
);


INSERT INTO APODERADO
(document_type, document_number, status, gender, names, last_names, email, phone)
VALUES
('DNI', '16789456', 'A', 'M', 'Jesus', 'Guando Matos', 'jcanales@gmail.com', '976754981'),
('DNI', '71997493', 'A', 'M', 'Francis', 'Castillo Sanabria', 'fcastillosanabria@gmail.com', '154265554'),
('DNI', '15359394', 'A', 'F', 'Aide Shumay', 'Sanabria Cuevas', 'shumysanabria@gmail.com', '979767669'),
('DNI', '12555869', 'A', 'F', 'Guillermo Alejandro', 'Aranda Taco', 'alejandroTACO@gmail.com', '154442254'),
('CNE', '975642318794561', 'I', 'F', 'Gabriel', 'Sanchez Cjanche', 'gabrielsanches@hotmail.com', '976754895'),
('DNI', '95461238', 'A', 'M', 'Boris', 'Guando Guando', 'borisAngel@outlook.com', '988854981'),
('CNE', '874512367894561', 'I','F', 'Sofia', 'Gutierrez', 'sofiagutierrez@yahoo.com', '966547812'),
('CNE', '951236458794564', 'A','F', 'Maria', 'Gonzales Huayta', 'mariaGONZA@yahoo.com', '966547628'),
('DNI', '15489632', 'A', 'M', 'Luis', 'Morales', 'luismorales@gmail.com', '977432189'),
('DNI', '15236587', 'A', 'M', 'Peter', 'Parker', 'hombrearaña@gmail.com', '962225487');
GO

	SELECT*FROM APODERADO;
	SELECT * FROM APODERADO order by id desc