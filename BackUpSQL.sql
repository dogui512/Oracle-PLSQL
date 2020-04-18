/*  
// Mepryl 16-MAY-2017  
// GRV - Guido Ramírez V  
// DB: MEPRYLTest_v2.1  
// Crea una base de datos con el nro. de día al final del nombre y la extensión .bak  
*/  

DECLARE @dest nvarchar(255)  

-- Establecemos el nombre del archivo  
SET @dest = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLSERVERMEPRYL\MSSQL\Backup\Meprylv2.1_' + CAST(DATEPART(DAY, GETDATE()) AS nvarchar(2)) + '.bak'  

-- Mensaje de salida informando el proceso del backup  
PRINT ' '  
PRINT '=================================='  
PRINT CAST(GETDATE() AS nvarchar) + ' - Mepryl. Copia de seguridad iniciada al archivo: ' + @dest  
  
BACKUP DATABASE [MEPRYLTest_v2.1] TO  DISK = @dest WITH NOFORMAT, INIT,  NAME = N'MEPRYLTest_v2.1-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, NO_COMPRESSION,  STATS = 10     

declare @backupSetId as int  

select @backupSetId = position from msdb..backupset where database_name=N'MEPRYLTest_v2.1' and backup_set_id=(select max(backup_set_id) from msdb..backupset where database_name=N'MEPRYLTest_v2.1' )  

if @backupSetId is null   
begin   
    raiserror(N'Verify failed. Backup information for database ''MEPRYLTest_v2.1'' not found.', 16, 1)   
end  

RESTORE VERIFYONLY FROM  DISK = @dest WITH  FILE = @backupSetId,  NOUNLOAD,  NOREWIND  
GO
