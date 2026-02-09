/*
Step 2 – Feature Engineering
*/

-- Add high-risk diagnosis flag
ALTER TABLE raw_encounters
ADD high_risk_diag_flag INT;

UPDATE raw_encounters
SET high_risk_diag_flag =
    CASE 
        WHEN diag_1 IN ('250.7','250.6','434','440','820') THEN 1
        ELSE 0
    END;