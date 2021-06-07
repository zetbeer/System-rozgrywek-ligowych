load data
infile 'sezon.csv'
badfile 'sezon.bad'
discardfile 'sezon.dsc'
replace into table sezon
fields terminated by ','
trailing nullcols
(id, nazwa, data_rozpoczecia DATE "YYYY-MM-DD", data_zakonczenia DATE "YYYY-MM-DD") 