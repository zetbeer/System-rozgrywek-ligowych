-- 1.Suma przychodów dla meczu dla danej ligi, danego sezonu oraz danej rundy.

SELECT sez.nazwa AS sezon,
       l.nazwa AS liga,
       r.numer AS runda,
       dochod as przychody 
         FROM (
            select id_sezon, id_liga, id_runda,  SUM(dochod) OVER(PARTITION BY id_sezon, id_liga, id_runda) as dochod
            from mecz
            ORDER BY id_sezon, id_liga, id_runda
        ) m
       left JOIN runda r ON r.id = m.id_runda
       left JOIN liga  l ON l.id = m.id_liga
       left join sezon sez on sez.id = m.id_sezon;

-- 2.Średnia wieku sędziego w danej lidze, na meczach na danym stadionie oraz w danym sezonie.

select sez.nazwa as sezon, 
       s.nazwa  as stadion, 
       l.nazwa as liga, 
       sredni_wiek
FROM ( select id_stadion,id_liga,id_sezon,
avg(FLOOR(months_between(data_ur_sedziego, TRUNC(sysdate)) / 12)) over (PARTITION BY id_stadion,id_liga,id_sezon) as sredni_wiek from mecz
)m
inner join stadion s on s.id = m.id_stadion
inner join liga l on l.id = m.id_liga
inner join sezon sez on sez.id = m.id_sezon
order by sez.id, s.id, l.id;

-- 3.Suma fauli dla danej ligi, sedziego oraz dla danego sezonu.

select l.nazwa as liga, 
       s.imie || ' ' || s.nazwisko as sedzia, 
       sez.nazwa as sezon,
       faul as faule 
        FROM (
            select  id_liga, id_sedzia, id_sezon,  sum(faul) over (PARTITION BY id_liga, id_sedzia, id_sezon) as faul
            from mecz
            ORDER BY  id_liga, id_sedzia, id_sezon
        ) m
inner join sedzia s on s.id = m.id_sedzia
inner join sezon sez on sez.id = m.id_sezon
inner join liga l on l.id = m.id_liga;

