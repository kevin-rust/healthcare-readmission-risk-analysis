/*
Step 3 – Risk Stratification
*/

ALTER TABLE raw_encounters
ADD risk_level NVARCHAR(20);

UPDATE raw_encounters
SET risk_level =
    CASE
        WHEN high_risk_diag_flag = 1 THEN 'High Risk'
        WHEN number_emergency_clean >= 1 
             OR time_in_hospital >= 7 THEN 'Moderate Risk'
        ELSE 'Low Risk'
    END;