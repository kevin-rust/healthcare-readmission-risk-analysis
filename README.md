# Healthcare Readmission Risk Analysis (SQL + Power BI)

Analyzed 101,766 hospital encounters to identify drivers of 30-day readmission risk and developed a rule-based risk stratification framework to support targeted care interventions.

## Business Problem

Hospital readmissions within 30 days are costly and often preventable. 
Healthcare organizations must identify high-risk patients prior to discharge 
to improve transitional care planning and reduce avoidable readmissions.

This project analyzes hospital encounter data to:

- Identify key drivers of 30-day readmissions
- Quantify risk differences across patient segments
- Develop a rule-based risk stratification framework
- Create an executive dashboard for decision support

## Dataset

- 101,766 hospital encounters
- Features include:
  - Primary diagnosis (ICD codes)
  - Length of stay
  - Emergency visit utilization
  - Demographics
  - 30-day readmission indicator

Data imported into SQL Server and transformed for analysis.

## Tools & Technologies

- SQL Server (SSMS 19)
- T-SQL (data transformation & feature engineering)
- Power BI (dashboard & visualization)
- DAX (KPI measures and segmentation logic)

## Data Preparation

Key preprocessing steps:

- Cleaned NULL emergency visit values
- Created binary 30-day readmission flag
- Grouped Length of Stay into:
  - Short (1–3 days)
  - Medium (4–6 days)
  - Long (7+ days)
- Identified high-risk diagnosis codes based on readmission rates (min 500 encounters)
- Built rule-based patient risk tiers

## Risk Stratification Model

Patients were segmented into three tiers:

- High Risk
- Moderate Risk
- Low Risk

Segmentation based on:
- High-risk diagnosis codes
- Emergency utilization
- Length of stay

### Results:

| Risk Tier     | Patients | Readmission Rate |
|--------------|----------|-----------------|
| High Risk   | 6,004    | 16.9% |
| Moderate    | 25,206   | 13.1% |
| Low Risk    | 70,556   | 10.0% |
| Overall     | 101,766  | 11.2% |

## Key Findings

### 1. Emergency Utilization
Patients with ≥1 emergency visit had a 14.4% readmission rate vs 10.9% for those without.

### 2. Length of Stay
Readmission risk increased with length of stay:
- Long (7+ days): 13.2%
- Medium (4–6): 12.1%
- Short (1–3): 9.7%

### 3. High-Risk Diagnoses
High-risk diagnosis group showed a 16.9% readmission rate vs 10.8% for others.

### 4. Risk Tier Separation
High-risk patients demonstrated ~70% higher readmission rates compared to low-risk patients.

## Dashboard Preview

### Executive Overview
![Executive Overview](images/page1.png)

### Risk Drivers
![Risk Drivers](images/page2.png)

## Business Impact

This framework enables healthcare organizations to:

- Prioritize discharge planning for high-risk patients
- Allocate case management resources effectively
- Implement targeted post-discharge interventions
- Reduce preventable readmissions

The rule-based model is transparent and explainable, making it suitable for operational healthcare environments.

## Future Enhancements

- Incorporate demographic risk adjustments
- Build logistic regression model for predictive scoring
- Implement cross-validation framework
- Expand diagnosis grouping using ICD category rollups
