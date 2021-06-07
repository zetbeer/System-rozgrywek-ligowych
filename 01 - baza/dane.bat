SET username=kamilsadaj
SET password=kamilsadaj1
SET instation=DESKTOP-BJRDB2L:1521/XE

SQLLDR %username%/%password%@//%instation% CONTROL='sedzia_kategoria.ctl'
SQLLDR %username%/%password%@//%instation% CONTROL='sedzia.ctl'
SQLLDR %username%/%password%@//%instation% CONTROL='umowa.ctl'
SQLLDR %username%/%password%@//%instation% CONTROL='sezon.ctl'
SQLLDR %username%/%password%@//%instation% CONTROL='runda.ctl'
SQLLDR %username%/%password%@//%instation% CONTROL='miejscowosc.ctl'
SQLLDR %username%/%password%@//%instation% CONTROL='kraj.ctl'
SQLLDR %username%/%password%@//%instation% CONTROL='stadion.ctl'
SQLLDR %username%/%password%@//%instation% CONTROL='liga.ctl'
SQLLDR %username%/%password%@//%instation% CONTROL='kibic.ctl'
SQLLDR %username%/%password%@//%instation% CONTROL='klasa.ctl'
SQLLDR %username%/%password%@//%instation% CONTROL='trener.ctl'
SQLLDR %username%/%password%@//%instation% CONTROL='druzyna.ctl'
SQLLDR %username%/%password%@//%instation% CONTROL='pilkarz.ctl'
SQLLDR %username%/%password%@//%instation% CONTROL='kartka_typ.ctl'
SQLLDR %username%/%password%@//%instation% CONTROL='mecz.ctl'
SQLLDR %username%/%password%@//%instation% CONTROL='bilet.ctl'
SQLLDR %username%/%password%@//%instation% CONTROL='kartka.ctl'
SQLLDR %username%/%password%@//%instation% CONTROL='faul.ctl'
SQLLDR %username%/%password%@//%instation% CONTROL='spalony.ctl'
SQLLDR %username%/%password%@//%instation% CONTROL='gol.ctl'
SQLLDR %username%/%password%@//%instation% CONTROL='asysta.ctl'
pause
