-- 1.Suma przychodów dla meczu dla danej ligi, danego sezonu oraz danej rundy.

SELECT
    (select nazwa from sezon where id = m.id_sezon)    AS sezon,
    (select nazwa from liga where id = m.id_liga) AS liga,
    (select numer from runda where id = m.id_runda) AS runda,
    sum(bSum) OVER(
        PARTITION BY sez.id, l.id, r.id
    ) as przychody
FROM
    mecz        m
    INNER JOIN (select id_mecz, sum(cena) as bSum from bilet group by id_mecz )         b ON m.id = b.id_mecz
    INNER JOIN runda      r ON r.id = m.id_runda
    INNER JOIN liga         l ON l.id = m.id_liga
    inner join sezon        sez on sez.id = m.id_sezon
ORDER BY
    sez.id,
    l.id,
    r.id;
	
-- 2.Średnia wieku sędziego w danej lidze, na meczach na danym stadionie oraz w danym sezonie.
	
select (select nazwa from sezon where id = m.id_sezon) as sezon, 
        (select nazwa from stadion where id = m.id_stadion) as stadion, 
        (select nazwa from liga where id = m.id_liga) as liga, 
        avg(FLOOR(months_between(pesel_ur(sed.pesel), TRUNC(sysdate)) / 12)) over (PARTITION BY sez.id, s.id, l.id) as sredni_wiek
FROM mecz m
INNER JOIN sedzia sed on sed.id = m.id_sedzia
inner join stadion s on s.id = m.id_stadion
inner join liga l on l.id = m.id_liga
inner join sezon sez on sez.id = m.id_sezon
order by sez.id, s.id, l.id;


-- 3.Suma fauli dla danej ligi, sedziego oraz dla danego sezonu.

select (select nazwa from liga where id = m.id_liga) as liga, 
        (select imie || ' ' || nazwisko from sedzia where id = m.id_sedzia) as sedzia, 
        (select nazwa from sezon where id = m.id_sezon) as sezon, 
        sum(fSum) over (PARTITION BY l.id, s.id, sez.id) as faule
FROM mecz m
inner join (select id_mecz, count(id) as fSum from faul group by id_mecz ) f on m.id = f.id_mecz
inner join sedzia s on s.id = m.id_sedzia
inner join sezon sez on sez.id = m.id_sezon
inner join liga l on l.id = m.id_liga
order by  l.id, s.id, sez.id;