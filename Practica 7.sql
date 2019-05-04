use citas

CREATE VIEW vista1 AS
select * from citas inner join consultorio on citas.id_consultorio = consultorio.id

CREATE VIEW vista2 AS
select * from citas inner join consultorio on citas.id_consultorio = consultorio.id 
where id_consultorio = 1

CREATE VIEW vista3 AS
select * from citas inner join consultorio on citas.id_consultorio = consultorio.id 
where id_consultorio = 2

CREATE VIEW vista4 AS
select * from citas inner join consultorio on citas.id_consultorio = consultorio.id 
where id_consultorio = 3

CREATE VIEW vista5 AS
select * from citas inner join consultorio on citas.id_consultorio = consultorio.id 
where id_consultorio = 4

CREATE VIEW vista6 AS
select * from citas inner join consultorio on citas.id_consultorio = consultorio.id 
where id_consultorio = 5

CREATE VIEW vista7 AS
select * from consultorio inner join sitio on consultorio.id_sitio = sitio.id

CREATE VIEW vista8 AS
select consultorio.nombre,sitio.direccion from consultorio inner join sitio on consultorio.id_sitio = sitio.id
group by consultorio.nombre,sitio.direccion

CREATE VIEW vista9 AS
select consultorio.nombre,sitio.direccion from consultorio inner join sitio on consultorio.id_sitio = sitio.id 
where id_sitio=23 
group by consultorio.nombre,sitio.direccion

CREATE VIEW vista10 AS
select consultorio.nombre,sitio.direccion from consultorio inner join sitio on consultorio.id_sitio = sitio.id 
where id_sitio=47 
group by consultorio.nombre,sitio.direccion

select consultorio.nombre,sitio.direccion from consultorio inner join sitio on consultorio.id_sitio = sitio.id 
where id_sitio=143 
group by consultorio.nombre,sitio.direccion

select consultorio.nombre,sitio.direccion from consultorio inner join sitio on consultorio.id_sitio = sitio.id 
where id_sitio=344 
group by consultorio.nombre,sitio.direccion

select consultorio.nombre,sitio.direccion from consultorio inner join sitio on consultorio.id_sitio = sitio.id 
where id_sitio=347
group by consultorio.nombre,sitio.direccion

select consultorio.nombre,sitio.direccion from consultorio inner join sitio on consultorio.id_sitio = sitio.id 
where id_sitio=566 
group by consultorio.nombre,sitio.direccion

select * from consultorio inner join sitio on consultorio.id_sitio = sitio.id
where id_sitio=23

select * from consultorio inner join sitio on consultorio.id_sitio = sitio.id
where id_sitio=47

select * from consultorio inner join sitio on consultorio.id_sitio = sitio.id
where id_sitio=143

select * from consultorio inner join sitio on consultorio.id_sitio = sitio.id
where id_sitio=444

select * from consultorio inner join sitio on consultorio.id_sitio = sitio.id
where id_sitio=566

select * from consultorio inner join sitio on consultorio.id_sitio = sitio.id
where id_sitio=437