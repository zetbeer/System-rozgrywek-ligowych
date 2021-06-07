LOAD DATA
INFILE 'mecz.csv'
BADFILE 'mecz.bad'
DISCARDFILE 'mecz.dsc'
REPLACE INTO TABLE mecz
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(id, data_godzina DATE "YYYY-MM-DD HH24:MI:SS", id_sezon, id_sedzia, id_liga, id_stadion, id_runda, id_druzyna_a, id_druzyna_b)
