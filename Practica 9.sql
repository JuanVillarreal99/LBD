USE [master]
GO
/****** Object:  Database [citas]    Script Date: 10/5/2019 13:52:27 ******/
CREATE DATABASE [citas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'citas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\citas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'citas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\citas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [citas] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [citas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [citas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [citas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [citas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [citas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [citas] SET ARITHABORT OFF 
GO
ALTER DATABASE [citas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [citas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [citas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [citas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [citas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [citas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [citas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [citas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [citas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [citas] SET  ENABLE_BROKER 
GO
ALTER DATABASE [citas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [citas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [citas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [citas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [citas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [citas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [citas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [citas] SET RECOVERY FULL 
GO
ALTER DATABASE [citas] SET  MULTI_USER 
GO
ALTER DATABASE [citas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [citas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [citas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [citas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [citas] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'citas', N'ON'
GO
ALTER DATABASE [citas] SET QUERY_STORE = OFF
GO
USE [citas]
GO
/****** Object:  UserDefinedFunction [dbo].[EnMayusculas]    Script Date: 10/5/2019 13:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[EnMayusculas]
(
@nombre Varchar(50),
@sexo Varchar(50)
)
RETURNS Varchar(100)
AS
BEGIN
 RETURN (UPPER(@sexo) + ', ' + UPPER(@nombre))
END
GO
/****** Object:  Table [dbo].[citas]    Script Date: 10/5/2019 13:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[citas](
	[id] [int] NOT NULL,
	[id_medico] [int] NULL,
	[id_paciente] [int] NULL,
	[id_consultorio] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[consultorio]    Script Date: 10/5/2019 13:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[consultorio](
	[id] [int] NOT NULL,
	[nombre] [nvarchar](40) NULL,
	[id_sitio] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[especialidad]    Script Date: 10/5/2019 13:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[especialidad](
	[id] [int] NOT NULL,
	[nombre] [varchar](40) NULL,
	[universidad] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[especialidad_medico]    Script Date: 10/5/2019 13:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[especialidad_medico](
	[id] [int] NOT NULL,
	[id_medico] [int] NULL,
	[id_especialidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[historial_medico]    Script Date: 10/5/2019 13:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historial_medico](
	[id] [int] NOT NULL,
	[fecha] [nvarchar](1) NOT NULL,
	[id_paciente] [int] NULL,
	[padecimiento] [nvarchar](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[medicos]    Script Date: 10/5/2019 13:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medicos](
	[id] [int] NOT NULL,
	[nombre] [nvarchar](40) NULL,
	[cedulaprofesional] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paciente]    Script Date: 10/5/2019 13:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paciente](
	[id] [int] NOT NULL,
	[nombre] [nvarchar](40) NULL,
	[telefono] [nvarchar](50) NOT NULL,
	[sexo] [nvarchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[secretaria]    Script Date: 10/5/2019 13:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[secretaria](
	[id] [int] NOT NULL,
	[nombre] [nvarchar](40) NOT NULL,
	[edad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[signos_vitales]    Script Date: 10/5/2019 13:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[signos_vitales](
	[id] [int] NOT NULL,
	[peso] [int] NOT NULL,
	[id_paciente] [int] NULL,
	[estatura] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sitio]    Script Date: 10/5/2019 13:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sitio](
	[id] [int] NOT NULL,
	[direccion] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[citas] ([id], [id_medico], [id_paciente], [id_consultorio]) VALUES (1, 1, 10, 1)
GO
INSERT [dbo].[citas] ([id], [id_medico], [id_paciente], [id_consultorio]) VALUES (2, 23, 22, 2)
GO
INSERT [dbo].[citas] ([id], [id_medico], [id_paciente], [id_consultorio]) VALUES (3, 864, 33, 3)
GO
INSERT [dbo].[citas] ([id], [id_medico], [id_paciente], [id_consultorio]) VALUES (4, 434, 10, 4)
GO
INSERT [dbo].[citas] ([id], [id_medico], [id_paciente], [id_consultorio]) VALUES (5, 985676, 43, 5)
GO
INSERT [dbo].[citas] ([id], [id_medico], [id_paciente], [id_consultorio]) VALUES (6, 986, 83, 6)
GO
INSERT [dbo].[citas] ([id], [id_medico], [id_paciente], [id_consultorio]) VALUES (7, 986, 22, 7)
GO
INSERT [dbo].[citas] ([id], [id_medico], [id_paciente], [id_consultorio]) VALUES (8, 454, 33, 8)
GO
INSERT [dbo].[citas] ([id], [id_medico], [id_paciente], [id_consultorio]) VALUES (9, 434, 34, 9)
GO
INSERT [dbo].[citas] ([id], [id_medico], [id_paciente], [id_consultorio]) VALUES (10, 985676, 3334, 10)
GO
INSERT [dbo].[consultorio] ([id], [nombre], [id_sitio]) VALUES (1, N'Alameda', 1)
GO
INSERT [dbo].[consultorio] ([id], [nombre], [id_sitio]) VALUES (2, N'Consultorio Villarreal', 33)
GO
INSERT [dbo].[consultorio] ([id], [nombre], [id_sitio]) VALUES (3, N'Consultorio vida', 47)
GO
INSERT [dbo].[consultorio] ([id], [nombre], [id_sitio]) VALUES (4, N'Consultorio 10', 56)
GO
INSERT [dbo].[consultorio] ([id], [nombre], [id_sitio]) VALUES (5, N'Consultorio 04', 143)
GO
INSERT [dbo].[consultorio] ([id], [nombre], [id_sitio]) VALUES (6, N'salud saludable', 344)
GO
INSERT [dbo].[consultorio] ([id], [nombre], [id_sitio]) VALUES (7, N'Consultorio 04', 444)
GO
INSERT [dbo].[consultorio] ([id], [nombre], [id_sitio]) VALUES (8, N'Consultorio 999', 566)
GO
INSERT [dbo].[consultorio] ([id], [nombre], [id_sitio]) VALUES (9, N'Consultorio 04', 23)
GO
INSERT [dbo].[consultorio] ([id], [nombre], [id_sitio]) VALUES (10, N'SALUD', 437)
GO
INSERT [dbo].[especialidad] ([id], [nombre], [universidad]) VALUES (1, N'Javier', N'UANL')
GO
INSERT [dbo].[especialidad] ([id], [nombre], [universidad]) VALUES (2, N'Javier', N'TEC DE MONTERREY')
GO
INSERT [dbo].[especialidad] ([id], [nombre], [universidad]) VALUES (6, N'Alomar', N'UAC')
GO
INSERT [dbo].[especialidad] ([id], [nombre], [universidad]) VALUES (8, N'Alonso', N'UANL')
GO
INSERT [dbo].[especialidad] ([id], [nombre], [universidad]) VALUES (9, N'Martin', N'UANL')
GO
INSERT [dbo].[especialidad] ([id], [nombre], [universidad]) VALUES (12, N'Juan Alonso', N'UNAM')
GO
INSERT [dbo].[especialidad] ([id], [nombre], [universidad]) VALUES (65, N'Jose', N'UAC')
GO
INSERT [dbo].[especialidad] ([id], [nombre], [universidad]) VALUES (197, N'Derek', N'harvard')
GO
INSERT [dbo].[especialidad] ([id], [nombre], [universidad]) VALUES (566, N'Alonso Medina', N'UANL')
GO
INSERT [dbo].[especialidad] ([id], [nombre], [universidad]) VALUES (4312, N'Stefan', N'harvard')
GO
INSERT [dbo].[medicos] ([id], [nombre], [cedulaprofesional]) VALUES (1, N'esteban', N'2334566')
GO
INSERT [dbo].[medicos] ([id], [nombre], [cedulaprofesional]) VALUES (23, N'Carlos', N'23345226')
GO
INSERT [dbo].[medicos] ([id], [nombre], [cedulaprofesional]) VALUES (434, N'Juan Villarreal', N'3984455')
GO
INSERT [dbo].[medicos] ([id], [nombre], [cedulaprofesional]) VALUES (454, N'Sofia Alvarez', N'4557906')
GO
INSERT [dbo].[medicos] ([id], [nombre], [cedulaprofesional]) VALUES (777, N'Samuel del luque', N'12345678')
GO
INSERT [dbo].[medicos] ([id], [nombre], [cedulaprofesional]) VALUES (864, N'Alan Monrreal', N'847097622')
GO
INSERT [dbo].[medicos] ([id], [nombre], [cedulaprofesional]) VALUES (986, N'Estefania Alonso', N'8497622')
GO
INSERT [dbo].[medicos] ([id], [nombre], [cedulaprofesional]) VALUES (5671, N'Daniela', N'32454688')
GO
INSERT [dbo].[medicos] ([id], [nombre], [cedulaprofesional]) VALUES (6676, N'Ana Luisa', N'876540')
GO
INSERT [dbo].[medicos] ([id], [nombre], [cedulaprofesional]) VALUES (7336, N'Alfonso Medina', N'7367489')
GO
INSERT [dbo].[medicos] ([id], [nombre], [cedulaprofesional]) VALUES (9838, N'Jose Alonso', N'7364795')
GO
INSERT [dbo].[medicos] ([id], [nombre], [cedulaprofesional]) VALUES (985676, N'Paloma Dominguez', N'8478997622')
GO
INSERT [dbo].[paciente] ([id], [nombre], [telefono], [sexo]) VALUES (2, N'Alonso', N'8132102755', N'masculino')
GO
INSERT [dbo].[paciente] ([id], [nombre], [telefono], [sexo]) VALUES (7, N'Alex', N'8132202451', N'masculino')
GO
INSERT [dbo].[paciente] ([id], [nombre], [telefono], [sexo]) VALUES (10, N'Juan Villarreal', N'8122102744', N'masculino')
GO
INSERT [dbo].[paciente] ([id], [nombre], [telefono], [sexo]) VALUES (22, N'Saul', N'8132333755', N'masculino')
GO
INSERT [dbo].[paciente] ([id], [nombre], [telefono], [sexo]) VALUES (33, N'Javier', N'8122102755', N'masculino')
GO
INSERT [dbo].[paciente] ([id], [nombre], [telefono], [sexo]) VALUES (34, N'Sergio', N'8122202755', N'masculino')
GO
INSERT [dbo].[paciente] ([id], [nombre], [telefono], [sexo]) VALUES (43, N'Alan', N'8145902755', N'masculino')
GO
INSERT [dbo].[paciente] ([id], [nombre], [telefono], [sexo]) VALUES (83, N'Alonso', N'445456567', N'indefinido')
GO
INSERT [dbo].[paciente] ([id], [nombre], [telefono], [sexo]) VALUES (84, N'Axel', N'813218837', N'masculino')
GO
INSERT [dbo].[paciente] ([id], [nombre], [telefono], [sexo]) VALUES (93, N'Martin', N'8122108753', N'masculino')
GO
INSERT [dbo].[paciente] ([id], [nombre], [telefono], [sexo]) VALUES (780, N'Javier', N'8132102755', N'masculino')
GO
INSERT [dbo].[paciente] ([id], [nombre], [telefono], [sexo]) VALUES (1246, N'Anastacio', N'32454688', N'Dios')
GO
INSERT [dbo].[paciente] ([id], [nombre], [telefono], [sexo]) VALUES (1249, N'Anastacio', N'32454688', N'Dios')
GO
INSERT [dbo].[paciente] ([id], [nombre], [telefono], [sexo]) VALUES (3334, N'Ramiro', N'8132108963', N'masculino')
GO
INSERT [dbo].[paciente] ([id], [nombre], [telefono], [sexo]) VALUES (96347, N'All', N'8132102755', N'masculino')
GO
INSERT [dbo].[secretaria] ([id], [nombre], [edad]) VALUES (1, N'Daniela', 42)
GO
INSERT [dbo].[secretaria] ([id], [nombre], [edad]) VALUES (2, N'Cecilia', 20)
GO
INSERT [dbo].[secretaria] ([id], [nombre], [edad]) VALUES (6, N'Mariana', 42)
GO
INSERT [dbo].[secretaria] ([id], [nombre], [edad]) VALUES (9, N'Arleth', 36)
GO
INSERT [dbo].[secretaria] ([id], [nombre], [edad]) VALUES (11, N'Estefania', 25)
GO
INSERT [dbo].[secretaria] ([id], [nombre], [edad]) VALUES (23, N'Javiera', 22)
GO
INSERT [dbo].[secretaria] ([id], [nombre], [edad]) VALUES (87, N'Ana', 28)
GO
INSERT [dbo].[secretaria] ([id], [nombre], [edad]) VALUES (176, N'Esmeralda', 32)
GO
INSERT [dbo].[secretaria] ([id], [nombre], [edad]) VALUES (267, N'Monica', 49)
GO
INSERT [dbo].[secretaria] ([id], [nombre], [edad]) VALUES (782, N'Daniela', 42)
GO
INSERT [dbo].[secretaria] ([id], [nombre], [edad]) VALUES (863, N'Carla', 26)
GO
INSERT [dbo].[secretaria] ([id], [nombre], [edad]) VALUES (872, N'Evelin', 874)
GO
INSERT [dbo].[secretaria] ([id], [nombre], [edad]) VALUES (1431, N'Diana', 42)
GO
INSERT [dbo].[sitio] ([id], [direccion]) VALUES (1, N'sexta #98 recidencial anahuac')
GO
INSERT [dbo].[sitio] ([id], [direccion]) VALUES (23, N'revolucion segunda #643 cumbres')
GO
INSERT [dbo].[sitio] ([id], [direccion]) VALUES (33, N'ocho #6 guadalupe')
GO
INSERT [dbo].[sitio] ([id], [direccion]) VALUES (47, N'novena #98 recidencial anahuac tercer sector')
GO
INSERT [dbo].[sitio] ([id], [direccion]) VALUES (56, N'Juarez #208b nueva rosita')
GO
INSERT [dbo].[sitio] ([id], [direccion]) VALUES (143, N'sexta #23 guadalupe')
GO
INSERT [dbo].[sitio] ([id], [direccion]) VALUES (344, N'33 #645 Alamos')
GO
INSERT [dbo].[sitio] ([id], [direccion]) VALUES (437, N'novena #643 Los bosques')
GO
INSERT [dbo].[sitio] ([id], [direccion]) VALUES (444, N'Diana #56 Otilio')
GO
INSERT [dbo].[sitio] ([id], [direccion]) VALUES (566, N'revolucion #6 Los bosques')
GO
ALTER TABLE [dbo].[citas]  WITH CHECK ADD FOREIGN KEY([id_consultorio])
REFERENCES [dbo].[consultorio] ([id])
GO
ALTER TABLE [dbo].[citas]  WITH CHECK ADD FOREIGN KEY([id_medico])
REFERENCES [dbo].[medicos] ([id])
GO
ALTER TABLE [dbo].[citas]  WITH CHECK ADD FOREIGN KEY([id_paciente])
REFERENCES [dbo].[paciente] ([id])
GO
ALTER TABLE [dbo].[consultorio]  WITH CHECK ADD FOREIGN KEY([id_sitio])
REFERENCES [dbo].[sitio] ([id])
GO
ALTER TABLE [dbo].[especialidad_medico]  WITH CHECK ADD FOREIGN KEY([id_especialidad])
REFERENCES [dbo].[especialidad] ([id])
GO
ALTER TABLE [dbo].[especialidad_medico]  WITH CHECK ADD FOREIGN KEY([id_medico])
REFERENCES [dbo].[medicos] ([id])
GO
ALTER TABLE [dbo].[historial_medico]  WITH CHECK ADD FOREIGN KEY([id_paciente])
REFERENCES [dbo].[paciente] ([id])
GO
ALTER TABLE [dbo].[signos_vitales]  WITH CHECK ADD FOREIGN KEY([id_paciente])
REFERENCES [dbo].[paciente] ([id])
GO
/****** Object:  StoredProcedure [dbo].[todocitas]    Script Date: 10/5/2019 13:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[todocitas] as
SELECT *
FROM citas
go;
GO
/****** Object:  StoredProcedure [dbo].[todohistorialmedico]    Script Date: 10/5/2019 13:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[todohistorialmedico] as
SELECT *
FROM historial_medico
go;
GO
/****** Object:  StoredProcedure [dbo].[todosconsultorio]    Script Date: 10/5/2019 13:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[todosconsultorio] as
SELECT *
FROM consultorio
go;
GO
/****** Object:  StoredProcedure [dbo].[todosespecialidad]    Script Date: 10/5/2019 13:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[todosespecialidad] as
SELECT *
FROM especialidad
go;
GO
/****** Object:  StoredProcedure [dbo].[todosespecialidadmedico]    Script Date: 10/5/2019 13:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[todosespecialidadmedico] as
SELECT * 
FROM especialidad_medico
go;
GO
/****** Object:  StoredProcedure [dbo].[todosignosvitales]    Script Date: 10/5/2019 13:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[todosignosvitales] as
SELECT * 
FROM signos_vitales
go;
GO
/****** Object:  StoredProcedure [dbo].[todosmedicos]    Script Date: 10/5/2019 13:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[todosmedicos] as
SELECT *
FROM medicos 
go;
EXEC todosmedicos;
GO
/****** Object:  StoredProcedure [dbo].[todospacientes]    Script Date: 10/5/2019 13:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[todospacientes] as
SELECT * 
FROM paciente
go;
GO
/****** Object:  StoredProcedure [dbo].[todossecretaria]    Script Date: 10/5/2019 13:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[todossecretaria] as
SELECT * 
FROM secretaria
go;
GO
/****** Object:  StoredProcedure [dbo].[todossitio]    Script Date: 10/5/2019 13:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[todossitio] as
SELECT *
FROM sitio
go;
GO
USE [master]
GO
ALTER DATABASE [citas] SET  READ_WRITE 
GO
