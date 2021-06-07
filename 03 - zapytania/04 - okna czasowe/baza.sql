-- 1.Liczba goli dla danej ligi i dla danego roku.

select distinct EXTRACT(year from m.data_godzina) as rok, 
        l.nazwa as liga, 
        count(g.id) over (PARTITION BY EXTRACT(year from m.data_godzina) ORDER BY l.id RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as liczba_goli
FROM mecz m
inner join gol g on g.id_mecz = m.id
inner join liga l on l.id = m.id_liga;

--2.Liczba asyst dla danej ligi i dla danego roku.

select distinct EXTRACT(year from m.data_godzina) as rok, 
        l.nazwa as liga, 
        count(a.id) over (PARTITION BY EXTRACT(year from m.data_godzina) ORDER BY l.id RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as liczba_asyst
FROM mecz m
inner join asysta a on a.id_mecz = m.id
inner join liga l on l.id = m.id_liga;


-- 3.Liczba fauli dla danej ligi i dla danego roku.

select distinct EXTRACT(year from m.data_godzina) as rok, 
        l.nazwa as liga, 
        count(f.id) over (PARTITION BY EXTRACT(year from m.data_godzina) ORDER BY l.id RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as liczba_fauli
FROM mecz m
inner join faul f on f.id_mecz = m.id
inner join liga l on l.id = m.id_liga;
