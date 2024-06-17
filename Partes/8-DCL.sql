-- creacion usuarios 

use mysql;
CREATE USER IF NOT EXISTS 'updater'@'localhost' IDENTIFIED BY  'c0ntras3ña';

GRANT SELECT, INSERT, UPDATE ON FormulaUno.circuitos TO 'updater'@'localhost';
GRANT SELECT, INSERT, UPDATE ON FormulaUno.carreras TO 'updater'@'localhost';
GRANT SELECT, INSERT, UPDATE ON FormulaUno.pilotos TO 'updater'@'localhost';
GRANT SELECT, INSERT, UPDATE ON FormulaUno.escuderias TO 'updater'@'localhost';


CREATE USER IF NOT EXISTS 'resultados'@'localhost'  IDENTIFIED BY '0tr4c0ntr4s3ña';
GRANT SELECT ON FormulaUno.circuitos TO 'resultados'@'localhost';
GRANT SELECT ON FormulaUno.pilotos TO 'resultados'@'localhost';
GRANT SELECT ON FormulaUno.carreras TO 'resultados'@'localhost';
GRANT DELETE, UPDATE, INSERT ON FormulaUno.resultados TO 'resultados'@'localhost';