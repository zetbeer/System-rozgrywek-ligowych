LOAD DATA
INFILE 'umowa.csv'
BADFILE 'umowa.bad'
DISCARDFILE 'umowa.dsc'
REPLACE INTO TABLE umowa
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(id, id_sedzia, zarobki)
