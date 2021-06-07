-- 1.Ranking pojemności stadionu dla danego sezonu i danej ligi

select l.nazwa as liga, 
       s.nazwa as sezon, 
       std.nazwa as stadion, 
       m.pojemnosc_stadionu as pojemnosc,
       ranking1,ranking2
from (
select id_liga,id_sezon,id_stadion,pojemnosc_stadionu, rank() over (PARTITION BY id_liga ORDER BY pojemnosc_stadionu desc) as ranking1, 
        Dense_rank() over (PARTITION BY id_sezon ORDER BY pojemnosc_stadionu desc) as ranking2 from mecz  
)m
inner join liga l  on m.id_liga = l.id
inner join sezon s on s.id = m.id_sezon
inner join stadion std on std.id = m.id_stadion
order by ranking1, ranking2;

-- 2.Ranking wieku sedziego wedle ligi

select distinct l.nazwa  as liga, 
        s.imie || ' ' || s.nazwisko as sedzia, wiek_sedziego, 
        ranking1
        
from ( select id_liga,id_sedzia,FLOOR(months_between(data_ur_sedziego, TRUNC(sysdate)) / 12) as wiek_sedziego,
        Dense_Rank() over (PARTITION BY id_liga ORDER BY FLOOR(months_between(data_ur_sedziego, TRUNC(sysdate)) / 12)) as ranking1 from mecz
)m
inner join sedzia s on s.id = m.id_sedzia
inner join liga l on l.id = m.id_liga
order by ranking1;

-- 3.Stosunek pojemnośći danego stadionu do wszystkich stadionów w danej lidze.

select DISTINCT l.nazwa  as liga, 
        s.nazwa as stadion ,ranking1  
from (
select id_liga,id_stadion, PERCENT_RANK() over (PARTITION BY id_liga ORDER BY pojemnosc_stadionu) as ranking1 from mecz 
)m
left join liga l on l.id = m.id_liga
left join stadion s on s.id = m.id_stadion
order by ranking1;