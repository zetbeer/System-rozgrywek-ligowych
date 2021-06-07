-- 1.Suma przychodów z meczu w danym sezonie, na danym stadionie gospodarzy i danym sezonie.

select NVL(sez.nazwa, 'Wszystkie sezony') as sezon, 
        NVL(s.nazwa, 'Wszystkie stadiony') as stadion, 
        NVL(l.nazwa, 'Wszystkie ligi') as liga, 
        dochody as przychody_z_meczu 
        from (
            select id_sezon, id_stadion, id_liga, sum(dochod) as dochody
            from mecz
            group by cube(id_sezon, id_stadion, id_liga) 
        ) m
left join sezon sez on sez.id = m.id_sezon
left join stadion s on s.id = m.id_stadion
left join liga l on l.id = m.id_liga
;

--2. Suma przychodów dla danego sędziego, danego stadionu i w danym sezonie

select NVL(nullif(concat (concat(sed.imie, ' '),sed.nazwisko),' '), 'Wszyscy sedziowie') as sedzia, 
        NVL(s.nazwa, 'Wszystkie stadiony') as stadion, 
        NVL(l.nazwa, 'Wszystkie ligi') as liga, 
        dochod as przychody_z_meczu  
        FROM (
            select id_sedzia, id_stadion, id_liga, sum(dochod) as dochod
            from mecz
            group by cube(id_sedzia, id_stadion, id_liga)
        ) m
left join sedzia sed on sed.id = m.id_sedzia
left join stadion s on s.id = m.id_stadion
left join liga l on l.id = m.id_liga;

--3. Suma przychodów dla danej ligi, dla danego sezonu oraz dla danej rundy.

select NVL(TO_CHAR(r.numer), 'Wszytkie rundy') as runda, 
        NVL(s.nazwa, 'wszystkie sezony') as sezon, 
        NVL(l.nazwa, 'Wszystkie ligi') as liga, 
        dochod as przychody_z_meczu 
        FROM (
            select id_runda, id_sezon, id_liga, sum(dochod) as dochod
            from mecz
            group by cube(id_runda, id_sezon, id_liga)
        ) m
left join runda r on r.id = m.id_runda
left join liga l on l.id = m.id_liga
left join sezon s on s.id = m.id_sezon;