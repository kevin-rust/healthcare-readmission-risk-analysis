/*
Step 4 – Analysis Queries
*/

-- Overall readmission rate
SELECT 
    CAST(SUM(readmitted_30_flag) AS FLOAT) / COUNT(*) AS overall_rate
FROM raw_encounters;

-- Risk tier distribution
SELECT 
    risk_level,
    COUNT(*) AS total_patients,
    SUM(readmitted_30_flag) AS readmitted_30,
    CAST(SUM(readmitted_30_flag) AS FLOAT) / COUNT(*) AS readmission_rate
FROM raw_encounters
GROUP BY risk_level
ORDER BY readmission_rate DESC;

/*
Diagnosis Readmission Rate Ranking
Purpose: Identify high-volume diagnosis codes associated with elevated 30-day readmission rates.
*/

SELECT 
    diag_1 AS primary_diagnosis,
    COUNT(*) AS total_patients,
    SUM(readmitted_30_flag) AS readmitted_30,
    CAST(SUM(readmitted_30_flag) AS FLOAT) / COUNT(*) AS readmission_rate
FROM raw_encounters
WHERE diag_1 IS NOT NULL
GROUP BY diag_1
HAVING COUNT(*) > 500
ORDER BY readmission_rate DESC;
