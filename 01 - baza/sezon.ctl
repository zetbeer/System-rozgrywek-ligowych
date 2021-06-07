LOAD DATA
INFILE 'sezon.csv'
BADFILE 'sezon.bad'
DISCARDFILE 'sezon.dsc'
REPLACE INTO TABLE sezon
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(id, nazwa, data_rozpoczecia DATE "YYYY-MM-DD", data_zakonczenia DATE "YYYY-MM-DD")
