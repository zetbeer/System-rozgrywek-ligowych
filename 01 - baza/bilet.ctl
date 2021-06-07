LOAD DATA
INFILE 'bilet.csv'
BADFILE 'bilet.bad'
DISCARDFILE 'bilet.dsc'
REPLACE INTO TABLE bilet
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(id, id_mecz, id_kibic, cena)
