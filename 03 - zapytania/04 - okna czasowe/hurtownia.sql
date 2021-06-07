-- 1.Liczba goli dla danej ligi i dla danego roku.

select DISTINCT EXTRACT(year from data) as rok, l.nazwa as liga, 
gol as liczba_goli 
FROM (
            select  id_liga,data,sum(gol) over (PARTITION BY EXTRACT(year from data) ORDER BY id_liga RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as gol 
            from mecz
        ) m
inner join liga l on l.id = m.id_liga;

--2.Liczba asyst dla danej ligi i dla danego roku.

select DISTINCT EXTRACT(year from data) as rok, l.nazwa as liga, 
asysta as liczba_asyst
FROM (
            select  id_liga,data,sum(asysta) over (PARTITION BY EXTRACT(year from data) ORDER BY id_liga RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as asysta 
            from mecz
        ) m
inner join liga l on l.id = m.id_liga;

-- 3.Liczba fauli dla danej ligi i dla danego roku.

select DISTINCT EXTRACT(year from data) as rok, l.nazwa as liga, 
faul as liczba_fauli
FROM (
            select  id_liga,data,sum(faul) over (PARTITION BY EXTRACT(year from data) ORDER BY id_liga RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as faul 
            from mecz
        ) m
inner join liga l on l.id = m.id_liga;