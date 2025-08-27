**Description**

This project focuses on analyzing customer churn for a credit card company. The goal was to identify key factors that influence attrition (customer churn) and provide insights
to improve retention strategies. We studied churn rate across different dimensions such as gender, age, tenure, card type and also analyzed behavioral metrics like 
average balance, utilization ratio, overall churn percentage and complaint frequency. By analyzing these factors, the management team can identify high-risk customer segments, design retention
campaigns, and improve customer engagement strategies.

**Setup:**

We used Google Cloud Platform (GCP), Big Query (SQL Queries) and Data Studio to process and visualize the data.

**Steps Followed:**

**1. Dataset Ingestion to Google Cloud Storage**

   - Downloaded the "Credit Card customers" dataset from Kaggle.
   - Created a GCS Bucket to store our raw data file.
   - Uploaded our CSV file i.e. BankChurners.csv
   - The file contains customer demographics, account details, transaction behavior, and attrition status for credit card users to analyze churn patterns.

**2. Importing Dataset to Big Query (Creating Dataset and Tables)**

   - Created a Big Query Dataset "churn_analysis" to store our Credit Card Customer data.
   - Imported the CSV file into a Big Query Table "credit_card_churn" while ensuring proper schema mapping.

**3. Wrote the following SQL Queries:**
     
        1. Overall Churn Rate (What % of customers have churned)
        2. Comparing Financial behaviour of Churned vs Retained Customers
        3. Churn By Demographics (By Age,Gender,Income)
        4. Churn By Tenure (Does churn happen with new or long-tenured customers?)
        5. Churn by Complaint/Contact Frequency (To check if frequent bank contact signals dissatisfaction.)
        6. Churn By Card Type (To check if certain card categories have higher attrition)

👉 Click Here to View all queries: [https://github.com/BhavyaMehndiratta26/Credit-Card-Churn-Analysis/blob/7e15a2108e9834a76993dde5a69ab21d6b3ca992/churnAnalysisCreditCard.sql]

**4. Building Dashboard in Data Studio:**

   - Connected Big Query to Data Studio.
   - We used Custom Queries to streamline the linking process with Data Studio.
   - Added scorecards for key KPIs (Total Customers, Churned Customers, Churn %, Avg Balance).
   - Added charts and trends for churn segmentation (gender, tenure, card type, monthly trend, complaints).
   - Designed a clean, interactive dashboard for stakeholders.

Note: Although it is possible to connect each table individually from the Big Query project to Data Studio, this method is slower and less efficient. 
Another approach is to create views in Big Query for each analysis and then connect those views to Data Studio. However, the most efficient method we implemented was 
using custom queries directly in Data Studio, which allowed faster integration and reduced complexity.

**Final Dashboard**

![image alt](https://github.com/BhavyaMehndiratta26/Credit-Card-Churn-Analysis/blob/3f6261d141c02622bee96f884fdb8a2b8017d210/Churn_Analysis_Dashboard.jpg)

The final dashboard provides a holistic view of credit card customer churn, highlighting overall churn rate, customer distribution across gender, tenure, card categories, and the impact of customer complaints. It enables quick identification of churn patterns and areas of customer dissatisfaction, while allowing management to interact with data and make informed decisions
