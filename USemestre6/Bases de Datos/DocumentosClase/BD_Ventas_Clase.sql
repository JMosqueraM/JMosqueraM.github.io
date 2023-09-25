create database ventas;
use ventas;


CREATE TABLE ventas.proveedor (
nit_prov varchar(15) not null,
nombre_prov varchar(50),
dir_calle_prov varchar(30),
dir_numero_prov varchar(30),
dir_torre_prov varchar(30),
dir_apto_prov varchar(6),
dir_ciudad_prov varchar(30),
primary key (nit_prov)
);

CREATE TABLE ventas.cliente (
no_doc_cli varchar(15) not null,
primer_nombre_cli varchar(50),
segundo_nombre_cli varchar(50),
primer_apellido_cli varchar(50),
segundo_apellido_cli varchar(50),
dir_calle_cli varchar(30),
dir_numero_cli varchar(30),
dir_torre_cli varchar(30),
dir_apto_cli varchar(6),
dir_ciudad_cli varchar(30),
fec_nac_cli date,
primary key (no_doc_cli)
);

CREATE TABLE ventas.producto (
cod_producto varchar(15) not null,
nit_prov_producto varchar(15) not null,
nom_producto varchar (30),
precio_unitario_producto int, 
primary key (cod_producto),
foreign key (nit_prov_producto) references ventas.proveedor (nit_prov)
);

CREATE TABLE cli_produ (
cod_producto_cli_produ varchar(15) not null,
no_doc_cli_cli_produ varchar(15) not null,
primary key (cod_producto_cli_produ, no_doc_cli_cli_produ),
foreign key (cod_producto_cli_produ) references ventas.producto (cod_producto),
foreign key (no_doc_cli_cli_produ) references ventas.cliente (no_doc_cli)
);
