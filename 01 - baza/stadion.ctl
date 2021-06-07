LOAD DATA
INFILE 'stadion.csv'
BADFILE 'stadion.bad'
DISCARDFILE 'stadion.dsc'
REPLACE INTO TABLE stadion
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(id, nazwa, id_miejscowosc, id_kraj, wlasciciel, pojemnosc)
