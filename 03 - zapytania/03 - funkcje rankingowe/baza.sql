-- 1.Ranking pojemności stadionu dla danego sezonu i danej ligi

select (select nazwa from liga where id = m.id_liga) as liga, 
        (select nazwa from sezon where id = m.id_sezon) as sezon, 
        (select nazwa from stadion where id = m.id_stadion) as stadion, 
        std.pojemnosc, 
        rank() over (PARTITION BY l.id ORDER BY std.pojemnosc desc) as ranking1, 
        Dense_rank() over (PARTITION BY s.id ORDER BY std.pojemnosc desc) as ranking2
from liga l
inner join mecz m on m.id_liga = l.id
inner join sezon s on s.id = m.id_sezon
inner join stadion std on std.id = m.id_stadion
order by ranking1, ranking2;

-- 2.Ranking wieku sędziego według ligi.

select distinct (select nazwa from liga where id = m.id_liga) as liga, 
        (select imie || ' ' || nazwisko from sedzia where id = m.id_sedzia)  as sedzia,  
        FLOOR(months_between(pesel_ur(sed.pesel), TRUNC(sysdate)) / 12) as wiek_sedziego,
        Dense_Rank() over (PARTITION BY l.nazwa ORDER BY FLOOR(months_between(pesel_ur(sed.pesel), TRUNC(sysdate)) / 12)) as ranking1
from mecz m
inner join sedzia sed on sed.id = m.id_sedzia
inner join umowa u on u.id_sedzia = sed.id
inner join liga l on l.id = m.id_liga
order by ranking1;

-- 3.Stosunek pojemnośći danego stadionu do wszystkich stadionów w danej lidze.

select distinct (select nazwa from liga where id = m.id_liga) liga, 
        (select nazwa from stadion where id = m.id_stadion) stadion,
        PERCENT_RANK() over (PARTITION BY l.id ORDER BY s.pojemnosc) as ranking1
from mecz m
inner join stadion s on s.id = m.id_stadion
inner join liga l on l.id = m.id_liga;