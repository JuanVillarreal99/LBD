create database citas

use citas

create table consultorio(
	id int primary key not null,
	nombre nvarchar(40),
	ubicacion nvarchar(200))

create table especialidad(
	id int primary key not null,
	nombre varchar(40),
	universidad varchar(50))

	drop table especialidad

create table medicos(
	id int primary key not null,
	nombre nvarchar(40),
	cedulaprofesional nvarchar(100))

create table paciente(
	id int primary key not null,
	nombre nvarchar(40),
	telefono int not null,
	sexo nvarchar)

create table signos_vitales(
	id_unico UNIQUEIDENTIFIER not null,
	peso int not null,
	estatura int not null)

create table historial_medico(
	id int primary key not null,
	fecha nvarchar not null,
	padecimiento nvarchar not null)

	drop table signos_vitales

create table secretaria(
	id int primary key not null,
	nombre nvarchar not null,
	edad int not null)

create table citas(
	id int primary key not null,
	id_medico int foreign key(id_medico)
	references medicos(id),
	id_paciente int foreign key(id_paciente)
	references paciente(id),
	id_consultorio int foreign key(id_consultorio)
	references consultorio(id))

	drop table citas

create table especialidad_medico(
	id int primary key not null,
	id_medico int foreign key(id_medico)
	references medicos(id),
	id_especialidad int foreign key(id_especialidad)
	references especialidad(id))

	
create table sitio(
	id int primary key not null,
	direccion nvarchar(50))

)
	









	drop table medicos







