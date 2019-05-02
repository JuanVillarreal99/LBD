create database citas

use citas

create table consultorio(
	id int primary key not null,
	nombre nvarchar(40),
	id_sitio int foreign key(id_sitio)
	references sitio(id),
	ubicacion nvarchar(200))

	drop table consultorio

create table especialidad(
	id int primary key not null,
	nombre varchar(40),
	universidad varchar(50))

	drop table consultorio

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
	id int primary key not null,
	peso int not null,
	id_paciente int foreign key(id_paciente)
	references paciente(id),
	estatura int not null)

	drop table paciente

create table historial_medico(
	id int primary key not null,
	fecha nvarchar not null,
	id_paciente int foreign key(id_paciente)
	references paciente(id),
	padecimiento nvarchar not null)

	drop table historial_medico

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







