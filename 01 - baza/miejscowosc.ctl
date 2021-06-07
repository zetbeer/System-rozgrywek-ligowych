LOAD DATA
INFILE 'miejscowosc.csv'
BADFILE 'miejscowosc.bad'
DISCARDFILE 'miejscowosc.dsc'
REPLACE INTO TABLE miejscowosc
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(id, nazwa)
