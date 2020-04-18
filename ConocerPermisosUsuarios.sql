SELECT 'Login: ' + SYSTEM_USER AS Login_Usuario 
  
SELECT permission_name AS 'Permisos a nivel de servidor:' 

FROM fn_my_permissions(NULL, 'SERVER') 

DECLARE @Texto AS NVARCHAR(MAX) 

SET @Texto = ' 
USE [?] 
IF((SELECT COUNT(1) FROM sys.database_principals WHERE name = CURRENT_USER)>0) 
BEGIN 
      BEGIN TRY 
            SELECT permission_name AS ''Permisos a nivel de BD (?):'' 
            FROM fn_my_permissions(NULL, ''DATABASE'') 
      END TRY 
      BEGIN CATCH 
            SELECT ''Ocurrió un error: '' + ERROR_MESSAGE() AS ''Permisos a nivel de BD (?):'' 
      END CATCH 
END' 
 
--EXEC master.sys.sp_MSforeachdb @Texto 
