LOAD DATA
INFILE 'asysta.csv'
BADFILE 'asysta.bad'
DISCARDFILE 'asysta.dsc'
REPLACE INTO TABLE asysta
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(id, id_pilkarz, id_mecz, minuta)
