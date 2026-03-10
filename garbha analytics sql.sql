create database garbha_analytics;
use garbha_analytics;

-- elisa cleaned dataset
--  BMP15_pgml 
SELECT MIN(BMP15_pgml) AS min_BMP15 FROM elisa_cleaned;
SELECT MAX(BMP15_pgml) AS max_BMP15 FROM elisa_cleaned;
SELECT AVG(BMP15_pgml) AS mean_BMP15 FROM elisa_cleaned;
SELECT BMP15_pgml AS mode_BMP15, COUNT(*) AS freq FROM elisa_cleaned GROUP BY BMP15_pgml ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(BMP15_pgml) AS stddev_BMP15 FROM elisa_cleaned;
SELECT VAR_SAMP(BMP15_pgml) AS variance_BMP15 FROM elisa_cleaned;

-- median of BMP15_pgml
WITH ordered AS (
  SELECT BMP15_pgml AS x,
         ROW_NUMBER() OVER (ORDER BY BMP15_pgml) AS rn,
         COUNT(BMP15_pgml) OVER () AS n
  FROM elisa_cleaned
  WHERE BMP15_pgml IS NOT NULL
)
SELECT AVG(x) AS median_BMP15 FROM ordered
WHERE rn IN (FLOOR((n + 1)/2), FLOOR((n + 2)/2));

-- mode for categorical column
SELECT `Group` AS mode_Group, COUNT(*) AS freq FROM elisa_cleaned GROUP BY `Group` ORDER BY freq DESC LIMIT 1;

-- === LIF_pgml ===
SELECT MIN(LIF_pgml) AS min_LIF FROM elisa_cleaned;
SELECT MAX(LIF_pgml) AS max_LIF FROM elisa_cleaned;
SELECT AVG(LIF_pgml) AS mean_LIF FROM elisa_cleaned;
SELECT LIF_pgml AS mode_LIF, COUNT(*) AS freq FROM elisa_cleaned GROUP BY LIF_pgml ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(LIF_pgml) AS stddev_LIF FROM elisa_cleaned;
SELECT VAR_SAMP(LIF_pgml) AS variance_LIF FROM elisa_cleaned;

-- median of LIF_pgml
WITH ordered AS (
  SELECT LIF_pgml AS x,
         ROW_NUMBER() OVER (ORDER BY LIF_pgml) AS rn,
         COUNT(LIF_pgml) OVER () AS n
  FROM elisa_cleaned
  WHERE LIF_pgml IS NOT NULL
)
SELECT AVG(x) AS median_LIF FROM ordered
WHERE rn IN (FLOOR((n + 1)/2), FLOOR((n + 2)/2));

--  mother dataset

-- Age
SELECT MIN(Age) AS min_Age FROM mother_cleaned;
SELECT MAX(Age) AS max_Age FROM mother_cleaned;
SELECT AVG(Age) AS mean_Age FROM mother_cleaned;
WITH ordered AS (
  SELECT Age x, ROW_NUMBER() OVER (ORDER BY Age) rn, COUNT(Age) OVER () n
  FROM mother_cleaned WHERE Age IS NOT NULL
) SELECT AVG(x) AS median_Age FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT Age AS mode_Age, COUNT(*) AS freq FROM mother_cleaned GROUP BY Age ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(Age) AS std_Age FROM mother_cleaned;
SELECT VAR_SAMP(Age)   AS var_Age  FROM mother_cleaned;

-- BMI
SELECT MIN(BMI) AS min_BMI FROM mother_cleaned;
SELECT MAX(BMI) AS max_BMI FROM mother_cleaned;
SELECT AVG(BMI) AS mean_BMI FROM mother_cleaned;
WITH ordered AS (
  SELECT BMI x, ROW_NUMBER() OVER (ORDER BY BMI) rn, COUNT(BMI) OVER () n
  FROM mother_cleaned WHERE BMI IS NOT NULL
) SELECT AVG(x) AS median_BMI FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT BMI AS mode_BMI, COUNT(*) AS freq FROM mother_cleaned GROUP BY BMI ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(BMI) AS std_BMI FROM mother_cleaned;
SELECT VAR_SAMP(BMI)   AS var_BMI  FROM mother_cleaned;

-- LH_FSH_Ratio
SELECT MIN(LH_FSH_Ratio) AS min_LHFSH FROM mother_cleaned;
SELECT MAX(LH_FSH_Ratio) AS max_LHFSH FROM mother_cleaned;
SELECT AVG(LH_FSH_Ratio) AS mean_LHFSH FROM mother_cleaned;
WITH ordered AS (
  SELECT LH_FSH_Ratio x, ROW_NUMBER() OVER (ORDER BY LH_FSH_Ratio) rn, COUNT(LH_FSH_Ratio) OVER () n
  FROM mother_cleaned WHERE LH_FSH_Ratio IS NOT NULL
) SELECT AVG(x) AS median_LHFSH FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT LH_FSH_Ratio AS mode_LHFSH, COUNT(*) AS freq FROM mother_cleaned GROUP BY LH_FSH_Ratio ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(LH_FSH_Ratio) AS std_LHFSH FROM mother_cleaned;
SELECT VAR_SAMP(LH_FSH_Ratio)   AS var_LHFSH  FROM mother_cleaned;

-- Testosterone
SELECT MIN(Testosterone) AS min_Testosterone FROM mother_cleaned;
SELECT MAX(Testosterone) AS max_Testosterone FROM mother_cleaned;
SELECT AVG(Testosterone) AS mean_Testosterone FROM mother_cleaned;
WITH ordered AS (
  SELECT Testosterone x, ROW_NUMBER() OVER (ORDER BY Testosterone) rn, COUNT(Testosterone) OVER () n
  FROM mother_cleaned WHERE Testosterone IS NOT NULL
) SELECT AVG(x) AS median_Testosterone FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT Testosterone AS mode_Testosterone, COUNT(*) AS freq FROM mother_cleaned GROUP BY Testosterone ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(Testosterone) AS std_Testosterone FROM mother_cleaned;
SELECT VAR_SAMP(Testosterone)   AS var_Testosterone  FROM mother_cleaned;

-- E2_Level
SELECT MIN(E2_Level) AS min_E2 FROM mother_cleaned;
SELECT MAX(E2_Level) AS max_E2 FROM mother_cleaned;
SELECT AVG(E2_Level) AS mean_E2 FROM mother_cleaned;
WITH ordered AS (
  SELECT E2_Level x, ROW_NUMBER() OVER (ORDER BY E2_Level) rn, COUNT(E2_Level) OVER () n
  FROM mother_cleaned WHERE E2_Level IS NOT NULL
) SELECT AVG(x) AS median_E2 FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT E2_Level AS mode_E2, COUNT(*) AS freq FROM mother_cleaned GROUP BY E2_Level ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(E2_Level) AS std_E2 FROM mother_cleaned;
SELECT VAR_SAMP(E2_Level)   AS var_E2  FROM mother_cleaned;

-- Gn_Dose
SELECT MIN(Gn_Dose) AS min_GnDose FROM mother_cleaned;
SELECT MAX(Gn_Dose) AS max_GnDose FROM mother_cleaned;
SELECT AVG(Gn_Dose) AS mean_GnDose FROM mother_cleaned;
WITH ordered AS (
  SELECT Gn_Dose x, ROW_NUMBER() OVER (ORDER BY Gn_Dose) rn, COUNT(Gn_Dose) OVER () n
  FROM mother_cleaned WHERE Gn_Dose IS NOT NULL
) SELECT AVG(x) AS median_GnDose FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT Gn_Dose AS mode_GnDose, COUNT(*) AS freq FROM mother_cleaned GROUP BY Gn_Dose ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(Gn_Dose) AS std_GnDose FROM mother_cleaned;
SELECT VAR_SAMP(Gn_Dose)   AS var_GnDose  FROM mother_cleaned;

-- Gn_Duration
SELECT MIN(Gn_Duration) AS min_GnDur FROM mother_cleaned;
SELECT MAX(Gn_Duration) AS max_GnDur FROM mother_cleaned;
SELECT AVG(Gn_Duration) AS mean_GnDur FROM mother_cleaned;
WITH ordered AS (
  SELECT Gn_Duration x, ROW_NUMBER() OVER (ORDER BY Gn_Duration) rn, COUNT(Gn_Duration) OVER () n
  FROM mother_cleaned WHERE Gn_Duration IS NOT NULL
) SELECT AVG(x) AS median_GnDur FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT Gn_Duration AS mode_GnDur, COUNT(*) AS freq FROM mother_cleaned GROUP BY Gn_Duration ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(Gn_Duration) AS std_GnDur FROM mother_cleaned;
SELECT VAR_SAMP(Gn_Duration)   AS var_GnDur  FROM mother_cleaned;

-- E2_HCG_Day
SELECT MIN(E2_HCG_Day) AS min_E2HCG FROM mother_cleaned;
SELECT MAX(E2_HCG_Day) AS max_E2HCG FROM mother_cleaned;
SELECT AVG(E2_HCG_Day) AS mean_E2HCG FROM mother_cleaned;
WITH ordered AS (
  SELECT E2_HCG_Day x, ROW_NUMBER() OVER (ORDER BY E2_HCG_Day) rn, COUNT(E2_HCG_Day) OVER () n
  FROM mother_cleaned WHERE E2_HCG_Day IS NOT NULL
) SELECT AVG(x) AS median_E2HCG FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT E2_HCG_Day AS mode_E2HCG, COUNT(*) AS freq FROM mother_cleaned GROUP BY E2_HCG_Day ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(E2_HCG_Day) AS std_E2HCG FROM mother_cleaned;
SELECT VAR_SAMP(E2_HCG_Day)   AS var_E2HCG  FROM mother_cleaned;

-- Retrieved_Oocytes
SELECT MIN(Retrieved_Oocytes) AS min_Retrieved FROM mother_cleaned;
SELECT MAX(Retrieved_Oocytes) AS max_Retrieved FROM mother_cleaned;
SELECT AVG(Retrieved_Oocytes) AS mean_Retrieved FROM mother_cleaned;
WITH ordered AS (
  SELECT Retrieved_Oocytes x, ROW_NUMBER() OVER (ORDER BY Retrieved_Oocytes) rn, COUNT(Retrieved_Oocytes) OVER () n
  FROM mother_cleaned WHERE Retrieved_Oocytes IS NOT NULL
) SELECT AVG(x) AS median_Retrieved FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT Retrieved_Oocytes AS mode_Retrieved, COUNT(*) AS freq FROM mother_cleaned GROUP BY Retrieved_Oocytes ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(Retrieved_Oocytes) AS std_Retrieved FROM mother_cleaned;
SELECT VAR_SAMP(Retrieved_Oocytes)   AS var_Retrieved  FROM mother_cleaned;

-- Fertilization_Rate
SELECT MIN(Fertilization_Rate) AS min_FertRate FROM mother_cleaned;
SELECT MAX(Fertilization_Rate) AS max_FertRate FROM mother_cleaned;
SELECT AVG(Fertilization_Rate) AS mean_FertRate FROM mother_cleaned;
WITH ordered AS (
  SELECT Fertilization_Rate x, ROW_NUMBER() OVER (ORDER BY Fertilization_Rate) rn, COUNT(Fertilization_Rate) OVER () n
  FROM mother_cleaned WHERE Fertilization_Rate IS NOT NULL
) SELECT AVG(x) AS median_FertRate FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT Fertilization_Rate AS mode_FertRate, COUNT(*) AS freq FROM mother_cleaned GROUP BY Fertilization_Rate ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(Fertilization_Rate) AS std_FertRate FROM mother_cleaned;
SELECT VAR_SAMP(Fertilization_Rate)   AS var_FertRate  FROM mother_cleaned;

-- Good_Embryo_Rate
SELECT MIN(Good_Embryo_Rate) AS min_GoodEmb FROM mother_cleaned;
SELECT MAX(Good_Embryo_Rate) AS max_GoodEmb FROM mother_cleaned;
SELECT AVG(Good_Embryo_Rate) AS mean_GoodEmb FROM mother_cleaned;
WITH ordered AS (
  SELECT Good_Embryo_Rate x, ROW_NUMBER() OVER (ORDER BY Good_Embryo_Rate) rn, COUNT(Good_Embryo_Rate) OVER () n
  FROM mother_cleaned WHERE Good_Embryo_Rate IS NOT NULL
) SELECT AVG(x) AS median_GoodEmb FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT Good_Embryo_Rate AS mode_GoodEmb, COUNT(*) AS freq FROM mother_cleaned GROUP BY Good_Embryo_Rate ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(Good_Embryo_Rate) AS std_GoodEmb FROM mother_cleaned;
SELECT VAR_SAMP(Good_Embryo_Rate)   AS var_GoodEmb  FROM mother_cleaned;

-- Gestational_Age
SELECT MIN(Gestational_Age) AS min_GA FROM mother_cleaned;
SELECT MAX(Gestational_Age) AS max_GA FROM mother_cleaned;
SELECT AVG(Gestational_Age) AS mean_GA FROM mother_cleaned;
WITH ordered AS (
  SELECT Gestational_Age x, ROW_NUMBER() OVER (ORDER BY Gestational_Age) rn, COUNT(Gestational_Age) OVER () n
  FROM mother_cleaned WHERE Gestational_Age IS NOT NULL
) SELECT AVG(x) AS median_GA FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT Gestational_Age AS mode_GA, COUNT(*) AS freq FROM mother_cleaned GROUP BY Gestational_Age ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(Gestational_Age) AS std_GA FROM mother_cleaned;
SELECT VAR_SAMP(Gestational_Age)   AS var_GA  FROM mother_cleaned;

-- Binary outcomes (treat as numeric 0/1)
-- Clinical_Pregnancy
SELECT AVG(Clinical_Pregnancy) AS mean_rate_Clinical_Pregnancy FROM mother_cleaned;
SELECT Clinical_Pregnancy AS mode_Clinical_Pregnancy, COUNT(*) AS freq FROM mother_cleaned GROUP BY Clinical_Pregnancy ORDER BY freq DESC LIMIT 1;

-- Miscarriage
SELECT AVG(Miscarriage) AS mean_rate_Miscarriage FROM mother_cleaned;
SELECT Miscarriage AS mode_Miscarriage, COUNT(*) AS freq FROM mother_cleaned GROUP BY Miscarriage ORDER BY freq DESC LIMIT 1;

-- Live_Birth
SELECT AVG(Live_Birth) AS mean_rate_Live_Birth FROM mother_cleaned;
SELECT Live_Birth AS mode_Live_Birth, COUNT(*) AS freq FROM mother_cleaned GROUP BY Live_Birth ORDER BY freq DESC LIMIT 1;

-- Categorical modes
SELECT Delivery_Type AS mode_Delivery_Type, COUNT(*) AS freq FROM mother_cleaned GROUP BY Delivery_Type ORDER BY freq DESC LIMIT 1;
SELECT Infertility_Type AS mode_Infertility_Type, COUNT(*) AS freq FROM mother_cleaned GROUP BY Infertility_Type ORDER BY freq DESC LIMIT 1;

-- offspring dataset

-- Weight_kg
SELECT MIN(Weight_kg) AS min_Weight FROM offspring_cleaned;
SELECT MAX(Weight_kg) AS max_Weight FROM offspring_cleaned;
SELECT AVG(Weight_kg) AS mean_Weight FROM offspring_cleaned;
WITH ordered AS (
  SELECT Weight_kg x, ROW_NUMBER() OVER (ORDER BY Weight_kg) rn, COUNT(Weight_kg) OVER () n
  FROM offspring_cleaned WHERE Weight_kg IS NOT NULL
) SELECT AVG(x) AS median_Weight FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT Weight_kg AS mode_Weight, COUNT(*) AS freq FROM offspring_cleaned GROUP BY Weight_kg ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(Weight_kg) AS std_Weight FROM offspring_cleaned;
SELECT VAR_SAMP(Weight_kg)   AS var_Weight  FROM offspring_cleaned;

-- APGAR_Score
SELECT MIN(APGAR_Score) AS min_APGAR FROM offspring_cleaned;
SELECT MAX(APGAR_Score) AS max_APGAR FROM offspring_cleaned;
SELECT AVG(APGAR_Score) AS mean_APGAR FROM offspring_cleaned;
WITH ordered AS (
  SELECT APGAR_Score x, ROW_NUMBER() OVER (ORDER BY APGAR_Score) rn, COUNT(APGAR_Score) OVER () n
  FROM offspring_cleaned WHERE APGAR_Score IS NOT NULL
) SELECT AVG(x) AS median_APGAR FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT APGAR_Score AS mode_APGAR, COUNT(*) AS freq FROM offspring_cleaned GROUP BY APGAR_Score ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(APGAR_Score) AS std_APGAR FROM offspring_cleaned;
SELECT VAR_SAMP(APGAR_Score)   AS var_APGAR  FROM offspring_cleaned;

-- Categorical modes
SELECT Gender AS mode_Gender, COUNT(*) AS freq FROM offspring_cleaned GROUP BY Gender ORDER BY freq DESC LIMIT 1;
SELECT `Group` AS mode_Group, COUNT(*) AS freq FROM offspring_cleaned GROUP BY `Group` ORDER BY freq DESC LIMIT 1;

-- reports and dashboards data

-- numeric columns

-- Age
SELECT MIN(Age) AS min_Age, MAX(Age) AS max_Age, AVG(Age) AS mean_Age FROM Reports_and_Dashboards_Data1_Cleaned;
WITH ordered AS (
  SELECT Age x, ROW_NUMBER() OVER (ORDER BY Age) rn, COUNT(Age) OVER () n
  FROM Reports_and_Dashboards_Data1_Cleaned WHERE Age IS NOT NULL
) SELECT AVG(x) AS median_Age FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT Age AS mode_Age, COUNT(*) AS freq FROM Reports_and_Dashboards_Data1_Cleaned GROUP BY Age ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(Age) AS std_Age, VAR_SAMP(Age) AS var_Age FROM Reports_and_Dashboards_Data1_Cleaned;

-- Spouse_Age
SELECT MIN(Spouse_Age), MAX(Spouse_Age), AVG(Spouse_Age) FROM Reports_and_Dashboards_Data1_Cleaned;
WITH ordered AS (
  SELECT Spouse_Age x, ROW_NUMBER() OVER (ORDER BY Spouse_Age) rn, COUNT(Spouse_Age) OVER () n
  FROM Reports_and_Dashboards_Data1_Cleaned WHERE Spouse_Age IS NOT NULL
) SELECT AVG(x) AS median_Spouse_Age FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT Spouse_Age AS mode_Spouse_Age, COUNT(*) AS freq FROM Reports_and_Dashboards_Data1_Cleaned GROUP BY Spouse_Age ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(Spouse_Age) AS std_Spouse_Age, VAR_SAMP(Spouse_Age) AS var_Spouse_Age FROM Reports_and_Dashboards_Data1_Cleaned;

-- FSH
SELECT MIN(FSH), MAX(FSH), AVG(FSH) FROM Reports_and_Dashboards_Data1_Cleaned;
WITH ordered AS (
  SELECT FSH x, ROW_NUMBER() OVER (ORDER BY FSH) rn, COUNT(FSH) OVER () n
  FROM Reports_and_Dashboards_Data1_Cleaned WHERE FSH IS NOT NULL
) SELECT AVG(x) AS median_FSH FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT FSH AS mode_FSH, COUNT(*) AS freq FROM Reports_and_Dashboards_Data1_Cleaned GROUP BY FSH ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(FSH) AS std_FSH, VAR_SAMP(FSH) AS var_FSH FROM Reports_and_Dashboards_Data1_Cleaned;

-- E2
SELECT MIN(E2), MAX(E2), AVG(E2) FROM Reports_and_Dashboards_Data1_Cleaned;
WITH ordered AS (
  SELECT E2 x, ROW_NUMBER() OVER (ORDER BY E2) rn, COUNT(E2) OVER () n
  FROM Reports_and_Dashboards_Data1_Cleaned WHERE E2 IS NOT NULL
) SELECT AVG(x) AS median_E2 FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT E2 AS mode_E2, COUNT(*) AS freq FROM Reports_and_Dashboards_Data1_Cleaned GROUP BY E2 ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(E2) AS std_E2, VAR_SAMP(E2) AS var_E2 FROM Reports_and_Dashboards_Data1_Cleaned;

-- Progesterone
SELECT MIN(Progesterone), MAX(Progesterone), AVG(Progesterone) FROM Reports_and_Dashboards_Data1_Cleaned;
WITH ordered AS (
  SELECT Progesterone x, ROW_NUMBER() OVER (ORDER BY Progesterone) rn, COUNT(Progesterone) OVER () n
  FROM Reports_and_Dashboards_Data1_Cleaned WHERE Progesterone IS NOT NULL
) SELECT AVG(x) AS median_Progesterone FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT Progesterone AS mode_Progesterone, COUNT(*) AS freq FROM Reports_and_Dashboards_Data1_Cleaned GROUP BY Progesterone ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(Progesterone) AS std_Progesterone, VAR_SAMP(Progesterone) AS var_Progesterone FROM Reports_and_Dashboards_Data1_Cleaned;

-- Num_Oocytes
SELECT MIN(Num_Oocytes), MAX(Num_Oocytes), AVG(Num_Oocytes) FROM Reports_and_Dashboards_Data1_Cleaned;
WITH ordered AS (
  SELECT Num_Oocytes x, ROW_NUMBER() OVER (ORDER BY Num_Oocytes) rn, COUNT(Num_Oocytes) OVER () n
  FROM Reports_and_Dashboards_Data1_Cleaned WHERE Num_Oocytes IS NOT NULL
) SELECT AVG(x) AS median_Num_Oocytes FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT Num_Oocytes AS mode_Num_Oocytes, COUNT(*) AS freq FROM Reports_and_Dashboards_Data1_Cleaned GROUP BY Num_Oocytes ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(Num_Oocytes) AS std_Num_Oocytes, VAR_SAMP(Num_Oocytes) AS var_Num_Oocytes FROM Reports_and_Dashboards_Data1_Cleaned;

-- Endometrial_Thickness
SELECT MIN(Endometrial_Thickness), MAX(Endometrial_Thickness), AVG(Endometrial_Thickness) FROM Reports_and_Dashboards_Data1_Cleaned;
WITH ordered AS (
  SELECT Endometrial_Thickness x, ROW_NUMBER() OVER (ORDER BY Endometrial_Thickness) rn, COUNT(Endometrial_Thickness) OVER () n
  FROM Reports_and_Dashboards_Data1_Cleaned WHERE Endometrial_Thickness IS NOT NULL
) SELECT AVG(x) AS median_Endometrial_Thickness FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT Endometrial_Thickness AS mode_Endometrial_Thickness, COUNT(*) AS freq FROM Reports_and_Dashboards_Data1_Cleaned GROUP BY Endometrial_Thickness ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(Endometrial_Thickness) AS std_Endometrial_Thickness, VAR_SAMP(Endometrial_Thickness) AS var_Endometrial_Thickness FROM Reports_and_Dashboards_Data1_Cleaned;

-- Embryos_Transferred
SELECT MIN(Embryos_Transferred), MAX(Embryos_Transferred), AVG(Embryos_Transferred) FROM Reports_and_Dashboards_Data1_Cleaned;
WITH ordered AS (
  SELECT Embryos_Transferred x, ROW_NUMBER() OVER (ORDER BY Embryos_Transferred) rn, COUNT(Embryos_Transferred) OVER () n
  FROM Reports_and_Dashboards_Data1_Cleaned WHERE Embryos_Transferred IS NOT NULL
) SELECT AVG(x) AS median_Embryos_Transferred FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT Embryos_Transferred AS mode_Embryos_Transferred, COUNT(*) AS freq FROM Reports_and_Dashboards_Data1_Cleaned GROUP BY Embryos_Transferred ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(Embryos_Transferred) AS std_Embryos_Transferred, VAR_SAMP(Embryos_Transferred) AS var_Embryos_Transferred FROM Reports_and_Dashboards_Data1_Cleaned;

-- BHCG_12
SELECT MIN(BHCG_12), MAX(BHCG_12), AVG(BHCG_12) FROM Reports_and_Dashboards_Data1_Cleaned;
WITH ordered AS (
  SELECT BHCG_12 x, ROW_NUMBER() OVER (ORDER BY BHCG_12) rn, COUNT(BHCG_12) OVER () n
  FROM Reports_and_Dashboards_Data1_Cleaned WHERE BHCG_12 IS NOT NULL
) SELECT AVG(x) AS median_BHCG_12 FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT BHCG_12 AS mode_BHCG_12, COUNT(*) AS freq FROM Reports_and_Dashboards_Data1_Cleaned GROUP BY BHCG_12 ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(BHCG_12) AS std_BHCG_12, VAR_SAMP(BHCG_12) AS var_BHCG_12 FROM Reports_and_Dashboards_Data1_Cleaned;

-- BHCG_14
SELECT MIN(BHCG_14), MAX(BHCG_14), AVG(BHCG_14) FROM Reports_and_Dashboards_Data1_Cleaned;
WITH ordered AS (
  SELECT BHCG_14 x, ROW_NUMBER() OVER (ORDER BY BHCG_14) rn, COUNT(BHCG_14) OVER () n
  FROM Reports_and_Dashboards_Data1_Cleaned WHERE BHCG_14 IS NOT NULL
) SELECT AVG(x) AS median_BHCG_14 FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT BHCG_14 AS mode_BHCG_14, COUNT(*) AS freq FROM Reports_and_Dashboards_Data1_Cleaned GROUP BY BHCG_14 ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(BHCG_14) AS std_BHCG_14, VAR_SAMP(BHCG_14) AS var_BHCG_14 FROM Reports_and_Dashboards_Data1_Cleaned;

-- BHCG_Increase
SELECT MIN(BHCG_Increase), MAX(BHCG_Increase), AVG(BHCG_Increase) FROM Reports_and_Dashboards_Data1_Cleaned;
WITH ordered AS (
  SELECT BHCG_Increase x, ROW_NUMBER() OVER (ORDER BY BHCG_Increase) rn, COUNT(BHCG_Increase) OVER () n
  FROM Reports_and_Dashboards_Data1_Cleaned WHERE BHCG_Increase IS NOT NULL
) SELECT AVG(x) AS median_BHCG_Increase FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT BHCG_Increase AS mode_BHCG_Increase, COUNT(*) AS freq FROM Reports_and_Dashboards_Data1_Cleaned GROUP BY BHCG_Increase ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(BHCG_Increase) AS std_BHCG_Increase, VAR_SAMP(BHCG_Increase) AS var_BHCG_Increase FROM Reports_and_Dashboards_Data1_Cleaned;

-- binary columns (mode and mean)

SELECT AVG(Clinical_Pregnancy) AS mean_rate_Clinical_Pregnancy FROM Reports_and_Dashboards_Data1_Cleaned;
SELECT Clinical_Pregnancy AS mode_Clinical_Pregnancy, COUNT(*) FROM Reports_and_Dashboards_Data1_Cleaned GROUP BY Clinical_Pregnancy ORDER BY COUNT(*) DESC LIMIT 1;

SELECT AVG(Live_Birth) AS mean_rate_Live_Birth FROM Reports_and_Dashboards_Data1_Cleaned;
SELECT Live_Birth AS mode_Live_Birth, COUNT(*) FROM Reports_and_Dashboards_Data1_Cleaned GROUP BY Live_Birth ORDER BY COUNT(*) DESC LIMIT 1;

SELECT AVG(Neonatal_Death) AS mean_rate_Neonatal_Death FROM Reports_and_Dashboards_Data1_Cleaned;
SELECT Neonatal_Death AS mode_Neonatal_Death, COUNT(*) FROM Reports_and_Dashboards_Data1_Cleaned GROUP BY Neonatal_Death ORDER BY COUNT(*) DESC LIMIT 1;

SELECT AVG(Abortion) AS mean_rate_Abortion FROM Reports_and_Dashboards_Data1_Cleaned;
SELECT Abortion AS mode_Abortion, COUNT(*) FROM Reports_and_Dashboards_Data1_Cleaned GROUP BY Abortion ORDER BY COUNT(*) DESC LIMIT 1;

-- categorical columns ( mode )
SELECT Patient_Name AS mode_Patient_Name, COUNT(*) AS freq FROM Reports_and_Dashboards_Data1_Cleaned GROUP BY Patient_Name ORDER BY freq DESC LIMIT 1;
SELECT is_outlier_Age AS mode_is_outlier_Age, COUNT(*) FROM Reports_and_Dashboards_Data1_Cleaned GROUP BY is_outlier_Age ORDER BY COUNT(*) DESC LIMIT 1;
SELECT is_outlier_Spouse_Age AS mode_is_outlier_Spouse_Age, COUNT(*) FROM Reports_and_Dashboards_Data1_Cleaned GROUP BY is_outlier_Spouse_Age ORDER BY COUNT(*) DESC LIMIT 1;
SELECT is_outlier_BHCG_Increase AS mode_is_outlier_BHCG_Increase, COUNT(*) FROM Reports_and_Dashboards_Data1_Cleaned GROUP BY is_outlier_BHCG_Increase ORDER BY COUNT(*) DESC LIMIT 1;
SELECT is_outlier_Endometrial_Thickness AS mode_is_outlier_Endometrial_Thickness, COUNT(*) FROM Reports_and_Dashboards_Data1_Cleaned GROUP BY is_outlier_Endometrial_Thickness ORDER BY COUNT(*) DESC LIMIT 1;

-- reports and dashboards data 2

-- numeric columns

-- Age
SELECT MIN(Age), MAX(Age), AVG(Age) FROM Reports_and_Dashboards_Data2_Cleaned;
WITH ordered AS (
  SELECT Age x, ROW_NUMBER() OVER (ORDER BY Age) rn, COUNT(Age) OVER () n
  FROM Reports_and_Dashboards_Data2_Cleaned WHERE Age IS NOT NULL
) SELECT AVG(x) AS median_Age FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT Age AS mode_Age, COUNT(*) AS freq FROM Reports_and_Dashboards_Data2_Cleaned GROUP BY Age ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(Age) AS std_Age, VAR_SAMP(Age) AS var_Age FROM Reports_and_Dashboards_Data2_Cleaned;

-- BMI
SELECT MIN(BMI), MAX(BMI), AVG(BMI) FROM Reports_and_Dashboards_Data2_Cleaned;
WITH ordered AS (
  SELECT BMI x, ROW_NUMBER() OVER (ORDER BY BMI) rn, COUNT(BMI) OVER () n
  FROM Reports_and_Dashboards_Data2_Cleaned WHERE BMI IS NOT NULL
) SELECT AVG(x) AS median_BMI FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT BMI AS mode_BMI, COUNT(*) AS freq FROM Reports_and_Dashboards_Data2_Cleaned GROUP BY BMI ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(BMI) AS std_BMI, VAR_SAMP(BMI) AS var_BMI FROM Reports_and_Dashboards_Data2_Cleaned;

-- Infertility_Duration
SELECT MIN(Infertility_Duration), MAX(Infertility_Duration), AVG(Infertility_Duration) FROM Reports_and_Dashboards_Data2_Cleaned;
WITH ordered AS (
  SELECT Infertility_Duration x, ROW_NUMBER() OVER (ORDER BY Infertility_Duration) rn, COUNT(Infertility_Duration) OVER () n
  FROM Reports_and_Dashboards_Data2_Cleaned WHERE Infertility_Duration IS NOT NULL
) SELECT AVG(x) AS median_Infertility_Duration FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT Infertility_Duration AS mode_Infertility_Duration, COUNT(*) AS freq FROM Reports_and_Dashboards_Data2_Cleaned GROUP BY Infertility_Duration ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(Infertility_Duration) AS std_Infertility_Duration, VAR_SAMP(Infertility_Duration) AS var_Infertility_Duration FROM Reports_and_Dashboards_Data2_Cleaned;

-- Antral_Follicle_Count
SELECT MIN(Antral_Follicle_Count), MAX(Antral_Follicle_Count), AVG(Antral_Follicle_Count) FROM Reports_and_Dashboards_Data2_Cleaned;
WITH ordered AS (
  SELECT Antral_Follicle_Count x, ROW_NUMBER() OVER (ORDER BY Antral_Follicle_Count) rn, COUNT(Antral_Follicle_Count) OVER () n
  FROM Reports_and_Dashboards_Data2_Cleaned WHERE Antral_Follicle_Count IS NOT NULL
) SELECT AVG(x) AS median_Antral_Follicle_Count FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT Antral_Follicle_Count AS mode_Antral_Follicle_Count, COUNT(*) AS freq FROM Reports_and_Dashboards_Data2_Cleaned GROUP BY Antral_Follicle_Count ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(Antral_Follicle_Count) AS std_Antral_Follicle_Count, VAR_SAMP(Antral_Follicle_Count) AS var_Antral_Follicle_Count FROM Reports_and_Dashboards_Data2_Cleaned;

-- AMH
SELECT MIN(AMH), MAX(AMH), AVG(AMH) FROM Reports_and_Dashboards_Data2_Cleaned;
WITH ordered AS (
  SELECT AMH x, ROW_NUMBER() OVER (ORDER BY AMH) rn, COUNT(AMH) OVER () n
  FROM Reports_and_Dashboards_Data2_Cleaned WHERE AMH IS NOT NULL
) SELECT AVG(x) AS median_AMH FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT AMH AS mode_AMH, COUNT(*) AS freq FROM Reports_and_Dashboards_Data2_Cleaned GROUP BY AMH ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(AMH) AS std_AMH, VAR_SAMP(AMH) AS var_AMH FROM Reports_and_Dashboards_Data2_Cleaned;

-- Stimulation_Days
SELECT MIN(Stimulation_Days), MAX(Stimulation_Days), AVG(Stimulation_Days) FROM Reports_and_Dashboards_Data2_Cleaned;
WITH ordered AS (
  SELECT Stimulation_Days x, ROW_NUMBER() OVER (ORDER BY Stimulation_Days) rn, COUNT(Stimulation_Days) OVER () n
  FROM Reports_and_Dashboards_Data2_Cleaned WHERE Stimulation_Days IS NOT NULL
) SELECT AVG(x) AS median_Stimulation_Days FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT Stimulation_Days AS mode_Stimulation_Days, COUNT(*) AS freq FROM Reports_and_Dashboards_Data2_Cleaned GROUP BY Stimulation_Days ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(Stimulation_Days) AS std_Stimulation_Days, VAR_SAMP(Stimulation_Days) AS var_Stimulation_Days FROM Reports_and_Dashboards_Data2_Cleaned;

-- E2_Trigger
SELECT MIN(E2_Trigger), MAX(E2_Trigger), AVG(E2_Trigger) FROM Reports_and_Dashboards_Data2_Cleaned;
WITH ordered AS (
  SELECT E2_Trigger x, ROW_NUMBER() OVER (ORDER BY E2_Trigger) rn, COUNT(E2_Trigger) OVER () n
  FROM Reports_and_Dashboards_Data2_Cleaned WHERE E2_Trigger IS NOT NULL
) SELECT AVG(x) AS median_E2_Trigger FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT E2_Trigger AS mode_E2_Trigger, COUNT(*) AS freq FROM Reports_and_Dashboards_Data2_Cleaned GROUP BY E2_Trigger ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(E2_Trigger) AS std_E2_Trigger, VAR_SAMP(E2_Trigger) AS var_E2_Trigger FROM Reports_and_Dashboards_Data2_Cleaned;

-- P4_Trigger
SELECT MIN(P4_Trigger), MAX(P4_Trigger), AVG(P4_Trigger) FROM Reports_and_Dashboards_Data2_Cleaned;
WITH ordered AS (
  SELECT P4_Trigger x, ROW_NUMBER() OVER (ORDER BY P4_Trigger) rn, COUNT(P4_Trigger) OVER () n
  FROM Reports_and_Dashboards_Data2_Cleaned WHERE P4_Trigger IS NOT NULL
) SELECT AVG(x) AS median_P4_Trigger FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT P4_Trigger AS mode_P4_Trigger, COUNT(*) AS freq FROM Reports_and_Dashboards_Data2_Cleaned GROUP BY P4_Trigger ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(P4_Trigger) AS std_P4_Trigger, VAR_SAMP(P4_Trigger) AS var_P4_Trigger FROM Reports_and_Dashboards_Data2_Cleaned;

-- Total_Oocytes
SELECT MIN(Total_Oocytes), MAX(Total_Oocytes), AVG(Total_Oocytes) FROM Reports_and_Dashboards_Data2_Cleaned;
WITH ordered AS (
  SELECT Total_Oocytes x, ROW_NUMBER() OVER (ORDER BY Total_Oocytes) rn, COUNT(Total_Oocytes) OVER () n
  FROM Reports_and_Dashboards_Data2_Cleaned WHERE Total_Oocytes IS NOT NULL
) SELECT AVG(x) AS median_Total_Oocytes FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT Total_Oocytes AS mode_Total_Oocytes, COUNT(*) AS freq FROM Reports_and_Dashboards_Data2_Cleaned GROUP BY Total_Oocytes ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(Total_Oocytes) AS std_Total_Oocytes, VAR_SAMP(Total_Oocytes) AS var_Total_Oocytes FROM Reports_and_Dashboards_Data2_Cleaned;

-- Mature_Oocytes
SELECT MIN(Mature_Oocytes), MAX(Mature_Oocytes), AVG(Mature_Oocytes) FROM Reports_and_Dashboards_Data2_Cleaned;
WITH ordered AS (
  SELECT Mature_Oocytes x, ROW_NUMBER() OVER (ORDER BY Mature_Oocytes) rn, COUNT(Mature_Oocytes) OVER () n
  FROM Reports_and_Dashboards_Data2_Cleaned WHERE Mature_Oocytes IS NOT NULL
) SELECT AVG(x) AS median_Mature_Oocytes FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT Mature_Oocytes AS mode_Mature_Oocytes, COUNT(*) AS freq FROM Reports_and_Dashboards_Data2_Cleaned GROUP BY Mature_Oocytes ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(Mature_Oocytes) AS std_Mature_Oocytes, VAR_SAMP(Mature_Oocytes) AS var_Mature_Oocytes FROM Reports_and_Dashboards_Data2_Cleaned;

-- Embryos_Formed
SELECT MIN(Embryos_Formed), MAX(Embryos_Formed), AVG(Embryos_Formed) FROM Reports_and_Dashboards_Data2_Cleaned;
WITH ordered AS (
  SELECT Embryos_Formed x, ROW_NUMBER() OVER (ORDER BY Embryos_Formed) rn, COUNT(Embryos_Formed) OVER () n
  FROM Reports_and_Dashboards_Data2_Cleaned WHERE Embryos_Formed IS NOT NULL
) SELECT AVG(x) AS median_Embryos_Formed FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT Embryos_Formed AS mode_Embryos_Formed, COUNT(*) AS freq FROM Reports_and_Dashboards_Data2_Cleaned GROUP BY Embryos_Formed ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(Embryos_Formed) AS std_Embryos_Formed, VAR_SAMP(Embryos_Formed) AS var_Embryos_Formed FROM Reports_and_Dashboards_Data2_Cleaned;

-- Embryos_Frozen
SELECT MIN(Embryos_Frozen), MAX(Embryos_Frozen), AVG(Embryos_Frozen) FROM Reports_and_Dashboards_Data2_Cleaned;
WITH ordered AS (
  SELECT Embryos_Frozen x, ROW_NUMBER() OVER (ORDER BY Embryos_Frozen) rn, COUNT(Embryos_Frozen) OVER () n
  FROM Reports_and_Dashboards_Data2_Cleaned WHERE Embryos_Frozen IS NOT NULL
) SELECT AVG(x) AS median_Embryos_Frozen FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT Embryos_Frozen AS mode_Embryos_Frozen, COUNT(*) AS freq FROM Reports_and_Dashboards_Data2_Cleaned GROUP BY Embryos_Frozen ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(Embryos_Frozen) AS std_Embryos_Frozen, VAR_SAMP(Embryos_Frozen) AS var_Embryos_Frozen FROM Reports_and_Dashboards_Data2_Cleaned;

-- Embryos_Transferred
SELECT MIN(Embryos_Transferred), MAX(Embryos_Transferred), AVG(Embryos_Transferred) FROM Reports_and_Dashboards_Data2_Cleaned;
WITH ordered AS (
  SELECT Embryos_Transferred x, ROW_NUMBER() OVER (ORDER BY Embryos_Transferred) rn, COUNT(Embryos_Transferred) OVER () n
  FROM Reports_and_Dashboards_Data2_Cleaned WHERE Embryos_Transferred IS NOT NULL
) SELECT AVG(x) AS median_Embryos_Transferred FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT Embryos_Transferred AS mode_Embryos_Transferred, COUNT(*) AS freq FROM Reports_and_Dashboards_Data2_Cleaned GROUP BY Embryos_Transferred ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(Embryos_Transferred) AS std_Embryos_Transferred, VAR_SAMP(Embryos_Transferred) AS var_Embryos_Transferred FROM Reports_and_Dashboards_Data2_Cleaned;

-- binary columns (mode and mean)

SELECT AVG(Cycle_Result) AS mean_rate_Cycle_Result FROM Reports_and_Dashboards_Data2_Cleaned;
SELECT Cycle_Result AS mode_Cycle_Result, COUNT(*) FROM Reports_and_Dashboards_Data2_Cleaned GROUP BY Cycle_Result ORDER BY COUNT(*) DESC LIMIT 1;

SELECT AVG(Biochemical_Pregnancy) AS mean_rate_Biochemical_Pregnancy FROM Reports_and_Dashboards_Data2_Cleaned;
SELECT Biochemical_Pregnancy AS mode_Biochemical_Pregnancy, COUNT(*) FROM Reports_and_Dashboards_Data2_Cleaned GROUP BY Biochemical_Pregnancy ORDER BY COUNT(*) DESC LIMIT 1;

SELECT AVG(Clinical_Pregnancy) AS mean_rate_Clinical_Pregnancy FROM Reports_and_Dashboards_Data2_Cleaned;
SELECT Clinical_Pregnancy AS mode_Clinical_Pregnancy, COUNT(*) FROM Reports_and_Dashboards_Data2_Cleaned GROUP BY Clinical_Pregnancy ORDER BY COUNT(*) DESC LIMIT 1;

SELECT AVG(Miscarriage) AS mean_rate_Miscarriage FROM Reports_and_Dashboards_Data2_Cleaned;
SELECT Miscarriage AS mode_Miscarriage, COUNT(*) FROM Reports_and_Dashboards_Data2_Cleaned GROUP BY Miscarriage ORDER BY COUNT(*) DESC LIMIT 1;

SELECT AVG(Ongoing_Pregnancy) AS mean_rate_Ongoing_Pregnancy FROM Reports_and_Dashboards_Data2_Cleaned;
SELECT Ongoing_Pregnancy AS mode_Ongoing_Pregnancy, COUNT(*) FROM Reports_and_Dashboards_Data2_Cleaned GROUP BY Ongoing_Pregnancy ORDER BY COUNT(*) DESC LIMIT 1;

SELECT AVG(Twin_Pregnancy) AS mean_rate_Twin_Pregnancy FROM Reports_and_Dashboards_Data2_Cleaned;
SELECT Twin_Pregnancy AS mode_Twin_Pregnancy, COUNT(*) FROM Reports_and_Dashboards_Data2_Cleaned GROUP BY Twin_Pregnancy ORDER BY COUNT(*) DESC LIMIT 1;

SELECT AVG(Triplet_Pregnancy) AS mean_rate_Triplet_Pregnancy FROM Reports_and_Dashboards_Data2_Cleaned;
SELECT Triplet_Pregnancy AS mode_Triplet_Pregnancy, COUNT(*) FROM Reports_and_Dashboards_Data2_Cleaned GROUP BY Triplet_Pregnancy ORDER BY COUNT(*) DESC LIMIT 1;

SELECT AVG(Primary_Infertility) AS mean_rate_Primary_Infertility FROM Reports_and_Dashboards_Data2_Cleaned;
SELECT Primary_Infertility AS mode_Primary_Infertility, COUNT(*) FROM Reports_and_Dashboards_Data2_Cleaned GROUP BY Primary_Infertility ORDER BY COUNT(*) DESC LIMIT 1;

-- categorical columns (mode)

SELECT Case_ID AS mode_Case_ID, COUNT(*) FROM Reports_and_Dashboards_Data2_Cleaned GROUP BY Case_ID ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Infertility_Type AS mode_Infertility_Type, COUNT(*) FROM Reports_and_Dashboards_Data2_Cleaned GROUP BY Infertility_Type ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Infertility_Cause AS mode_Infertility_Cause, COUNT(*) FROM Reports_and_Dashboards_Data2_Cleaned GROUP BY Infertility_Cause ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Protocol_Type AS mode_Protocol_Type, COUNT(*) FROM Reports_and_Dashboards_Data2_Cleaned GROUP BY Protocol_Type ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Stimulation_Type AS mode_Stimulation_Type, COUNT(*) FROM Reports_and_Dashboards_Data2_Cleaned GROUP BY Stimulation_Type ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Trigger_Type AS mode_Trigger_Type, COUNT(*) FROM Reports_and_Dashboards_Data2_Cleaned GROUP BY Trigger_Type ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Sperm_Source AS mode_Sperm_Source, COUNT(*) FROM Reports_and_Dashboards_Data2_Cleaned GROUP BY Sperm_Source ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Embryo_Quality AS mode_Embryo_Quality, COUNT(*) FROM Reports_and_Dashboards_Data2_Cleaned GROUP BY Embryo_Quality ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Transfer_Day AS mode_Transfer_Day, COUNT(*) FROM Reports_and_Dashboards_Data2_Cleaned GROUP BY Transfer_Day ORDER BY COUNT(*) DESC LIMIT 1;

-- reports and dashboards data 3

-- numeric columns

-- Age
SELECT MIN(Age), MAX(Age), AVG(Age) FROM Reports_and_Dashboards_Data3_Cleaned;
WITH ordered AS (
  SELECT Age x, ROW_NUMBER() OVER (ORDER BY Age) rn, COUNT(Age) OVER () n
  FROM Reports_and_Dashboards_Data3_Cleaned WHERE Age IS NOT NULL
) SELECT AVG(x) AS median_Age FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT Age AS mode_Age, COUNT(*) AS freq FROM Reports_and_Dashboards_Data3_Cleaned GROUP BY Age ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(Age) AS std_Age, VAR_SAMP(Age) AS var_Age FROM Reports_and_Dashboards_Data3_Cleaned;

-- BMI
SELECT MIN(BMI), MAX(BMI), AVG(BMI) FROM Reports_and_Dashboards_Data3_Cleaned;
WITH ordered AS (
  SELECT BMI x, ROW_NUMBER() OVER (ORDER BY BMI) rn, COUNT(BMI) OVER () n
  FROM Reports_and_Dashboards_Data3_Cleaned WHERE BMI IS NOT NULL
) SELECT AVG(x) AS median_BMI FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT BMI AS mode_BMI, COUNT(*) AS freq FROM Reports_and_Dashboards_Data3_Cleaned GROUP BY BMI ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(BMI) AS std_BMI, VAR_SAMP(BMI) AS var_BMI FROM Reports_and_Dashboards_Data3_Cleaned;

-- Parity
SELECT MIN(Parity), MAX(Parity), AVG(Parity) FROM Reports_and_Dashboards_Data3_Cleaned;
WITH ordered AS (
  SELECT Parity x, ROW_NUMBER() OVER (ORDER BY Parity) rn, COUNT(Parity) OVER () n
  FROM Reports_and_Dashboards_Data3_Cleaned WHERE Parity IS NOT NULL
) SELECT AVG(x) AS median_Parity FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT Parity AS mode_Parity, COUNT(*) AS freq FROM Reports_and_Dashboards_Data3_Cleaned GROUP BY Parity ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(Parity) AS std_Parity, VAR_SAMP(Parity) AS var_Parity FROM Reports_and_Dashboards_Data3_Cleaned;

-- Children_Alive
SELECT MIN(Children_Alive), MAX(Children_Alive), AVG(Children_Alive) FROM Reports_and_Dashboards_Data3_Cleaned;
WITH ordered AS (
  SELECT Children_Alive x, ROW_NUMBER() OVER (ORDER BY Children_Alive) rn, COUNT(Children_Alive) OVER () n
  FROM Reports_and_Dashboards_Data3_Cleaned WHERE Children_Alive IS NOT NULL
) SELECT AVG(x) AS median_Children_Alive FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT Children_Alive AS mode_Children_Alive, COUNT(*) AS freq FROM Reports_and_Dashboards_Data3_Cleaned GROUP BY Children_Alive ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(Children_Alive) AS std_Children_Alive, VAR_SAMP(Children_Alive) AS var_Children_Alive FROM Reports_and_Dashboards_Data3_Cleaned;

-- Serum_FSH
SELECT MIN(Serum_FSH), MAX(Serum_FSH), AVG(Serum_FSH) FROM Reports_and_Dashboards_Data3_Cleaned;
WITH ordered AS (
  SELECT Serum_FSH x, ROW_NUMBER() OVER (ORDER BY Serum_FSH) rn, COUNT(Serum_FSH) OVER () n
  FROM Reports_and_Dashboards_Data3_Cleaned WHERE Serum_FSH IS NOT NULL
) SELECT AVG(x) AS median_Serum_FSH FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT Serum_FSH AS mode_Serum_FSH, COUNT(*) AS freq FROM Reports_and_Dashboards_Data3_Cleaned GROUP BY Serum_FSH ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(Serum_FSH) AS std_Serum_FSH, VAR_SAMP(Serum_FSH) AS var_Serum_FSH FROM Reports_and_Dashboards_Data3_Cleaned;

-- Endometrium_Thickness
SELECT MIN(Endometrium_Thickness), MAX(Endometrium_Thickness), AVG(Endometrium_Thickness) FROM Reports_and_Dashboards_Data3_Cleaned;
WITH ordered AS (
  SELECT Endometrium_Thickness x, ROW_NUMBER() OVER (ORDER BY Endometrium_Thickness) rn, COUNT(Endometrium_Thickness) OVER () n
  FROM Reports_and_Dashboards_Data3_Cleaned WHERE Endometrium_Thickness IS NOT NULL
) SELECT AVG(x) AS median_Endometrium_Thickness FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT Endometrium_Thickness AS mode_Endometrium_Thickness, COUNT(*) AS freq FROM Reports_and_Dashboards_Data3_Cleaned GROUP BY Endometrium_Thickness ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(Endometrium_Thickness) AS std_Endometrium_Thickness, VAR_SAMP(Endometrium_Thickness) AS var_Endometrium_Thickness FROM Reports_and_Dashboards_Data3_Cleaned;

-- Previous_Cycles
SELECT MIN(Previous_Cycles), MAX(Previous_Cycles), AVG(Previous_Cycles) FROM Reports_and_Dashboards_Data3_Cleaned;
WITH ordered AS (
  SELECT Previous_Cycles x, ROW_NUMBER() OVER (ORDER BY Previous_Cycles) rn, COUNT(Previous_Cycles) OVER () n
  FROM Reports_and_Dashboards_Data3_Cleaned WHERE Previous_Cycles IS NOT NULL
) SELECT AVG(x) AS median_Previous_Cycles FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT Previous_Cycles AS mode_Previous_Cycles, COUNT(*) AS freq FROM Reports_and_Dashboards_Data3_Cleaned GROUP BY Previous_Cycles ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(Previous_Cycles) AS std_Previous_Cycles, VAR_SAMP(Previous_Cycles) AS var_Previous_Cycles FROM Reports_and_Dashboards_Data3_Cleaned;

-- Oocytes_Retrieved
SELECT MIN(Oocytes_Retrieved), MAX(Oocytes_Retrieved), AVG(Oocytes_Retrieved) FROM Reports_and_Dashboards_Data3_Cleaned;
WITH ordered AS (
  SELECT Oocytes_Retrieved x, ROW_NUMBER() OVER (ORDER BY Oocytes_Retrieved) rn, COUNT(Oocytes_Retrieved) OVER () n
  FROM Reports_and_Dashboards_Data3_Cleaned WHERE Oocytes_Retrieved IS NOT NULL
) SELECT AVG(x) AS median_Oocytes_Retrieved FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT Oocytes_Retrieved AS mode_Oocytes_Retrieved, COUNT(*) AS freq FROM Reports_and_Dashboards_Data3_Cleaned GROUP BY Oocytes_Retrieved ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(Oocytes_Retrieved) AS std_Oocytes_Retrieved, VAR_SAMP(Oocytes_Retrieved) AS var_Oocytes_Retrieved FROM Reports_and_Dashboards_Data3_Cleaned;

-- Embryos_Transferred
SELECT MIN(Embryos_Transferred), MAX(Embryos_Transferred), AVG(Embryos_Transferred) FROM Reports_and_Dashboards_Data3_Cleaned;
WITH ordered AS (
  SELECT Embryos_Transferred x, ROW_NUMBER() OVER (ORDER BY Embryos_Transferred) rn, COUNT(Embryos_Transferred) OVER () n
  FROM Reports_and_Dashboards_Data3_Cleaned WHERE Embryos_Transferred IS NOT NULL
) SELECT AVG(x) AS median_Embryos_Transferred FROM ordered WHERE rn IN (FLOOR((n+1)/2), FLOOR((n+2)/2));
SELECT Embryos_Transferred AS mode_Embryos_Transferred, COUNT(*) AS freq FROM Reports_and_Dashboards_Data3_Cleaned GROUP BY Embryos_Transferred ORDER BY freq DESC LIMIT 1;
SELECT STDDEV_SAMP(Embryos_Transferred) AS std_Embryos_Transferred, VAR_SAMP(Embryos_Transferred) AS var_Embryos_Transferred FROM Reports_and_Dashboards_Data3_Cleaned;

-- categorical columns ( mode)

SELECT IVF_Start_Date AS mode_IVF_Start_Date, COUNT(*) FROM Reports_and_Dashboards_Data3_Cleaned GROUP BY IVF_Start_Date ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Menses_Regular AS mode_Menses_Regular, COUNT(*) FROM Reports_and_Dashboards_Data3_Cleaned GROUP BY Menses_Regular ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Stimulation_Protocol AS mode_Stimulation_Protocol, COUNT(*) FROM Reports_and_Dashboards_Data3_Cleaned GROUP BY Stimulation_Protocol ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Fertilization_Method AS mode_Fertilization_Method, COUNT(*) FROM Reports_and_Dashboards_Data3_Cleaned GROUP BY Fertilization_Method ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Embryo_Quality AS mode_Embryo_Quality, COUNT(*) FROM Reports_and_Dashboards_Data3_Cleaned GROUP BY Embryo_Quality ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Embryo_Type AS mode_Embryo_Type, COUNT(*) FROM Reports_and_Dashboards_Data3_Cleaned GROUP BY Embryo_Type ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Endometrial_Preparation AS mode_Endometrial_Preparation, COUNT(*) FROM Reports_and_Dashboards_Data3_Cleaned GROUP BY Endometrial_Preparation ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Sperm_Quality AS mode_Sperm_Quality, COUNT(*) FROM Reports_and_Dashboards_Data3_Cleaned GROUP BY Sperm_Quality ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Donor_Gamete_Used AS mode_Donor_Gamete_Used, COUNT(*) FROM Reports_and_Dashboards_Data3_Cleaned GROUP BY Donor_Gamete_Used ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Cycle_Type AS mode_Cycle_Type, COUNT(*) FROM Reports_and_Dashboards_Data3_Cleaned GROUP BY Cycle_Type ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Outcome AS mode_Outcome, COUNT(*) FROM Reports_and_Dashboards_Data3_Cleaned GROUP BY Outcome ORDER BY COUNT(*) DESC LIMIT 1;

