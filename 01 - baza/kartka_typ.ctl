LOAD DATA
INFILE 'kartka_typ.csv'
BADFILE 'kartka_typ.bad'
DISCARDFILE 'kartka_typ.dsc'
REPLACE INTO TABLE kartka_typ
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(id, nazwa)
