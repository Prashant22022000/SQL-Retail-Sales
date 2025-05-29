# SQL-Retail-Sales
📊 Retail Sales Analysis – SQL Project

This project focuses on analyzing retail sales data using SQL to extract business insights and improve decision-making. It involves data cleaning, exploratory analysis, and answering real-world business questions.
🗃️ Dataset

The dataset contains transactional sales data with the following columns:

    transactions_id

    sale_date

    sale_time

    customer_id

    gender

    age

    category (e.g., Clothing, Beauty)

    quantiy

    price_per_unit

    cogs

    total_sale

    Source: SQL - Retail Sales Analysis_utf.csv

⚙️ Project Setup

    Create the Database:

CREATE DATABASE Project_1;

    Create and Populate the Table:
    Use the script in script.sql to create the retail_sales table and perform data cleaning and analysis.

    Run SQL Queries:
    Open a SQL editor (e.g., pgAdmin, MySQL Workbench, DBeaver) and run the queries in script.sql.

📌 Key SQL Tasks & Analyses

    Data Cleaning:

        Handle NULL values by replacing or removing incomplete records.

        Update missing age values with the average age (41).

    Exploratory Analysis:

        Total sales and orders.

        Count of unique customers.

        Category-wise data distribution.

    Business Questions Answered:

        Sales on specific date (e.g., 2022-11-05)

        Clothing items sold in bulk (quantity > 4 in November 2022)

        Total sales and order count per category

        Average age of Beauty category customers

        High-value sales (total_sale > 1000)

        Gender and category-wise order distribution

        Best-selling month by year based on average sales

        Top 5 customers by sales

        Number of unique customers per category

        Sales shift classification: Morning, Afternoon, Evening

📈 Sample Insights

    Best-Selling Category: Determined using total sales.

    Top Customers: Identified based on cumulative total_sale.

    Sales Shifts: Morning (<12 PM), Afternoon (12–5 PM), Evening (>5 PM).

    Seasonality: Best-performing month per year discovered using RANK().

📂 Repository Structure

.
├── script.sql                         # SQL script with schema, cleaning, and analysis queries
├── SQL - Retail Sales Analysis_utf.csv  # Source data (transactional sales)
└── README.md                         # Project overview and instructions

🧰 Tools & Technologies

    SQL (PostgreSQL/compatible RDBMS)

    Relational Database Management

    Data Cleaning & Transformation

    Analytical SQL (Window Functions, Aggregations)

✅ Conclusion

This project demonstrates how to extract meaningful business insights using SQL from raw transactional data. It is suitable for those learning SQL for analytics, business intelligence, or data science roles.
