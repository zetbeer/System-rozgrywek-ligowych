create or replace PROCEDURE SEZON_EXPORT(
location_dir IN varchar2 
) AS
  CURSOR c_data IS
    select id, nazwa, TO_CHAR(data_rozpoczecia, 'YYYY-MM-DD') as data_rozpoczecia, TO_CHAR(data_zakonczenia, 'YYYY-MM-DD') as data_zakonczenia from sezon;

  v_file  UTL_FILE.FILE_TYPE;
BEGIN
  v_file := UTL_FILE.FOPEN(location     => location_dir,
                           filename     => 'sezon.csv',
                           open_mode    => 'w',
                           max_linesize => 32767);
  FOR cur_rec IN c_data LOOP
    UTL_FILE.PUT_LINE(v_file,
                      cur_rec.id    || ',' ||
                      cur_rec.nazwa || ',' || 
                      cur_rec.data_rozpoczecia || ',' ||
                      cur_rec.data_zakonczenia);
  END LOOP;
  UTL_FILE.FCLOSE(v_file);

EXCEPTION
  WHEN OTHERS THEN
    UTL_FILE.FCLOSE(v_file);
    RAISE;
END;
/

create or replace PROCEDURE LIGA_EXPORT(
location_dir IN varchar2 
) AS
  CURSOR c_data IS
    select id, nazwa, prezes from liga;

  v_file  UTL_FILE.FILE_TYPE;
BEGIN
  v_file := UTL_FILE.FOPEN(location     => location_dir,
                           filename     => 'liga.csv',
                           open_mode    => 'w',
                           max_linesize => 32767);
  FOR cur_rec IN c_data LOOP
    UTL_FILE.PUT_LINE(v_file,
                      cur_rec.id    || ',' ||
                      cur_rec.nazwa || ',' || 
                      cur_rec.prezes);
  END LOOP;
  UTL_FILE.FCLOSE(v_file);

EXCEPTION
  WHEN OTHERS THEN
    UTL_FILE.FCLOSE(v_file);
    RAISE;
END;


create or replace PROCEDURE RUNDA_EXPORT(
location_dir IN varchar2 
) AS
  CURSOR c_data IS
    select id, numer from runda;

  v_file  UTL_FILE.FILE_TYPE;
BEGIN
  v_file := UTL_FILE.FOPEN(location     => location_dir,
                           filename     => 'runda.csv',
                           open_mode    => 'w',
                           max_linesize => 32767);
  FOR cur_rec IN c_data LOOP
    UTL_FILE.PUT_LINE(v_file,
                      cur_rec.id    || ',' ||
                      cur_rec.numer);
  END LOOP;
  UTL_FILE.FCLOSE(v_file);

EXCEPTION
  WHEN OTHERS THEN
    UTL_FILE.FCLOSE(v_file);
    RAISE;
END;
/

create or replace PROCEDURE SEDZIA_EXPORT(
location_dir IN varchar2 
) AS
  CURSOR c_data IS
    select s.id, s.imie, s.nazwisko, sk.nazwa as kategoria, u.zarobki
    from sedzia s
    inner join sedzia_kategoria sk on s.id_kategoria = sk.id
    inner join umowa u on u.id_sedzia = s.id;

  v_file  UTL_FILE.FILE_TYPE;
BEGIN
  v_file := UTL_FILE.FOPEN(location     => location_dir,
                           filename     => 'sedzia.csv',
                           open_mode    => 'w',
                           max_linesize => 32767);
  FOR cur_rec IN c_data LOOP
    UTL_FILE.PUT_LINE(v_file,
                      cur_rec.id        || ',' ||
                      cur_rec.imie      || ',' ||
                      cur_rec.nazwisko  || ',' ||
                      cur_rec.kategoria || ',' ||
                      cur_rec.zarobki);
  END LOOP;
  UTL_FILE.FCLOSE(v_file);

EXCEPTION
  WHEN OTHERS THEN
    UTL_FILE.FCLOSE(v_file);
    RAISE;
END;
/

create or replace PROCEDURE STADION_EXPORT(
location_dir IN varchar2 
) AS
  CURSOR c_data IS
    select s.id, s.nazwa, k.nazwa as kategoria, s.wlasciciel, s.pojemnosc from stadion s
    inner join kraj k on s.id_kraj = k.id;
    
  v_file  UTL_FILE.FILE_TYPE;
BEGIN
  v_file := UTL_FILE.FOPEN(location     => location_dir,
                           filename     => 'stadion.csv',
                           open_mode    => 'w',
                           max_linesize => 32767);
  FOR cur_rec IN c_data LOOP
    UTL_FILE.PUT_LINE(v_file,
                      cur_rec.id        || ',' ||
                      cur_rec.nazwa      || ',' ||
                      cur_rec.kategoria      || ',' ||
                      cur_rec.wlasciciel);
  END LOOP;
  UTL_FILE.FCLOSE(v_file);

EXCEPTION
  WHEN OTHERS THEN
    UTL_FILE.FCLOSE(v_file);
    RAISE;
END;
/

create or replace PROCEDURE MECZ_EXPORT(
location_dir IN varchar2 
) AS
  CURSOR c_data IS
    select m.id, m.id_sezon, m.id_liga, m.id_stadion,m.id_sedzia, m.id_runda, 
    (select count(*) from gol where id_mecz = m.id) as gol, (select count(*) from kartka where id_typ = 2 and id_mecz = m.id) as cz_kartka,
    (select count(*) from kartka where id_typ = 1 and id_mecz = m.id) as zl_kartka, (select count(*) from asysta where id_mecz = m.id) as asysta,
    (select count(*) from faul where id_mecz = m.id) as faul,
    REPLACE((select sum(bp.cena) from bilet bp where bp.id_mecz = m.id), ',', '.') as dochod,
    TO_CHAR(m.data_godzina, 'YYYY-MM-DD HH24:MI:SS') as data,
    (select pojemnosc from stadion where id = m.id_stadion) as pojemnosc,
    (select pesel_ur(pesel) from sedzia where id = m.id_sedzia) as wiek_sedziego
    from mecz m;
    
  v_file  UTL_FILE.FILE_TYPE;
BEGIN
  v_file := UTL_FILE.FOPEN(location     => location_dir,
                           filename     => 'mecz.csv',
                           open_mode    => 'w',
                           max_linesize => 32767);
  FOR cur_rec IN c_data LOOP
    UTL_FILE.PUT_LINE(v_file,
                      cur_rec.id        || ',' ||
                      cur_rec.id_sezon      || ',' ||
                      cur_rec.id_liga      || ',' ||
                      cur_rec.id_stadion  || ',' ||
                      cur_rec.id_sedzia || ',' ||
                      cur_rec.id_runda || ',' ||
                      cur_rec.gol || ',' ||
                      cur_rec.cz_kartka || ',' ||
                      cur_rec.zl_kartka || ',' ||
                      cur_rec.asysta || ',' ||
                      cur_rec.faul || ',' ||
                      cur_rec.dochod || ',' ||
                      cur_rec.data || ',' ||
                      cur_rec.pojemnosc || ',' ||
                      cur_rec.wiek_sedziego);
  END LOOP;
  UTL_FILE.FCLOSE(v_file);

EXCEPTION
  WHEN OTHERS THEN
    UTL_FILE.FCLOSE(v_file);
    RAISE;
END;
/

/* PRZYKLADOWE URUCHOMIENIE PROCEDUR */

exec SEZON_EXPORT('TEMP_DIR');
exec SEDZIA_EXPORT('TEMP_DIR');
exec RUNDA_EXPORT('TEMP_DIR');
exec STADION_EXPORT('TEMP_DIR');
exec LIGA_EXPORT('TEMP_DIR');
exec MECZ_EXPORT('TEMP_DIR');