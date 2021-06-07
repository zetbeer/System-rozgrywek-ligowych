load data
infile 'liga.csv'
badfile 'liga.bad'
discardfile 'liga.dsc'
replace into table liga
fields terminated by ','
trailing nullcols
(id, nazwa, prezes) 