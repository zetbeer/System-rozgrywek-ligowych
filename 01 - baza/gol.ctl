LOAD DATA
INFILE 'gol.csv'
BADFILE 'gol.bad'
DISCARDFILE 'gol.dsc'
REPLACE INTO TABLE gol
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(id, id_pilkarz, id_mecz, minuta)
