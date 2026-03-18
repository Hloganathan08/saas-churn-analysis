-- ================================================
-- SaaS Churn Analysis — SQL Query Library
-- Author: Harshita Loganathan
-- Dataset: Telco Customer Churn (7,043 customers)
-- ================================================

-- Query 1: Overall Churn Rate
SELECT 
    COUNT(*) as total_customers,
    SUM(Churn_Binary) as churned_customers,
    ROUND(AVG(Churn_Binary) * 100, 1) as churn_rate_pct,
    ROUND(AVG(MonthlyCharges), 2) as avg_monthly_charges
FROM churn_scored;

-- Query 2: Churn by Contract Type
SELECT 
    Contract,
    COUNT(*) as total_customers,
    SUM(Churn_Binary) as churned,
    ROUND(AVG(Churn_Binary) * 100, 1) as churn_rate_pct,
    ROUND(AVG(MonthlyCharges), 2) as avg_monthly_charges
FROM churn_scored
GROUP BY Contract
ORDER BY churn_rate_pct DESC;

-- Query 3: Cohort Retention Analysis (Window Functions)
WITH cohort_stats AS (
    SELECT 
        Tenure_Cohort,
        COUNT(*) as total_customers,
        SUM(Churn_Binary) as churned,
        ROUND(AVG(Churn_Binary) * 100, 1) as churn_rate_pct,
        ROUND(AVG(MonthlyCharges), 2) as avg_monthly_charges
    FROM churn_scored
    GROUP BY Tenure_Cohort
)
SELECT 
    Tenure_Cohort,
    total_customers,
    churned,
    churn_rate_pct,
    avg_monthly_charges,
    ROUND(100.0 * total_customers / SUM(total_customers) OVER (), 1) as pct_of_total
FROM cohort_stats
ORDER BY churn_rate_pct DESC;

-- Query 4: Risk Segment Revenue Analysis
SELECT 
    Risk_Segment,
    COUNT(*) as total_customers,
    ROUND(AVG(Churn_Binary) * 100, 1) as churn_rate_pct,
    ROUND(AVG(MonthlyCharges), 2) as avg_monthly_charges,
    ROUND(SUM(MonthlyCharges), 2) as total_monthly_revenue,
    ROUND(SUM(MonthlyCharges) * AVG(Churn_Binary), 2) as monthly_revenue_at_risk,
    ROUND(SUM(MonthlyCharges) * AVG(Churn_Binary) * 12, 2) as annual_revenue_at_risk
FROM churn_scored
GROUP BY Risk_Segment
ORDER BY churn_rate_pct DESC;

-- Query 5: High Risk vs Low Risk Customer Profile
WITH high_risk AS (
    SELECT * FROM churn_scored WHERE Risk_Segment = 'High Risk'
),
low_risk AS (
    SELECT * FROM churn_scored WHERE Risk_Segment = 'Low Risk'
)
SELECT 
    'High Risk' as Segment,
    ROUND(AVG(tenure), 1) as avg_tenure_months,
    ROUND(AVG(MonthlyCharges), 2) as avg_monthly_charges,
    ROUND(AVG(Churn_Binary) * 100, 1) as churn_rate_pct,
    COUNT(*) as customer_count
FROM high_risk
UNION ALL
SELECT 
    'Low Risk' as Segment,
    ROUND(AVG(tenure), 1) as avg_tenure_months,
    ROUND(AVG(MonthlyCharges), 2) as avg_monthly_charges,
    ROUND(AVG(Churn_Binary) * 100, 1) as churn_rate_pct,
    COUNT(*) as customer_count
FROM low_risk;