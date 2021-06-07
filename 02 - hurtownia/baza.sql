CREATE TABLE liga (
    id int NOT NULL PRIMARY KEY,
    nazwa varchar(150) NOT NULL,
    prezes varchar(100) NOT NULL
);

CREATE TABLE stadion (
    id int not null PRIMARY KEY,
    nazwa varchar(150),
    kraj varchar(100),
    wlasciciel varchar(100)
);

CREATE TABLE sezon (
    id int not null primary key,
    nazwa varchar(100) not null,
    data_rozpoczecia date not null,
    data_zakonczenia date not null
);

CREATE TABLE runda (
    id int not null primary key,
    numer int not null
);

CREATE TABLE sedzia (
    id int NOT NULL PRIMARY KEY,
    imie varchar(100) NOT NULL,
    nazwisko varchar(100) NOT NULL,
    kategoria varchar(50) NOT NULL,
    zarobki float not null
);

CREATE TABLE mecz (
    id int not null primary key,
    id_sezon int not null,
    id_liga int not null,
    id_stadion int not null,
    id_sedzia int not null,
    id_runda int not null,
    gol int not null,
    cz_kartka int not null,
    zl_kartka int not null,
    asysta int not null,
    faul int not null,
    dochod float not null,
    data timestamp not null,
    pojemnosc_stadionu  int not null,
    data_ur_sedziego date NOT NULL,
    foreign key (id_sezon) references sezon(id),
    foreign key (id_liga) references liga(id),
    foreign key (id_stadion) references stadion(id),
    foreign key (id_runda) references runda(id),
    foreign key (id_sedzia) references sedzia(id)
);