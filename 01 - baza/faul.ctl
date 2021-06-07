LOAD DATA
INFILE 'faul.csv'
BADFILE 'faul.bad'
DISCARDFILE 'faul.dsc'
REPLACE INTO TABLE faul
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(id, id_pilkarz, id_mecz, minuta)
