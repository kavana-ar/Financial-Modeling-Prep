# 📊 Apple Earnings & Stock Analysis Using Financial Modeling Prep

## Objective

In this project, I analyzed the relationship between Apple's earnings performance and its stock-price movement using historical stock market and earnings data.

The project follows an end-to-end data analysis workflow consisting of several stages:

* Extracted Apple's historical stock price and earnings data using the Financial Modeling Prep API.
* Stored the extracted data in CSV files for further processing.
* Performed data validation and quality checks using Python and Pandas.
* Loaded the cleaned datasets into a PostgreSQL database.
* Used SQL to analyze stock prices before, on, and after earnings announcements.
* Developed an interactive Power BI dashboard to visualize the results.

The main focus of this project is to understand how Apple's stock price reacts around earnings announcements and explore the relationship between EPS performance and stock-price movement.

---

## Table of Contents

- [Dataset Used](#dataset-used)
- [Technologies Used](#technologies-used)
- [Project Workflow](#project-workflow)
- [Step 1: Data Extraction](#step-1-data-extraction)
- [Step 2: Data Validation and Preparation](#step-2-data-validation-and-preparation)
- [Step 3: Data Storage](#step-3-data-storage)
- [Step 4: SQL Analysis](#step-4-sql-analysis)
- [Step 5: Power BI Dashboard](#step-5-power-bi-dashboard)
- [Project Files](#project-files)
- [Skills Demonstrated](#skills-demonstrated)
- [Project Summary](#project-summary)

---

# Dataset Used

This project uses historical stock market and earnings data for Apple (`AAPL`) obtained from the Financial Modeling Prep API.

**Data Source:** [Free Stock Market API and Financial Statements API | FMP](https://site.financialmodelingprep.com/developer/docs)

The project contains two datasets:

### 1. [Apple Stock Data](Apple Stock Data)

### 2. [Apple Earnings Data](Apple Earnings Data)

---

# Technologies Used

The following technologies were used to build this project:

* **Programming Language:** Python, SQL
* **Data Source:** Financial Modeling Prep API
* **Data Processing:** Pandas
* **Development Environment:** Jupyter Notebook
* **Database Connection:** SQLAlchemy, Psycopg2
* **Data Visualization:** Power BI

---

# Project Workflow

The project follows the workflow below:

**Financial Modeling Prep API → CSV Files → Python/Jupyter Notebook → PostgreSQL → SQL Analysis → Power BI Dashboard**

### Project Stages

* **Step 1: [Data Extraction](Data-Extraction)
* **Step 2: [Data Validation and Preparation](Data-Validation-and-Preparation)
* **Step 3: [Data Storage](Data-Storage) 
* **Step 4: [SQL Analysis](SQL-Analysis)
* **Step 5: [Dashboard](Dashboard)

---

# Step 1: Data Extraction

In this step, I used Python to extract data for Apple (`AAPL`) from the Financial Modeling Prep API.

The API responses were converted into Pandas DataFrames and saved as CSV files for further analysis.

### Output Files

* [apple_stock_data.csv](apple_stock_data.csv)
* [apple_earnings_data.csv](apple_earnings_data.csv)

---

# Step 2: Data Validation and Preparation

After extracting the data, I performed data validation and quality checks using Python and Pandas before loading the data into PostgreSQL.

## Stock Data Validation

The following checks were performed on the stock dataset:

* Checked the dataset structure.
* Reviewed column names and data types.
* Checked for missing values.
* Checked for duplicate records.
* Generated descriptive statistics.
* Checked for duplicate dates.
* Performed consistency checks on stock-price values.

## Earnings Data Validation

The following checks were performed on the earnings dataset:

* Checked the dataset structure.
* Reviewed column names and data types.
* Checked for missing values.
* Checked the availability of EPS Actual values.
* Checked the availability of EPS Estimated values.
* Checked the availability of Revenue Actual values.
* Checked the availability of Revenue Estimated values.
* Checked for duplicate records.
* Checked for duplicate earnings dates.
* Generated descriptive statistics.

After completing the validation process, the datasets were prepared for storage and analysis.

### Python File

* [FMP_python.ipynb](FMP_python.ipynb)
  
---

# Step 3: Data Storage

After completing the data validation process, I loaded the datasets into a PostgreSQL database.

The following tables were used:

### `stock_data`
### `earnings_data`

Python was used to connect to PostgreSQL and load the datasets into the database for SQL analysis.

---

# Step 4: SQL Analysis

After loading the stock and earnings data into PostgreSQL, I performed SQL analysis to examine Apple's stock-price behavior around earnings announcements.

The SQL analysis includes the following steps.

## 1. Data Exploration

First, I viewed the available data in both tables:

* `stock_data`
* `earnings_data`

I also checked the availability of:

* EPS Actual
* EPS Estimated
* Revenue Actual
* Revenue Estimated

---

## 2. Latest Four Completed Earnings Reports

Retrieved the latest four completed earnings reports from the earnings dataset.

The analysis filters completed earnings dates and orders them from the most recent to the oldest.

---

## 3. Stock Price on Each Earnings Date

Joined the [apple_stock_data.csv](apple_stock_data.csv) and [apple_earnings_data.csv](apple_earnings_data.csv) tables using the earnings date to identify Apple's closing stock price on each earnings date.

The analysis compares:

* Earnings date
* EPS Actual
* Closing stock price

---

## 4. Stock Price Three Trading Days Before Earnings

Retrieved Apple's closing stock price three trading days before each of the latest four completed earnings dates.

This helps establish the stock-price position before the earnings announcement.

---

## 5. Earnings-Day Closing Price

Retrieved Apple's closing stock price on the earnings date.

This allows the analysis to compare the stock's performance on the day of the earnings announcement.

---

## 6. Stock Price Three Trading Days After Earnings

Retrieved Apple's closing stock price three trading days after each of the latest four completed earnings dates.

This helps analyze the short-term market reaction following the earnings announcement.

---

## 7. Stock-Price Reaction Analysis

Calculated the percentage change in Apple's stock price between the period before and after earnings.

The analysis compares:

* Price before earnings
* Price on the earnings date
* Price after earnings
* Percentage change in stock price

### Formula Used

```text
Stock Price Change % =
((Price After - Price Before) / Price Before) × 100
```

This analysis helps identify whether Apple's stock price increased or decreased around each earnings announcement.

---

## 8. EPS Surprise vs. Stock-Price Reaction

Compared Apple's actual EPS with estimated EPS and analyzed the corresponding stock-price reaction.

The analysis calculates:

### EPS Surprise

```text
EPS Surprise = EPS Actual - EPS Estimated
```

### Earnings Result

The earnings performance was categorized as:

* **Beat** — EPS Actual is greater than EPS Estimated
* **Miss** — EPS Actual is lower than EPS Estimated
* **Met** — EPS Actual is equal to EPS Estimated

The analysis then compares the EPS result with the percentage change in Apple's stock price.

This helps answer the question:

**Does beating or missing EPS expectations correspond with a positive or negative stock-price reaction?**

### Sql File

* [FMP query.sql](FMP query.sql)

---

# Step 5: Power BI Dashboard

After completing the SQL analysis, I developed an interactive dashboard using Power BI.

The dashboard presents the relationship between Apple's earnings performance and stock-price movement.

The dashboard is designed to help visualize:

* Earnings dates
* Actual EPS
* Estimated EPS
* EPS surprises
* Earnings results
* Stock prices around earnings announcements
* Stock-price changes before and after earnings

### Power BI File

* [FMP_dashboard_1.pbix](FMP_dashboard_1.pbix)

---

# Project Files

The repository contains the following files:

| File                      | Description                                                           |
| ------------------------- | --------------------------------------------------------------------- |
| [apple_stock_data.csv](apple_stock_data.csv) | Raw historical Apple stock data                                       |
| [apple_earnings_data.csv](apple_earnings_data.csv) | Raw Apple earnings data                                               |
| [FMP_python.ipynb](FMP_python.ipynb)        | Python notebook for data extraction, validation, and database loading |
| [FMP query.sql](FMP query.sql)           | SQL queries for earnings and stock-price analysis                     |
| [FMP_dashboard_1.pbix](FMP_dashboard_1.pbix)    | Interactive Power BI dashboard                                        |
| [README.md](README.md)               | Project documentation                                                 |

---

# Skills Demonstrated

This project demonstrates the following skills:

* API Data Extraction
* Data Collection
* Data Validation
* Data Cleaning
* Data Quality Checks
* Python
* Pandas
* Jupyter Notebook
* PostgreSQL
* Database Management
* SQL
* Data Analysis
* Power BI
* Data Visualization
* Financial Data Analysis

---

## Project Summary

This project demonstrates an end-to-end data analytics workflow, starting with extracting financial data from an API and ending with interactive data visualization.

**Financial Modeling Prep API → Python → Data Validation → CSV → PostgreSQL → SQL Analysis → Power BI**

The project combines Python, SQL, PostgreSQL, and Power BI to analyze how Apple's stock price changes around earnings announcements and explore the relationship between earnings performance and market reaction.
