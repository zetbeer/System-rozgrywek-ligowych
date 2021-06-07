LOAD DATA
INFILE 'druzyna.csv'
BADFILE 'druzyna.bad'
DISCARDFILE 'druzyna.dsc'
REPLACE INTO TABLE druzyna
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(id, nazwa, rok_zalozenia, prezes, id_klasa, id_trener)
