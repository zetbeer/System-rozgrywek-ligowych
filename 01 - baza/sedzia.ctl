LOAD DATA
INFILE 'sedzia.csv'
BADFILE 'sedzia.bad'
DISCARDFILE 'sedzia.dsc'
REPLACE INTO TABLE sedzia
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(id, imie, nazwisko, id_kategoria, pesel)
