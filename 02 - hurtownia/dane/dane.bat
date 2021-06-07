SET username=anna
SET password=990901
SET instation=LAPTOP-ISMMCRBM:1521/XE

SQLLDR %username%/%password%@//%instation% CONTROL='sedzia.ctl'
SQLLDR %username%/%password%@//%instation% CONTROL='sezon.ctl'
SQLLDR %username%/%password%@//%instation% CONTROL='runda.ctl'
SQLLDR %username%/%password%@//%instation% CONTROL='liga.ctl'
SQLLDR %username%/%password%@//%instation% CONTROL='stadion.ctl'
SQLLDR %username%/%password%@//%instation% CONTROL='mecz.ctl'
pause