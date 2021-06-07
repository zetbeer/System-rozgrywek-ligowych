LOAD DATA
INFILE 'pilkarz.csv'
BADFILE 'pilkarz.bad'
DISCARDFILE 'pilkarz.dsc'
REPLACE INTO TABLE pilkarz
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(id, imie, nazwisko, pesel, id_druzyna)
