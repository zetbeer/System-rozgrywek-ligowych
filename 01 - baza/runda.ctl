LOAD DATA
INFILE 'runda.csv'
BADFILE 'runda.bad'
DISCARDFILE 'runda.dsc'
REPLACE INTO TABLE runda
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(id, numer)
