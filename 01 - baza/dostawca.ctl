LOAD DATA
INFILE 'dostawca.csv'
BADFILE 'dostawca.bad'
DISCARDFILE 'dostawca.dsc'
REPLACE INTO TABLE dostawca
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(id, nazwa)
