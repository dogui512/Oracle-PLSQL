/*
/* Guido Ramírez
/* Link de referencia: https://docs.oracle.com/cd/B19306_01/server.102/b14200/functions191.htm
*/

SELECT TO_CHAR(-10000,'L99G999D99MI',
   'NLS_NUMERIC_CHARACTERS = '',.''
   NLS_CURRENCY = ''AusDollars'' ') "Amount"
FROM DUAL;
