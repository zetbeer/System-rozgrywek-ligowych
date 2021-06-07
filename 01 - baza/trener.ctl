LOAD DATA
INFILE 'trener.csv'
BADFILE 'trener.bad'
DISCARDFILE 'trener.dsc'
REPLACE INTO TABLE trener
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(id, imie, nazwisko, data_urodzenia DATE "YYYY-MM-DD", licencja)
