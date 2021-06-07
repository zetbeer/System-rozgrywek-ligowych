load data
infile 'mecz.csv'
badfile 'mecz.bad'
discardfile 'mecz.dsc'
replace into table mecz
fields terminated by ','
trailing nullcols
(ID,ID_SEZON,ID_LIGA,ID_STADION,ID_SEDZIA,ID_RUNDA,GOL,CZ_KARTKA,ZL_KARTKA,ASYSTA,FAUL,DOCHOD,DATA date "YYYY-MM-DD HH24:MI:SS",POJEMNOSC_STADIONU,DATA_UR_SEDZIEGO DATE "YY/MM/DD" )
