--1. Wyświetla liczbę fauli które odgwizdal dany sędzia, w danym sezonie i w danej lidze.

SELECT NVL((select lp.nazwa from liga lp where l.id = lp.id), 'Wszystkie ligi') as liga, 
        NVL((select sp.imie || ' ' || sp.nazwisko from sedzia sp where s.id = sp.id), 'Wszyscy sedziowie') as sedzia, 
        NVL((select nazwa from sezon where id = m.id_sezon), 'Wszystkie sezony') as sezon,  COUNT(f.id) as liczba_fauli 
        FROM mecz m
INNER JOIN faul f ON m.id = f.id_mecz
INNER JOIN sedzia s ON m.id_sedzia = s.id
INNER JOIN liga l ON l.id = m.id_liga
inner join sezon sez on sez.id = m.id_sezon
GROUP BY ROLLUP(l.id, s.id, sez.id);

-- 2.Liczba czerwnonych kartek wystawionych przez danego sędziego, w danym sezonie i w danej lidze.

select NVL((select lp.nazwa from liga lp where lp.id = m.id_liga), 'Wszystkie ligi') as liga, 
        NVL((select sp.imie || ' ' || sp.nazwisko from sedzia sp where sp.id = m.id_sedzia), 'Wszyscy sedziowie') as sedzia, 
        NVL((select sp.nazwa from sezon sp where sp.id = m.id_sezon), 'Wszystkie sezony') as sezon, 
        count(k.id) as liczba_kartek 
        from mecz m
right JOIN kartka k ON m.id = k.id_mecz
INNER JOIN kartka_typ kt ON kt.id=k.id_typ
INNER JOIN sedzia s ON s.id = m.id_sedzia
INNER JOIN liga l ON l.id = m.id_liga
inner join sezon sez on sez.id = m.id_sezon
where kt.nazwa = 'czerwona'
group by ROLLUP(l.id, s.id, sez.id);

--3. Liczba fauli popelnionych na danym stadionie, przy danym sędzim i w danej rundzie

SELECT NVL((select sp.imie || ' ' || sp.nazwisko from sedzia sp where sp.id = m.id_sedzia), 'Wszyscy sedziowie') as sedzia, 
    NVL((select stp.nazwa from stadion stp where stp.id = m.id_stadion), 'Wszystkie stadiony') as stadion, 
    NVL(TO_CHAR((select rp.numer from runda rp where rp.id = m.id_runda)), 'Wszystkie rundy') as runda, 
    COUNT(f.id) as liczba_fauli 
    FROM mecz m
INNER JOIN faul f on m.id = f.id_mecz
INNER JOIN stadion s on s.id = m.id_stadion
inner join sedzia sed on sed.id = m.id_sedzia
inner join runda r on r.id = m.id_runda
group by rollup(sed.id, s.id, r.id);