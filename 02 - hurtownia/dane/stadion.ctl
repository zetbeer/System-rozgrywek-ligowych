load data
infile 'stadion.csv'
badfile 'stadion.bad'
discardfile 'stadion.dsc'
replace into table stadion
fields terminated by ','
trailing nullcols
(id,nazwa,kraj,wlasciciel) 