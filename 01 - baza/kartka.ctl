LOAD DATA
INFILE 'kartka.csv'
BADFILE 'kartka.bad'
DISCARDFILE 'kartka.dsc'
REPLACE INTO TABLE kartka
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(id, id_typ, id_pilkarz, id_mecz, minuta)
