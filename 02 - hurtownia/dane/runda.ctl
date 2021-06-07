load data
infile 'runda.csv'
badfile 'runda.bad'
discardfile 'runda.dsc'
replace into table runda
fields terminated by ','
trailing nullcols
(id, numer) 