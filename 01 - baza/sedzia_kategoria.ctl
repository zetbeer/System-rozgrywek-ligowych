LOAD DATA
INFILE 'sedzia_kategoria.csv'
BADFILE 'sedzia_kategoria.bad'
DISCARDFILE 'sedzia_kategoria.dsc'
REPLACE INTO TABLE sedzia_kategoria
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(id, nazwa)
