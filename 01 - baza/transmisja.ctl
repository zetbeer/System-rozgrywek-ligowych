LOAD DATA
INFILE 'transmisja.csv'
BADFILE 'transmisja.bad'
DISCARDFILE 'transmisja.dsc'
REPLACE INTO TABLE transmisja
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(id, koszta, id_dostawca)
