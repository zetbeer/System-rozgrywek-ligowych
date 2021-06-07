LOAD DATA
INFILE 'licencja.csv'
BADFILE 'licencja.bad'
DISCARDFILE 'licencja.dsc'
REPLACE INTO TABLE licencja
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(id, nazwa)
