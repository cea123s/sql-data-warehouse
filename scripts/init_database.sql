*/
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

-- Dropea la BBDD "DataWarehouse" para evitar errores

DROP DATABASE IF EXISTS DataWarehouse;

-- Creamos la base de datos "DataWarehouse"
  
CREATE DATABASE DataWarehouse;
USE DataWarehouse;
