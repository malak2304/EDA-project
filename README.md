Sure Malak ❤️
Here is the full **README.md in English**, clean, professional, and ready to upload on GitHub — including the folder tree and a mention of the **gold_layer** folder where your cleaned data is stored.

---

# 📘 **EDA SQL Project – Customer & Product Sales Analysis**

This project contains a complete **Exploratory Data Analysis (EDA)** using **pure SQL**, without performing any data cleaning inside the project.
All data was pre-cleaned and uploaded in a separate folder:

👉 **[`gold_layer`](../gold_layer/)**
*This is the main data source used in all SQL analysis files.*

---

## 📂 **Project Structure**

```
EDA-project/
│
├── gold_layer/                 # Cleaned and transformed data source
│
├── sql/
│   ├── 01_database_exploration.sql
│   ├── 02_dimensions_exploration.sql
│   ├── 03_date_exploration.sql
│   ├── 04_measures_exploration.sql
│   ├── 05_magnitude_analysis.sql
│   ├── 06_ranking_analysis.sql
│   ├── 07_change_over_time_analysis.sql
│   ├── 08_cumulative_analysis.sql
│   ├── 09_performance_analysis.sql
│   ├── 10_part_to_whole_analysis.sql
│   ├── 11_data_segmentation.sql
│   ├── 12_reporting_customers.sql
│   └── 13_reporting_products.sql
│
└── README.md
```

---

## 📌 **Description of SQL Files**

### **01_database_exploration.sql**

Explores all tables and columns in the database.

### **02_dimensions_exploration.sql**

Analysis of dimension tables such as country, category, subcategory.

### **03_date_exploration.sql**

Date-related insights including:

* First and last order
* Customer age range
* Order timeline

### **04_measures_exploration.sql**

Core KPIs:

* Total revenue
* Total quantity
* Total orders
* Avg order value
* Avg price per product

### **05_magnitude_analysis.sql**

Magnitude analysis grouped by:
country, category, gender, product.

### **06_ranking_analysis.sql**

Ranking products and customers (top performance, low performance).

### **07_change_over_time_analysis.sql**

Year-over-year change in: revenue, customers, order count.

### **08_cumulative_analysis.sql**

Running totals and moving averages.

### **09_performance_analysis.sql**

YOY performance metrics and KPI trends.

### **10_part_to_whole_analysis.sql**

Percentage contributions to total sales (categories, subcategories).

### **11_data_segmentation.sql**

Customer and product segmentation (VIP, low-value, cost bands).

### **12_reporting_customers.sql**

Analytical reporting view for customer performance.

### **13_reporting_products.sql**

Analytical reporting view for product performance.

---

## 📈 **Purpose of the Project**

The goal of this project is to perform a **full EDA using SQL only**, relying on a well-prepared Data Warehouse layer (Gold Layer).
The analysis provides insights about:

* Customer behavior
* Product performance
* Sales trends
* Profitability metrics
* Customer segmentation
* Best & worst performing products

---

## 📝 **Notes**

* The database structure follows a **Star Schema**-like design.
* All analysis is based solely on the **gold_layer** dataset.
* No cleaning or transformation is performed inside the SQL scripts.

