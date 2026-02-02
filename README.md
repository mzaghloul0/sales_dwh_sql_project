# sales_dwh_sql_project

Dieses Repository dokumentiert den Aufbau eines **Sales Data Warehouse** mit **PostgreSQL**, inklusive **ETL-Pipelines**, **Datenmodellierung** und **analytischen Schichten** nach der **Medallion Architecture** (Bronze / Silver / Gold).

Die verwendeten Rohdaten stammen aus einem öffentlich verfügbaren CRM-Sales-Dataset von Kaggle:  
https://www.kaggle.com/datasets/innocentmfa/crm-sales-opportunities

---
## Zweck

Dieses Projekt dient als Praxis-Projekt zur Übung von DWH-Design, ETL-Entwicklung und BI-Analyse anhand eines realistischen CRM-Datensatzes.

---

## Projektziele

- Laden von Rohdaten in ein relationales Data Warehouse  
- Transformation und Bereinigung der Daten  
- Aufbau von Dimensionen und Faktentabellen  
- Entwicklung analytischer Modelle für Reporting  
- Umsetzung moderner DWH-Best-Practices  

---

## Technologien

- PostgreSQL  
- SQL  
- Python (ETL)  
- Tableau  
- GitHub  

---

## Architektur

Das Projekt folgt einer mehrschichtigen DWH-Struktur:

- **Bronze:** Rohdaten aus den Quellsystemen  
- **Silver:** bereinigte und integrierte Tabellen  
- **Gold:** Business-Metriken und Analysemodelle  

