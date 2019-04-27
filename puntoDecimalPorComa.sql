/*
/* Guido Ramírez
/* Link de referencia: https://docs.oracle.com/cd/B19306_01/server.102/b14200/functions191.htm
/* La siguiente sentencia permite cambiar el punto (.) decimal por coma (,).
*/

SELECT TO_CHAR(-10000,'L99G999D99MI',
   'NLS_NUMERIC_CHARACTERS = '',.''
   NLS_CURRENCY = ''AusDollars'' ') "Amount"
FROM DUAL;
