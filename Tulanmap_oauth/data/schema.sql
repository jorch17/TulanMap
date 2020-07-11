CREATE DATABASE demo_google;

USE demo_google;

CREATE TABLE users(
    user varchar(64) NOT NULL PRIMARY KEY,
    privilege integer NOT NULL DEFAULT -1,
    status integer NOT NULL DEFAULT 1,
    username varchar(150) NOT NULL,
    email varchar(100) NOT NULL,
    other_data varchar(50) NOT NULL,
    user_hash varchar(32) NOT NULL,
    created timestamp NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE sessions(
    session_id char(128) UNIQUE NOT NULL,
    atime timestamp NOT NULL default current_timestamp,
    data text
)ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE logs( 
    id_log integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user varchar(64) NOT NULL,
    ip varchar(16) NOT NULL,
    access timestamp NOT NULL,
    FOREIGN KEY (user) REFERENCES users(user)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

create table rutas(
    id_ruta int(3) primary key auto_increment not null,
    nombre_ruta varchar(40) not null,
    hora_inicio varchar(8) not null,
    hora_fin varchar(8) not null,
    intervalo varchar(10) not null,
    latitud_inicio double not null,
    longitud_inicio double not null,
	latitud_final double not null,
    longitud_final double not null,
    tiempo_recorrido varchar(10) not null,
    distancia_km varchar(8) not null,
    activo varchar(2) not null);
    
    
create table paradas(
    id_parada int(3) primary key auto_increment not null,
    nombre_parada varchar(40) not null,
    latitud_parada double not null,
    longitud_parada double not null,
    identificador_p varchar(15) not null,
    activo varchar(2) not null,
    id_ruta int(3) not null,
    FOREIGN KEY (id_ruta) REFERENCES rutas(id_ruta));
    
	create table tarifas(
    id_tarifa int(3) primary key auto_increment not null,
    descripcion_tarifa varchar(40) not null,
    tarifa varchar(10) not null,
    activo varchar(2) not null,
    id_ruta int (3) not null,
    FOREIGN KEY (id_ruta) REFERENCES rutas(id_ruta));

INSERT INTO users (user, privilege, status, username, email, other_data, user_hash)
VALUES 
('martyn9mcfly@gmail.com', 0, 1, 'Martyn', 'martyn9mcfly@gmail.com','administrador', MD5(concat('martyn9mcfly@gmail.com', 'kuorra_key', '2016/06/04')));

CREATE USER 'demo_google'@'localhost' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON demo_google.* TO 'demo_google'@'localhost';
FLUSH PRIVILEGES;

SELECT * FROM users;
SELECT * FROM sessions;
SELECT * FROM logs;
