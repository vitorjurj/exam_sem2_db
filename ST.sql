-- select pt tabela uat
select ST_Area(geom) from uat as area_ineu;
select ST_Perimeter(geom) from uat as perimetru_ineu;
select ST_Centroid(geom) from uat;


-- select pt tabela intravilan
select name, ST_Area(geom) from intravilan as Arie_localitati;
select ST_Centroid(geom) from intravilan;

select i1.fid as fid1, i2.fid as fid2, 
ST_Distance(ST_Centroid(i1.geom), ST_Centroid(i2.geom)) as distance
from intravilan i1, intravilan i2
where i1.fid = 1 and i2.fid = 3;

-- select pt tabela drumuri
select indictiv, ST_Length(geom) from drumuri as lungime_drum where fid = 3;
select ST_Buffer(geom, 0.0001) from drumuri where fid = 3;

select d1.fid as fid1, d2.fid as fid2, ST_Intersects(d1.geom, d2.geom) as intersect, ST_Intersection(d1.geom, d2.geom) as intersection
from drumuri d1, drumuri d2 
where d1.fid = 2 and d2.fid = 3;

--select pt tabela cartier
select ST_Area(geom) from cartier as suprafata_cartier;
select ST_Perimeter(geom) from cartier as perimetru_cartier;
select ST_Centroid(geom) from cartier as centroid;

select c1.fid as fid1, c2.fid as fid2, 
ST_Distance(ST_Centroid(c1.geom), ST_Centroid(c2.geom)) as distance
from cartier c1, cartier c2
where c1.fid = 1 and c2.fid = 3;

--select pt tabela cvartale
select fid, ST_Area(geom) as area from cvartale;
select fid, ST_Perimeter(geom) as perimeter from cvartale;
select ST_Centroid(geom) from cvartale as centroid;

--select pt tabela POI
select fid, ST_AsText(geom) as coordinates from puncte_interes;
select nume, ST_Buffer(geom, 0.0002) from puncte_interes;
select ST_X(geom) X, ST_Y(geom) Y from puncte_interes;

--select pt tabela zonificare_functiala
select functie, ST_Area(geom) as area from zonificare_functionala;
select fid, ST_Perimeter(geom) as perimeter from zonificare_functionala;
select obs, ST_Centroid(geom) as centroid from zonificare_functionala;

--select pt tabela reglementari
select functie_propusa, ST_Area(geom) as area from reglementari;
select 
r.fid as reglementari_fid, 
zf.fid as zonificare_functionala_fid, 
ST_Area(ST_Intersection(r.geom, zf.geom)) as intersection_area
from reglementari r, zonificare_functionala zf
where r.fid = 7 and zf.fid = 14 and ST_Intersects(r.geom, zf.geom);