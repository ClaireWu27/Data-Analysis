# Bank Loan Report

## Problem Statement

In order to monitor and assess our bank's lending activities and performance, we need to create a comprehensive **Bank Loan Report**. This report aims to provide insights into key loan-related metrics and their changes over time. The report will help us make data-driven decisions, track our loan portfolio's health, and identify trends that can inform our lending strategies.

---

## Dashboard 1: Summary

![summary](./report%20image/summary.png)

### Key Performance Indicators (KPIs) Requirements:

1. **Total Loan Applications**:

   - Calculate the total number of loan applications received during a specified period.
   - Monitor Month-to-Date (MTD) Loan Applications and track Month-over-Month (MoM) changes.

2. **Total Funded Amount**:

   - Track the total amount of funds disbursed as loans.
   - Monitor MTD Total Funded Amount and analyse MoM changes.

3. **Total Amount Received**:

   - Track the total amount received from borrowers to assess cash flow and loan repayment.
   - Analyse MTD Total Amount Received and MoM changes.

4. **Average Interest Rate**:

   - Calculate the average interest rate across all loans, MTD, and monitor MoM variations.

5. **Average Debt-to-Income Ratio (DTI)**:
   - Evaluate the average DTI for borrowers and compute MTD and MoM fluctuations.

### Good Loan vs. Bad Loan KPIs

#### Good Loan KPIs:

1. **Good Loan Application Percentage**:

   - Calculate the percentage of loan applications classified as 'Good Loans' (status: 'Fully Paid' and 'Current').

2. **Good Loan Applications**:

   - Identify the total number of loan applications under 'Good Loan' category (status: 'Fully Paid' and 'Current').

3. **Good Loan Funded Amount**:

   - Determine the total amount disbursed as 'Good Loans' (status: 'Fully Paid' and 'Current').

4. **Good Loan Total Received Amount**:
   - Track the total amount received from borrowers for 'Good Loans' (status: 'Fully Paid' and 'Current').

#### Bad Loan KPIs:

1. **Bad Loan Application Percentage**:

   - Calculate the percentage of loan applications categorized as 'Bad Loans' (status: 'Charged Off').

2. **Bad Loan Applications**:

   - Identify the total number of loan applications categorized as 'Bad Loans' (status: 'Charged Off').

3. **Bad Loan Funded Amount**:

   - Determine the total amount disbursed as 'Bad Loans' (status: 'Charged Off').

4. **Bad Loan Total Received Amount**:
   - Track the total amount received from borrowers for 'Bad Loans' (status: 'Charged Off').

### Loan Status Grid View

Create a grid view report categorized by **Loan Status** to analyse metrics such as:

- Total Loan Applications
- Total Funded Amount
- Total Amount Received
- Month-to-Date (MTD) Funded Amount
- MTD Amount Received
- Average Interest Rate
- Average Debt-to-Income Ratio (DTI)

This report provides insights to assess the health of our loan portfolio.

---

## Dashboard 2: Overview

![summary](./report%20image/overview.png)

### Chart Requirements:

1. **Monthly Trends by Issue Date**:

   - **Chart Type**: Line Chart
   - **Metrics**: Total Loan Applications, Total Funded Amount, Total Amount Received
   - **X-Axis**: Month (based on Issue Date)
   - **Y-Axis**: Metrics' Values
   - **Objective**: Identify seasonality and long-term trends in lending activities.

2. **Regional Analysis by State**:

   - **Chart Type**: Filled Map
   - **Metrics**: Total Loan Applications, Total Funded Amount, Total Amount Received
   - **Regions**: States
   - **Objective**: Visualize lending metrics by state to identify regional disparities.

3. **Loan Term Analysis**:

   - **Chart Type**: Donut Chart
   - **Metrics**: Total Loan Applications, Total Funded Amount, Total Amount Received
   - **Segments**: Loan Terms (e.g., 36 months, 60 months)
   - **Objective**: Understand distribution of loans across term lengths.

4. **Employee Length Analysis**:

   - **Chart Type**: Bar Chart
   - **Metrics**: Total Loan Applications, Total Funded Amount, Total Amount Received
   - **X-Axis**: Employee Length Categories (e.g., 1 year, 5 years, 10+ years)
   - **Y-Axis**: Metrics' Values
   - **Objective**: Assess the impact of employment history on loan applications.

5. **Loan Purpose Breakdown**:

   - **Chart Type**: Bar Chart
   - **Metrics**: Total Loan Applications, Total Funded Amount, Total Amount Received
   - **X-Axis**: Loan Purpose Categories (e.g., debt consolidation, credit card refinancing)
   - **Y-Axis**: Metrics' Values
   - **Objective**: Analyse primary reasons borrowers seek financing.

6. **Home Ownership Analysis**:
   - **Chart Type**: Tree Map
   - **Metrics**: Total Loan Applications, Total Funded Amount, Total Amount Received
   - **Hierarchy**: Home Ownership Categories (e.g., own, rent, mortgage)
   - **Objective**: View loan metrics categorized by home ownership.

---

## Dashboard 3: Details

![summary](./report%20image/details.png)

### Objective

The **Details Dashboard** provides a consolidated view of key loan-related metrics and data points, enabling users to access vital loan data efficiently.

### Features:

- Comprehensive snapshot of the loan portfolio
- Detailed insights into borrower profiles
- Assessment of loan performance

The **Details Dashboard** serves as a one-stop solution for users seeking in-depth loan data insights.
