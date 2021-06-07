-- 1.Suma przychodów z meczu w danym sezonie, na danym stadionie gospodarzy i danym sezonie.

select NVL((select nazwa from sezon where id = m.id_sezon), 'Wszytkie sezony') as sezon, 
        NVL((select nazwa from stadion where id = m.id_stadion), 'Wszystkie stadiony') as stadion, 
        NVL((select nazwa from liga where id = m.id_liga), 'Wszystkie ligi') as liga, 
        sum(b.cena) as przychody_z_meczu
FROM mecz m
inner join sezon sez on sez.id = m.id_sezon
inner join bilet b on m.id = b.id_mecz
inner join stadion s on s.id = m.id_stadion
inner join liga l on l.id = m.id_liga
group by cube(sez.id, s.id, l.id);

--2. Suma przychodów dla danego sędziego, danego stadionu i w danym sezonie

select NVL((select imie || ' ' || nazwisko from sedzia where id = m.id_sedzia), 'Wszyscy sedziowie') as sedzia, 
        NVL((select nazwa from stadion where id = m.id_stadion), 'Wszystkie stadiony') as stadion, 
        NVL((select nazwa from liga where id = m.id_liga), 'Wszystkie ligi') as liga, 
        sum(b.cena) as przychody_z_meczu
FROM mecz  m
inner join bilet b on m.id = b.id_mecz
inner join sedzia sed on sed.id = m.id_sedzia
inner join stadion s on s.id = m.id_stadion
inner join liga l on l.id = m.id_liga
group by cube(sed.id, s.id, l.id);

--3. Suma przychodów dla danej ligi, dla danego sezonu oraz dla danej rundy.

select NVL(TO_CHAR((select numer from runda where id = m.id_runda)), 'Wszytkie rundy') as runda, 
        NVL((select nazwa from sezon where id = m.id_sezon), 'wszystkie sezony') as sezon, 
        NVL((select nazwa from liga where id = m.id_liga), 'Wszystkie ligi') as liga, 
        sum(b.cena) as przychody_z_meczu
FROM mecz m
inner join bilet b on m.id = b.id_mecz
inner join runda r on r.id = m.id_runda
inner join liga l on l.id = m.id_liga
inner join sezon sez on sez.id = m.id_sezon
group by cube(r.id, sez.id, l.id);