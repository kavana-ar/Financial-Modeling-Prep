# 📊 Apple Earnings & Stock Analysis Using Financial Modeling Prep

## Objective

In this project, I analyzed how Apple’s earnings performance is related to its stock price movement using historical stock and earnings data.

The project follows an end-to-end data analysis process:

* Collected Apple’s historical stock price and earnings data using the Financial Modeling Prep API.
* Stored the data in CSV files.
* Cleaned and checked the data using Python and Pandas.
* Loaded the cleaned data into PostgreSQL.
* Used SQL to analyze stock prices before, during, and after earnings announcements.
* Created an interactive Power BI dashboard to present the findings.

## Table of Contents

- [Data Source](#data-Source)
- [Technologies](#technologies)
- [Data Pipeline Architecture](#Data-Pipeline-Architecture)
- [Step 1: Data Extraction](#step-1-data-extraction)
- [Step 2: Data Validation and Preparation](#step-2-data-validation-and-preparation)
- [Step 3: Data Storage](#step-3-data-storage)
- [Step 4: SQL Analysis](#step-4-sql-analysis)
- [Step 5: Power BI Dashboard](#step-5-power-bi-dashboard)


## Data Source

This project uses historical stock market and earnings data for Apple (`AAPL`) obtained from the Financial Modeling Prep API.

**Data Source:** [Free Stock Market API and Financial Statements API | FMP](https://site.financialmodelingprep.com/developer/docs)

The project contains two datasets:

### 1. [Apple Stock Data](https://site.financialmodelingprep.com/developer/docs/stable/historical-price-eod-full)

### 2. [Apple Earnings Data](https://site.financialmodelingprep.com/developer/docs#earnings-company)


## Technologies

The following technologies were used to build this project:

* **Programming Language:** Python, SQL
* **Data Source:** Financial Modeling Prep API
* **Data Processing:** Pandas
* **Development Environment:** Jupyter Notebook
* **Database Connection:** SQLAlchemy, Psycopg2
* **Data Visualization:** Power BI


## Data Pipeline Architecture

The project follows the workflow below:

<img width="1665" height="836" alt="ChatGPT Image Aug 30, 2026, 02_00_29 PM" src="https://github.com/user-attachments/assets/3ae45b51-f7d3-47a2-98cf-616cee28b539" />

Files in the following stages:

* Step 1: [Data Extraction](#step-1-data-extraction)
* Step 2: [Data Validation and Preparation](#step-2-data-validation-and-preparation)
* Step 3: [Data Storage](#step-3-data-storage) 
* Step 4: [SQL Analysis](#step-4-sql-analysis)
* Step 5: [Dashboard](#step-5-power-bi-dashboard)


## Step 1: Data Extraction

In this step, I used Jupyter Notebook to extract data for Apple (`AAPL`) from the Financial Modeling Prep API.

The API responses were converted into Pandas DataFrames and saved as CSV files for further analysis.

Link to the script: [apple_stock_data.csv](apple_stock_data.csv) and [apple_earnings_data.csv](apple_earnings_data.csv)

<img width="1313" height="638" alt="Screenshot 2026-08-30 121859" src="https://github.com/user-attachments/assets/04bf4f2b-9d28-41db-be86-9f47a019fa45" />
<img width="1261" height="533" alt="Screenshot 2026-08-30 121933" src="https://github.com/user-attachments/assets/f90a2d94-c50e-4d64-b8b3-49eda6f5276c" />


## Step 2: Data Validation and Preparation

After extracting the data, I performed data validation and quality checks using Python and Pandas before loading the data into PostgreSQL.  

Link to the script: [python-checkpoint.ipynb](https://github.com/kavana-ar/Financial-Modeling-Prep/blob/main/FMP_python-checkpoint.ipynb)

### Stock Data Validation

<img width="1243" height="536" alt="Screenshot 2026-08-30 132818" src="https://github.com/user-attachments/assets/d34039e2-e877-4993-b0bd-cc750b0aaf70" />
<img width="1228" height="536" alt="Screenshot 2026-08-30 133114" src="https://github.com/user-attachments/assets/dec9de85-9075-4ec5-b56e-c111ccf5d9d3" />

### Earnings Data Validation

<img width="1236" height="534" alt="Screenshot 2026-08-30 132845" src="https://github.com/user-attachments/assets/7c216d05-f4f4-4911-a819-4e4b4a2e497f" />
<img width="1232" height="490" alt="Screenshot 2026-08-30 133214" src="https://github.com/user-attachments/assets/3bad1206-2f7a-4f16-8d35-d2ad23be7760" />

After completing the validation process, the datasets were prepared for storage and analysis.


## Step 3: Data Storage

After completing the data validation process, I loaded the datasets into a PostgreSQL database.

<img width="1197" height="535" alt="Screenshot 2026-08-30 122250" src="https://github.com/user-attachments/assets/e992c9c8-e863-428a-b4ea-03e17466b433" />
<img width="1198" height="492" alt="Screenshot 2026-08-30 122307" src="https://github.com/user-attachments/assets/ff17529c-034a-41e7-9107-adebcea54111" />

Python was used to connect to PostgreSQL and load the datasets into the database for SQL analysis.


## Step 4: SQL Analysis

After loading the stock and earnings data into PostgreSQL, I performed SQL analysis to examine Apple's stock-price behavior around earnings announcements.

Link to the script: [query.sql](https://github.com/kavana-ar/Financial-Modeling-Prep/blob/main/FMP%20query.sql)

The SQL analysis includes the following steps.

## 1. Data Exploration

First, I viewed the available data in both tables:

<img width="1307" height="615" alt="Screenshot 2026-08-30 122932" src="https://github.com/user-attachments/assets/331bfecf-1772-4a3d-95a2-d5b5ac1122a8" />


## 2. Latest Four Completed Earnings Reports
<img width="1055" height="533" alt="Screenshot 2026-08-30 123903" src="https://github.com/user-attachments/assets/0153c5ca-a784-4cb0-831f-64de4677c39b" />


## 3. Stock Price on Each Earnings Date
<img width="1062" height="531" alt="Screenshot 2026-08-30 123934" src="https://github.com/user-attachments/assets/82cd0193-f05f-4523-a668-e5e3f01a700c" />


## 4. Stock Price Three Trading Days Before Earnings
<img width="1053" height="535" alt="Screenshot 2026-08-30 124028" src="https://github.com/user-attachments/assets/231d5b63-8c8c-4ca0-addc-e7e4f12b6ec1" />


## 5. Earnings-Day Closing Price
<img width="1066" height="548" alt="Screenshot 2026-08-30 124108" src="https://github.com/user-attachments/assets/ebc7fdb1-291f-4173-b06f-d4d0db6742cb" />


## Step 5: Power BI Dashboard

After completing the SQL analysis, I developed an interactive dashboard using Power BI. which you can view [here](https://github.com/kavana-ar/Financial-Modeling-Prep/blob/main/FMP_dashboard%20_1.pbix)

<img width="1358" height="656" alt="Screenshot 2026-08-30 125016" src="https://github.com/user-attachments/assets/3cef372d-850f-4441-be83-2959233e2426" />
<img width="1346" height="501" alt="Screenshot 2026-08-30 125042" src="https://github.com/user-attachments/assets/a09dede3-b832-422c-aa23-5829ea971a63" />




