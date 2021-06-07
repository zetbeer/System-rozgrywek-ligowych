--1. Wyświetla liczbę fauli które odgwizdal dany sędzia, w danym sezonie i w danej lidze.

SELECT NVL(l.nazwa, 'Wszystkie ligi') as liga, 
        NVL(nullif(concat (concat(s.imie, ' '),s.nazwisko),' '), 'Wszyscy sedziowie') as sedzia, 
        NVL(sez.nazwa, 'Wszystkie sezony') as sezon,  
        lFauli as liczba_fauli 
        FROM (
            select id_liga, id_sedzia, id_sezon, sum(faul) as lFauli 
            from mecz
            GROUP BY ROLLUP(id_liga, id_sedzia, id_sezon)
        ) m
left JOIN sedzia s ON m.id_sedzia = s.id
left JOIN liga l ON l.id = m.id_liga
left join sezon sez on sez.id = m.id_sezon
;

-- 2.Liczba czerwnonych kartek wystawionych przez danego sędziego, o danej kategorii sędziowskiej i w danej lidze.

select NVL(l.nazwa, 'Wszystkie ligi') as liga, 
       NVL(nullif(concat (concat(s.imie, ' '),s.nazwisko),' '), 'Wszyscy sedziowie') as sedzia,
       NVL(sez.nazwa, 'Wszystkie sezony') as sezon, 
       czer_kartki as liczba_kartek 
         FROM (
            select id_liga,id_sedzia,id_sezon, sum(cz_kartka) as czer_kartki
            from mecz
            group by rollup(id_liga,id_sedzia,id_sezon)
            having sum(cz_kartka) != 0
        ) m
left join liga l on l.id=m.id_liga
left join sedzia s on m.id_sedzia=s.id
left join sezon sez on sez.id=m.id_sezon;

--3. Liczba fauli popelnionych na danym stadionie, przy danym sędzim i w danej rundzie

SELECT NVL(nullif(concat (concat(sed.imie, ' '),sed.nazwisko),' '), 'Wszyscy sedziowie') as sedzia, 
    NVL(s.nazwa, 'Wszystkie stadiony') as stadion, 
    NVL(TO_CHAR(r.numer), 'Wszystkie rundy') as runda, 
    faule as liczba_fauli  
    FROM (
            select id_sedzia, id_stadion, id_runda, sum(faul) as faule
            from mecz
            group by rollup(id_sedzia, id_stadion, id_runda)
        ) m
left JOIN stadion s on s.id = m.id_stadion
left join sedzia sed on m.id_sedzia=sed.id
left join runda r on r.id = m.id_runda;

