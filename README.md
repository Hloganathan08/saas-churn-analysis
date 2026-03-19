# SaaS Customer Churn Intelligence Dashboard

## 📊 Live Dashboard
👉 [View Interactive Dashboard on Tableau Public](https://public.tableau.com/app/profile/harshita.loganathan/viz/SaaSChurnIntelligenceDashboard/SaaSCustomerChurnIntelligenceDashboard)

---

## Project Overview
End-to-end churn analysis of 7,043 SaaS customers using SQL, Python, and Tableau.
Identified $1.3M in annual revenue at risk and key retention intervention points.

---

## Key Findings

| Finding | Number |
|---|---|
| Overall churn rate | 27% |
| New customer churn (0-12 months) | 47% |
| Highest risk segment churn rate | 49% |
| Customers lost by Month 24 | 44% |
| Annual revenue at risk | $1,326,305 |

---

## The Business Story
- **Month-to-month customers churn at 43%** vs 3% for two-year contracts
- **47% of new customers churn in Year 1** — the critical danger zone
- **3,132 High Risk customers** identified with 49% churn rate
- **$1.3M annual revenue at risk** from High Risk segment alone
- Churned customers pay **$74/month** vs $61 for loyal customers

---

## Recommendations
1. Launch onboarding intervention program for Month 1-3 customers
2. Offer contract upgrade incentives at Month 6 and Month 12
3. Target 3,132 High Risk customers with retention offers
4. A retention program saving 20% of High Risk = $265K revenue recovered

---

## Project Structure
```
saas-churn-analysis/
├── data/
│   ├── WA_Fn-UseC_-Telco-Customer-Churn.csv  # Raw dataset
│   └── churn_scored.csv                        # Cleaned + scored dataset
├── notebooks/
│   ├── 01_eda.ipynb                # Exploratory Data Analysis
│   ├── 02_cohort_analysis.ipynb    # Cohort Retention Analysis
│   ├── 03_churn_segmentation.ipynb # Risk Scoring Model
│   ├── 04_funnel_analysis.ipynb    # Funnel + Revenue at Risk
│   └── 05_sql_analysis.ipynb       # SQL Query Analysis
├── sql/
│   └── churn_analysis.sql          # Production-ready SQL queries
└── dashboard/
    └── dashboard_screenshot.png    # Dashboard preview
```

---

## Tech Stack
- **Python** — pandas, numpy, matplotlib, seaborn, duckdb
- **SQL** — window functions, CTEs, aggregations
- **Tableau Public** — interactive dashboard
- **GitHub** — version control

---

## Dataset
[IBM Telco Customer Churn](https://www.kaggle.com/datasets/blastchar/telco-customer-churn)
— 7,043 customers, 21 features

---

## Author
**Harshita Loganathan**
[LinkedIn](https://www.linkedin.com/in/harshitaloganathan) | [Tableau Public](https://public.tableau.com/app/profile/harshita.loganathan)
