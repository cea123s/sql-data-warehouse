/*
  ================================
  Crear Base de Datos
  ================================
  Propósito del Script:
    Crea una nueva base de datos llamada "DataWarehouse" luego de chequear si ya existe.
    Si la BBDD ya existe, es eliminada y creada de vuelta.
  
  PRECAUCIÓN:
    Al correr este script se elimina completamente la BBDD "DataWarehouse" si es que existe.
    Toda la información en la base de datos será eliminada de forma permanente. Proceder con precaución 
    y asegurarse de tener los backups necesarios antes de correr este script.
*/

USE master; -- Cambiamos a la base de datos maestra del sistema
GO

-- Si existe, dropea la BBDD "DataWarehouse" para evitar errores

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
  BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
  END
GO

-- Creamos la base de datos "DataWarehouse"
  
CREATE DATABASE DataWarehouse;
GO
  
USE DataWarehouse;
GO
  
-- Creamos el esquema de cada capa

CREATE SCHEMA bronze;
GO
  
CREATE SCHEMA silver;
GO
  
CREATE SCHEMA gold;
GO
