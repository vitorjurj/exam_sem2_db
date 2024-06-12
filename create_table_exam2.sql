--create extension postgis

create table uat(
	fid serial primary key not null,
	geom geometry('Polygon', 4326),
	siruta int not null
);

create table intravilan(
	fid serial primary key not null,
	geom geometry('Polygon', 4326),
	name varchar(255) not null,
	uat_fid integer not null,
	foreign key (uat_fid) references uat(fid)
);

create table drumuri(
	fid serial primary key not null,
	geom geometry('LineString', 4326),
	indictiv varchar(255),
	admin varchar(255) not null,
	name_str varchar(255)
);

create table intravilan_drumuri(
	fid serial primary key not null,
	intravilan_fid int not null,
	drumuri_fid int not null,
	foreign key (intravilan_fid) references intravilan(fid),
	foreign key (drumuri_fid) references drumuri(fid)
); 

create table cartier(
	fid serial primary key not null,
	geom geometry('Polygon', 4326),
	cartier varchar(255) not null,
	intravilan_fid int not null,
	foreign key (intravilan_fid) references intravilan(fid)
);

create table cvartale(
	fid serial primary key not null,
	geom geometry('Polygon', 4326),
	nr int not null,
	cartier_fid int not null,
	foreign key (cartier_fid) references cartier(fid)
);

create table puncte_interes(
	fid serial primary key not null,
	geom geometry('Point', 4326),
	tip varchar(255) not null,
	nume varchar(255),
	intravilan_fid int not null,
	foreign key (intravilan_fid) references intravilan(fid)
);

create table zonificare_functionala(
	fid serial primary key not null,
	geom geometry('Polygon', 4326),
	functie varchar(255) not null,
	obs varchar(255)	
);

create table intravilan_zonificare_functionala(
	fid serial primary key not null,
	intravilan_fid int not null,
	zonificare_functionala_fid int not null,
	foreign key (intravilan_fid) references intravilan(fid),
	foreign key (zonificare_functionala_fid) references zonificare_functionala(fid)
);

create table reglementari(
	fid serial primary key not null,
	geom geometry('Polygon', 4326),
	functie_existenta varchar(255) not null,
	functie_propusa varchar(255) not null,
	zonificare_functionala_fid int unique not null,
	foreign key (zonificare_functionala_fid) references zonificare_functionala(fid)
);