# Data Warehouse con SQL

Diseño y desarrollo de un data warehouse moderno utilizando **Microsoft SQL Server** para consolidar la información de ventas, permitir la generación de informes analíticos, y la toma de decisiones informadas.
Se utilizaron datasets provenientes de sistemas ERP y CRM de un negocio de productos de ciclismo.

## Arquitectura de Datos

Este proyecto sigue la [Arquitectura Medallion](https://learn.microsoft.com/en-us/azure/databricks/lakehouse/medallion) con las capas **Bronze**, **Silver** y **Gold**:

![Arquitectura de Datos](docs/dwh_architecture.png)

1. **Capa Bronze**: Almacenamiento de los datos en bruto tal cual provienen de los sistemas de origen.
2. **Capa Silver**: Procesos de limpieza, estandarización y normalización de datos para el análisis.
3. **Capa Gold**: Alberga los datos listos para el negocio, modelados en un esquema de estrella útil para informes y analítica.

---

#### Información General

1. **Arquitectura de Datos**: Arquitectura Medallion con capas **Bronze**, **Silver** y **Gold**.
2. **Pipelines ETL**: Métodos de extracción, transformación y carga de datos desde los sistemas de origen hacia el almacén.
3. **Modelado de Datos**: Desarrollo de tablas de hechos y dimensiones optimizadas para consultas analíticas.
4. **Analítica e Informes**: Creación de informes basados en SQL y tableros para obtener información estratégica.

#### Especificaciones

* **Origen de los Datos**: Se importan los datos de dos sistemas (ERP y CRM) provistos como archivos _.csv_.
* **Calidad de los Datos**: Limpieza y resolución de problemas relacionados a la calidad de los datos.
* **Integración**: Combinar ambas fuentes en un único y simple modelo de datos, diseñado para realizar consultas analíticas.
* **Alcance**: Se concentra en el dataset más nuevo posibl; la historización de los datos no es requerida.
* **Documentación**: Proveer documentación clara del modelo de datos para apoyar tanto al equipo de análisis como a los _stakeholders_.

---

#### Técnicas y Métodos

**Extracción**:
* Método de Extracción: Pull Extraction
* Tipo de Extracción: Full Extraction
* Técnica de Extracción: File Parsing

**Transformaciones y Limpieza**:
* Eliminación de duplicados
* Filtración de datos
* Manejo de valores faltantes o iválidos
* Manejo de espacios no deseados
* Casteo de datos
* Detección de _outliers_
* Enriquecimiento de datos
* Integración de datos
* Derivación de Columnas
* Normalización y Estandarización
* Reglas y lógica del negocio
* Agregaciones

**Carga**:
* Tipo de procesamiento: Batch Processing
* Método de Carga: Full Load - Truncate & Insert
* Slowly Changing Dimensiones: SCD 1 (Overwrite)

---
## Flujo de Datos

![flujo_de_datos](docs/data_flow.png)

---
## Modelo de Integración

![integration_model](docs/integration_model.png)

---
## Modelo Estrella (data mart)

![data_mart](docs/data_mart.png)

---

## Implementación: de forma local o en servidor externo

1. Ejecutar _init_database.sql_ para crear la base de datos junto con los esquemas bronze, silver y gold
2. Ejecutar _ddl_bronze.sql_ para crear y definir las tablas del esquema bronze.
3. Ejectuar _proc_load_bronze.sql_ para crear el procedimiento almacenado que carga los datos en bruto desde los archivos _.csv_.
4. Ejectuar el procedimiento con EXECUTE proc_load_bronze para poblar el esquema bronze.
5. Ejecutar _ddl_silver.sql_ para crear y definir las tablas del esquema silver.
6. Ejectuar _proc_load_silver.sql_ para crear el procedimiento almacenado que carga los datos limpios y validados en el esquema silver.
7. Ejecutar el procedimiento con EXECUTE proc_load_silver para poblar el esquema silver.
8. Ejectuar _ddl_gold.sql_ para crear y cargar las vistas de la capa gold.
9. Hacer consultas directamente a las tablas de las vistas de la capa gold.

---
## Estructura del Repositorio
```
sql-data-warehouse/
│
├── datasets/                           # Datasets en bruto utilizados para el proyecto (ERP y CRM).
│
├── docs/                               # Documentación del proyecto y detalles de su arquitectura
│   ├── data_architecture.png           # Arquitectura del Data Warehouse
│   ├── data_catalog.md                 # Catálogo del dataset con descripción de cada campo
│   ├── data_flow.png                   # Diagrama de flujo de datos
│   ├── data_models.png                 # Diagrama del modelo de datos
│   ├── naming-conventions.md           # Convenciones utilizadas para nombrar tablas, columnas y archivos
│
├── scripts/                            # Scripts en SQL
│   ├── bronze/                         # Scripts para extraer y cargar los datos en bruto
│       ├── ddl_bronze.sql              # Crea y define todas las tablas del esquema bronze
│       ├── proc_load_bronze.sql        # Procedimiento Almacenado para cargar los datos crudos
│   ├── silver/                         # Scripts para limpiar y transformar los datos
│       ├── ddl_silver.sql              # Crea y define todas las tablas del esquema silver
│       ├── proc_load_silver.sql        # Procedimiento Almacenado para poblar el esquema silver con los datos limpios 
│   ├── gold/                           # Scripts para crear un modelo analítico de datos
│       ├── ddl_golds.sql               # Crea y define todas las vistas de la capa gold
│
├── tests/                              # Scripts para realizar test y asegurar la calidad de los datos
│
├── README.md                           # Descripción del proyecto
└── LICENSE                             # Información sobre la licencia del repositorio
```

## Licencia
Este proyecto se encuentra bajo la licencia [MIT License](https://opensource.org/license/mit).

## Acerca de mí
Me llamo Cristian Añon. Soy Licenciado en Artes Electrónicas, y me gusta combinar la rigurosidad técnica con la creativad y el diseño. Me apasionan la tecnología, la acústica y la creación de soluciones a problemas reales.

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/ceanon)
