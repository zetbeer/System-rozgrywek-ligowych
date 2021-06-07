LOAD DATA
INFILE 'liga.csv'
BADFILE 'liga.bad'
DISCARDFILE 'liga.dsc'
REPLACE INTO TABLE liga
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(id, nazwa, prezes, rok_zalozenia)
