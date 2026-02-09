/*
Healthcare Readmission Risk Analysis
Author: Kevin Rust
Step 1 – Data Cleaning
*/

-- Add readmission flags
ALTER TABLE raw_encounters
ADD readmitted_30_flag INT,
    readmitted_any_flag INT;

UPDATE raw_encounters
SET readmitted_30_flag =
    CASE 
        WHEN readmitted = '<30' THEN 1
        ELSE 0
    END;

-- Clean emergency NULL values
ALTER TABLE raw_encounters
ADD number_emergency_clean INT;

UPDATE raw_encounters
SET number_emergency_clean =
    CASE
        WHEN number_emergency IS NULL THEN 0
        ELSE number_emergency
    END;