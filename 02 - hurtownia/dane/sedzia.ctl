load data
infile 'sedzia.csv'
badfile 'sedzia.bad'
discardfile 'sedzia.dsc'
replace into table sedzia
fields terminated by ','
trailing nullcols
(ID,IMIE,NAZWISKO,KATEGORIA,ZAROBKI)
