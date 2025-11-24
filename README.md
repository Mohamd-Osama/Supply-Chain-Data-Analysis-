<img width="1370" height="773" alt="image" src="https://github.com/user-attachments/assets/3b5fa33d-a852-4cf6-b01b-863df2344836" /># 📦 Supply Chain & Sales Data Analysis (Wide World Importers)
<img width="1367" height="774" alt="image" src="https://github.com/user-attachments/assets/919af3df-dba4-4899-a8d3-21680333e0bb" />

## 🔍 Project Overview
This project explores sales, inventory, and customer performance insights using the **Wide World Importers** dataset.
I designed **ETL pipelines** to clean, transform, and model data, creating new analytical tables such as Customer Behavior, Stock Item Performance, Salesperson Performance, and Trend Overtime.
The final output was a set of interactive **Power BI dashboards** that deliver actionable insights for sales, inventory, and supplier management.

## 🧹 Data Cleaning & ETL
* Built **ETL pipelines** using **SQL Server & SSIS** to integrate and clean raw warehouse data.
* Resolved inconsistencies in customer, supplier, and product data.
* Handled missing values and duplicate transactions.
* Created staging tables for efficient analysis.

## 🔄 Data Transformation & Modelling
* Designed **star schema models** linking sales, customers, stock items, and employees.
* Built calculated measures (e.g., profit ratio, sales growth, stock efficiency).
* Developed analytical tables for **customer segmentation**, **stock performance**, and **sales trends**.

## 📊 Dashboards & Analysis
* **Customer Behaviour Dashboard**: Identified top customers, loyalty trends, and low-profit accounts.
* **Stock Item Performance**: Highlighted best-selling and least-profitable products.
* **Salesperson Performance**: Compared team efficiency, revealing over-reliance on top performers.
* **Trend Analysis Dashboard**: Showed sales and profit patterns over time, including seasonal trends.

## 💡 Key Insights
* 📉 **Profit Trend**: Profits peaked in **2015 ($27M)** but dropped sharply in **2016 ($11M)**, indicating operational or market issues.
* 👥 **Sales Risks**: A few salespeople generated the majority of profit → risk of over-dependence.
* 📦 **Product Strategy**: Seasonal products (e.g., Halloween items) led to financial losses due to poor demand forecasting. High-margin packaging items (e.g., bubble wrap, tapes) are the most profitable.
* 🏭 **Supplier Risk**: Supplier dependency is heavily skewed towards **Fabrikam**, increasing supply chain risk.

## 📌 Recommendations
* **Diversify Sales Performance**: Train underperforming staff to reduce reliance on top performers.
* **Optimize Product Portfolio**: Promote high-margin items and discontinue loss-making seasonal products.
* **Customer Focus**: Focus on high-value customers while reviewing unprofitable ones.
* **Supply Chain**: Reduce supplier dependency and consolidate low-value suppliers.
* **Planning**: Plan inventory and staffing based on seasonal sales peaks (Jan, Mar, Dec).

## 🛠 Tools & Skills Used
* **SQL Server & SSIS**: ETL, data cleaning, and pipeline automation.
* **Power BI**: Data visualization, DAX measures, dashboards.
* **Data Modelling**: Star schema, relational mapping.
* **Feature Engineering**: Customer segmentation, product profitability metrics.
* **Business Analysis**: Supply chain, sales performance, customer retention.

## 📂 Project Structure
* `Data Pill Project.pbix`: The main Power BI Dashboard file.
* `ETL Queries.sql`: SQL scripts used for data extraction and transformation.
* `Documentation.docx`: Detailed project

