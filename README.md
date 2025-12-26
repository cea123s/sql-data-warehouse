# Data Warehouse con SQL

## Descripción General del Proyecto

Este repositorio muestra el diseño y desarrollo de un data warehouse moderno utilizando Microsoft SQL Server para consolidar la información de ventas, permitiendo la generación de informes analíticos y la toma de decisiones informadas.

1. **Arquitectura de Datos Medallion**: Capas **Bronze**, **Silver** y **Gold**.
2. **Pipelines ETL**: Extracción, transformación y carga de datos desde los sistemas de origen hacia el almacén.
3. **Modelado de Datos**: Desarrollo de tablas de hechos y dimensiones optimizadas para consultas analíticas.
4. **Analítica e Informes**: Creación de informes basados en SQL y tableros para obtener información estratégica.

#### Especificaciones
-**Origen de los Datos**: Se importan los datos de dos sistemas (ERP y CRM) provistos como archivos _.csv_.
-**Calidad de los Datos**: Limpieza y resolución de problemas relacionados a la calidad de los datos antes del análisis.
-**Integración**: Combinar ambas fuentes en un único, y simple modelo de datos diseñado para realizar consultas analíticas.
-**Alcance**: Se concentra en el dataset más nuevo posible; la historización de los datos no es requerida.
-**Documentación**: Proveer documentación clara del modelo de datos para apoyar tanto al equipo de análisis como a los _stakeholders_.

---
## Arquitectura de Datos

Este proyecto sigue la Arquitectura Medallion con las capas **Bronze**, **Silver** y **Gold**:
![Arquitectura de Datos](docs/data_architecture.png)

1. **Capa Bronze**: Almacena los datos brutos tal cual provienen de los sistemas de origen. Los datos se cargan desde archivos _.csv_ a una base de datos en SQL Server.
2. **Capa Silver**: Esta capa incluye procesos de limpieza, estandarización y normalización de datos para prepararlos para el análisis.
3. **Capa Gold**: Alberga los datos listos para el negocio, modelados en un esquema de estrella necesario para informes y analítica.
---

#### Técnicas y Métodos

**Extracción**:
-Método de Extracción: Pull Extraction
-Tipo de Extracción: Full Extraction
-Técnica de Extracción: File Parsing

**Transformaciones y Limpieza**:
-Eliminación de duplicados
-Filtración de datos
-Manejo de valores faltantes o iválidos
-Manejo de espacios no deseados
-Casteo de datos
-Detección de _outliers_
-Enriquecimiento de datos
-Integración de datos
-Derivación de Columnas
-Normalización y Estandarización
-Reglas y lógica del negocio
-Agregaciones

**Carga**:
Tipo de procesamiento: Batch Processing
Método de Carga: Full Load - Truncate & Insert
Slowly Changing Dimensiones: SCD 1 (Overwrite)

---

### BI: Analítica y Reportes (Análisis de Datos)

#### Objetivo
Desarrolar un análisis basado en SQL para entregar insights detallados sobre:
-**Comportamiento del Cliente**
-**Performance del Producto**
-**Tendencias en las Ventas**

Estos insights proveen a los _stakeholders_ con métricas claves del negocio, habilitando la toma de decisiones estratégicas.

---

## Estructura del Repositorio
```
sql-data-warehouse/
│
├── datasets/                           # Datasets en bruto utilizados para el proyecto (ERP y CRM).
│
├── docs/                               # Documentación del proyecto y detalles de su arquitectura
│   ├── data_architecture.drawio        # Arquitectura del Data Warehouse
│   ├── data_catalog.md                 # Catálogo del dataset con descripción de cada campo
│   ├── data_flow.drawio                # Diagrama de flujo de datos
│   ├── data_models.drawio              # Diagrama del modelo de datos
│   ├── naming-conventions.md           # Convenciones utilizadas para nombrar tablas, columnas y archivos
│
├── scripts/                            # Scripts en SQL
│   ├── bronze/                         # Scripts para extraer y cargar los datos en bruto
│   ├── silver/                         # Scripts para limpiar y transformar los datos
│   ├── gold/                           # Scripts para crear un modelo analítico de datos
│
├── tests/                              # Scripts para realizar test y asegurar la calida de los datos
│
├── README.md                           # Descripción del proyecto
├── LICENSE                             # Información sobre la licencia del repositorio
├── .gitignore                          # Archivos y directorios para ser ignorados por Git
└── requirements.txt                    # Dependencias y Requerimientos del proyecto
```

## Licencia
Este proyecto se encuentra bajo la licencia [MIT License](https://opensource.org/license/mit).

## Acerca de mí
Me llamo Cristian Añon. Soy Licenciado en Artes Electrónicas, y me gusta combinar la rigurosidad técnica con la creativad y el diseño. Me apasionan la tecnología, la acústica y la creación de soluciones a problemas reales. 
