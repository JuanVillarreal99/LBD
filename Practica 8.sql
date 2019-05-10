
use citas

create trigger triggermedicos
on medicos
for insert
as
print 'hubo un cambio en la tabla medicos xd';

-- probando el trigger --

insert into medicos values ('5671','Daniela','32454688');

create trigger triggerpaciente
on paciente
for insert
as
print 'hubo un cambio en la tabla paciente xd';

-- probando el trigger --

insert into paciente values ('1249','Anastacio','32454688','Dios');

--  --

CREATE PROCEDURE todosmedicos as
SELECT *
FROM medicos 
go;
EXEC todosmedicos;

CREATE PROCEDURE todospacientes as
SELECT * 
FROM paciente
go;
EXEC todospacientes;

CREATE PROCEDURE todosconsultorio as
SELECT *
FROM consultorio
go;
EXEC todosconsultorio;

CREATE PROCEDURE todosespecialidad as
SELECT *
FROM especialidad
go;
EXEC todosespecialidad;

CREATE PROCEDURE todossecretaria as
SELECT * 
FROM secretaria
go;
EXEC todossecretaria;

CREATE PROCEDURE todosespecialidadmedico as
SELECT * 
FROM especialidad_medico
go;
EXEC todosespecialidadmedico;

CREATE PROCEDURE todossitio as
SELECT *
FROM sitio
go;
EXEC todossitio;

CREATE PROCEDURE todocitas as
SELECT *
FROM citas
go;
EXEC todocitas;

CREATE PROCEDURE todohistorialmedico as
SELECT *
FROM historial_medico
go;
EXEC todohistorialmedico;

CREATE PROCEDURE todosignosvitales as
SELECT * 
FROM signos_vitales
go;
EXEC todosignosvitales;


CREATE FUNCTION EnMayusculas
(
@nombre Varchar(50),
@sexo Varchar(50)
)
RETURNS Varchar(100)
AS
BEGIN
 RETURN (UPPER(@sexo) + ', ' + UPPER(@nombre))
END

DECLARE @Consulta NVARCHAR(500)
DECLARE @Tabla NVARCHAR(25)
SET @Tabla = 'paciente'
SET @Consulta = 'SELECT * FROM ' + @Tabla
EXEC(@Consulta);