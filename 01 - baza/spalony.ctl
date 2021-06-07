LOAD DATA
INFILE 'spalony.csv'
BADFILE 'spalony.bad'
DISCARDFILE 'spalony.dsc'
REPLACE INTO TABLE spalony
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(id, id_pilkarz, id_mecz, minuta)
