CREATE TABLE sedzia_kategoria (
    id int NOT NULL PRIMARY KEY,
    nazwa varchar(50) NOT NULL
);


CREATE TABLE sedzia (
    id int NOT NULL PRIMARY KEY,
    imie varchar(100) NOT NULL,
    nazwisko varchar(100) NOT NULL,
    pesel varchar(13) NOT NULL,
    id_kategoria int not null,
    FOREIGN KEY (id_kategoria) REFERENCES sedzia_kategoria(id)
);

CREATE TABLE liga (
    id int NOT NULL PRIMARY KEY,
    nazwa varchar(150) NOT NULL,
    prezes varchar(100) NOT NULL,
    rok_zalozenia int not null
);


CREATE TABLE miejscowosc(
    id int NOT NULL PRIMARY KEY,
    nazwa varchar(150) NOT NULL
);

CREATE TABLE kraj(
    id int NOT NULL PRIMARY KEY,
    nazwa varchar(150) NOT NULL
);


CREATE TABLE stadion (
    id int not null PRIMARY KEY,
    id_miejscowosc int not null,
    id_kraj int not null,
    wlasciciel varchar(100),
    pojemnosc int,
    nazwa varchar(150),
    FOREIGN KEY (id_miejscowosc) REFERENCES miejscowosc(id),
    FOREIGN KEY (id_kraj) REFERENCES kraj(id)
);

CREATE TABLE kibic (
    id int not null primary key,
    imie varchar(100) not null,
    nazwisko varchar(100) not null
);

CREATE TABLE trener (
    id int not null primary key,
    imie varchar(100) not null,
    nazwisko varchar(100) not null,
    data_urodzenia date not null,
    licencja varchar(20) not null
);

CREATE TABLE klasa (
    id int not null primary key,
    nazwa varchar(100) not null
);

CREATE TABLE druzyna (
    id int not null primary key,
    nazwa varchar(150) not null,
    rok_zalozenia int not null,
    prezes varchar(100) not null,
    id_klasa int not null,
    id_trener int not null,
    FOREIGN KEY (id_klasa) REFERENCES klasa(id),
    FOREIGN KEY (id_trener) REFERENCES trener(id)
);

CREATE TABLE pilkarz (
    id int not null primary key,
    imie varchar(100) not null,
    nazwisko varchar(100) not null,
    pesel varchar(11) not null,
    id_druzyna int not null,
    FOREIGN KEY (id_druzyna) REFERENCES druzyna(id)
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

CREATE TABLE mecz (
    id int not null primary key,
    data_godzina timestamp not null,
    id_sezon int not null,
    id_sedzia int not null,
    id_liga int not null,
    id_stadion int not null,
    id_runda int not null,
    id_druzyna_a int not null,
    id_druzyna_b int not null,
    FOREIGN KEY (id_sezon) REFERENCES sezon(id),
    FOREIGN KEY (id_sedzia) REFERENCES sedzia(id),
    FOREIGN KEY (id_liga) REFERENCES liga(id),
    FOREIGN KEY (id_stadion) REFERENCES stadion(id),
    FOREIGN KEY (id_runda) REFERENCES runda(id),
    FOREIGN KEY (id_druzyna_a) REFERENCES druzyna(id),
    FOREIGN KEY (id_druzyna_b) REFERENCES druzyna(id)
);


CREATE TABLE bilet (
    id int not null primary key,
    id_mecz int not null,
    id_kibic int not null,
    cena float not null,
    FOREIGN KEY (id_mecz) REFERENCES mecz(id),
    FOREIGN KEY (id_kibic) REFERENCES kibic(id)
);

CREATE TABLE kartka_typ (
    id int not null primary key,
    nazwa varchar(100) not null
);

CREATE TABLE kartka (
    id int not null primary key,
    id_typ int not null,
    id_pilkarz int not null,
    id_mecz int not null,
    minuta int not null,
    FOREIGN KEY (id_typ) REFERENCES kartka_typ(id),
    FOREIGN KEY (id_pilkarz) REFERENCES pilkarz(id),
    FOREIGN KEY (id_mecz) REFERENCES mecz(id)
);

CREATE TABLE gol (
    id int not null primary key,
    id_pilkarz int not null,
    id_mecz int not null,
    minuta int not null,
    FOREIGN KEY (id_pilkarz) REFERENCES pilkarz(id),
    FOREIGN KEY (id_mecz) REFERENCES mecz(id)
);

CREATE TABLE asysta (
    id int not null primary key,
    id_pilkarz int not null,
    id_mecz int not null,
    minuta int not null,
    FOREIGN KEY (id_pilkarz) REFERENCES pilkarz(id),
    FOREIGN KEY (id_mecz) REFERENCES mecz(id)
);

CREATE TABLE faul (
    id int not null primary key,
    id_pilkarz int not null,
    id_mecz int not null,
    minuta int not null,
    FOREIGN KEY (id_pilkarz) REFERENCES pilkarz(id),
    FOREIGN KEY (id_mecz) REFERENCES mecz(id)
);

CREATE TABLE spalony (
    id int not null primary key,
    id_pilkarz int not null,
    id_mecz int not null,
    minuta int not null,
    FOREIGN KEY (id_pilkarz) REFERENCES pilkarz(id),
    FOREIGN KEY (id_mecz) REFERENCES mecz(id)
);

CREATE TABLE umowa (
	id int not null primary key,
	id_sedzia int not null,
	zarobki float not null,
	FOREIGN KEY (id_sedzia) REFERENCES sedzia(id)
);


create or replace FUNCTION pesel_ur(pesel varchar2) return date
is
begin
return to_date(substr(pesel, 1, 6), 'YYMMDD');
end;