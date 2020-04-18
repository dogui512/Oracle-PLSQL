--Verifica si existe una tabla.-  

-- Si la tabla existe la borra 
IF OBJECT_ID('dbo.Test', 'U') IS NOT NULL 
    DROP TABLE dbo.Test;  
GO  

-- Crea la tabla 
CREATE TABLE dbo.Test  
( 
    Id INT 
); 
GO 

--Tabla temporal.-  

-- Si la tabla existe la borra 
IF OBJECT_ID('tempdb..#Test', 'U') IS NOT NULL 
    DROP TABLE #Test;  
GO  

--Verifica si existe un procedimiento almacenado.-  

-- Si el SP existe lo borra 
IF OBJECT_ID('dbo.Insert_Test', 'P') IS NOT NULL 
DROP PROCEDURE dbo.Insert_Test; 
GO 
 

-- Crea el SP 
CREATE PROCEDURE dbo.Insert_Test 
AS 
BEGIN 
    SELECT 1; 
END 
GO 
