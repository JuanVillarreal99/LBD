use citas

select * from citas inner join consultorio on citas.id_consultorio = consultorio.id 

select * from citas inner join consultorio on citas.id_consultorio = consultorio.id 
where id_consultorio = 1

select * from citas inner join consultorio on citas.id_consultorio = consultorio.id 
where id_consultorio = 2

select * from citas inner join consultorio on citas.id_consultorio = consultorio.id 
where id_consultorio = 3

select * from citas inner join consultorio on citas.id_consultorio = consultorio.id 
where id_consultorio = 4

select * from citas inner join consultorio on citas.id_consultorio = consultorio.id 
where id_consultorio = 5

select * from consultorio inner join sitio on consultorio.id_sitio = sitio.id

select consultorio.nombre,sitio.direccion from consultorio inner join sitio on consultorio.id_sitio = sitio.id
group by consultorio.nombre,sitio.direccion

select consultorio.nombre,sitio.direccion from consultorio inner join sitio on consultorio.id_sitio = sitio.id 
where id_sitio=23 
group by consultorio.nombre,sitio.direccion

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

select * from sitio








