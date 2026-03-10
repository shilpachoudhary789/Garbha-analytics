# Garbha analytics

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np

'''eda''' 

data = pd.read_csv(r"C:/Users/hp/Downloads/Reports and Dashboard/Data/Reports and Dashboards Data.csv.csv", encoding='latin1')
data2 = pd.read_csv(r"C:/Users/hp/Downloads/Reports and Dashboard/Data/Reports and Dashboards Data2.csv.csv")
data3 = pd.read_csv(r"C:/Users/hp/Downloads/Reports and Dashboard/Data/Reports and Dashboards Data3.csv.csv")
elisa = pd.read_csv(r"C:/Users/hp/Downloads/Reports and Dashboard/Data/elisa.csv.csv")
mother = pd.read_csv(r"C:/Users/hp/Downloads/Reports and Dashboard/Data/mother.csv.csv",header= 1)
offspring = pd.read_csv(r"C:/Users/hp/Downloads/Reports and Dashboard/Data/offspring.csv.csv",header=1)


# ------- reports and dashboards data ---------

# first moment business decision

# mean

data_features = ["age", "Spouse AGE", "FSH", "E2", "PROGESTERONE", "BHCG 12",
                 "BHCG 14", "ENDOMETRIAL THICKNESS ON THE DAY OF TRANSFER", 
                 "NUMBER OF OOCYTES", "AMH"]
data_eda = data[data_features]

print(data.columns.tolist()) # getting column names

print(data_eda.dtypes) # datatypes of all columns

for col in data_eda.columns:
    print(col, data_eda[col].map(type).unique())

# converting all the datatypes into number
data_eda = data_eda.apply(pd.to_numeric, errors = "coerce")

# verifying the datatypes
print(data_eda.dtypes) # all converted into float

print("mean : \n", data_eda.mean())

# median
print("median : \n", data_eda.median())

# mode
data_features_mode = ['Clinical pregnancy: 0:0, Chemical: 1:1 Positive', "Live Birth", "Embryo Tranfer Day",
                      'Indication Hormonal = 1\n\nIndication Unexplained = 2\n\nIndication Male = 3\n\nIndication Other/Low = 4\n\nIndication DOR = 5\n\nIndication Tubal = 6',
                      'Number of Embryos Transferred']
data_eda_mode = data[data_features_mode]

print("mode : \n", data_eda_mode.mode())

# second moment business decision

print("standard deviation :\n", data_eda.std())
print("variance :\n",data_eda.var())

# third moment business decision

print("skewness : \n", data_eda.skew())

# fourth moment business decision

print("kurtosis ;\n", data_eda.kurt())

''' Graphical represenatation'''

# histogram for age distribution

sns.histplot(data_eda["age"], kde = True)
plt.title("age distribution of patients")
plt.show()

# scatter plot for AHM vs number of oocytes

sns.scatterplot(x = "AMH", y = "NUMBER OF OOCYTES", data = data_eda)
plt.title("AHM vs NUMBER OF OOCYTES")
plt.show()

# scatter plot for endometrial thickness vs BHCG 14

sns.scatterplot(x = "ENDOMETRIAL THICKNESS ON THE DAY OF TRANSFER", y = "BHCG 14", data = data_eda)
plt.title("Endometrial thichness vs BHCG 14 levels")
plt.show()

# boxplot - E2 outliers

sns.boxplot(x = data_eda["E2"])
plt.title("E2 harmone level distribution (outlier)")
plt.show()

# boxplot for clinical pregnancy vs AMH levels

sns.boxplot(x = 'Clinical pregnancy: 0:0, Chemical: 1:1 Positive', y = "AMH",
            data = data)
plt.figure(figsize = (6,5))
plt.title("clinical pregnancy vs AMH levels")
plt.xlabel("clinical pregnancy (0 = NO, 1 = Yes")
plt.ylabel("AMH")
plt.show()

# barchart for Embryo transfer day vs success count

sns.countplot(x = "Embryo Tranfer Day", 
              hue = "Clinical pregnancy: 0:0, Chemical: 1:1 Positive",
              data = data)
plt.title("Embryo transfer day vs pregnancy success")
plt.xlabel("Embryo transfer day (3 or 5")
plt.ylabel("count of patients")
plt.legend(title = "clinical pregnancy (0 = no, 1 = yes)")
plt.show()

# ---------reports and dashboard data1-------------

# *****mother

# first moment business decision

mother_features = ["age(year)","BMI(kg/m2)", "duration of fertility(year)", 
    "LH/FSH","TT(nmol/L)","E2(pmol/L)", "dose of Gn(IU)", "duration of Gn(d)", 
    "E2 on the HCG day(pmol/L)", "retrieved oocytes", "fertilization(%)", "good-quality embryo(%)", 
    "GA(weeks)"]
mother_eda = mother[mother_features]

print(mother.columns.tolist())

# mean
print("Mean:\n", mother_eda.mean(numeric_only=True))

# median
print("Median:\n", mother_eda.median(numeric_only=True))

# mode
mother_mode = mother[['types of infertility?1=primary?2=secondary?',
    "clinical pregnancy","miscarriage","live birth",
    "delivery(1=spontaneous delivery 2=CS 3=conversion to CS)"]].mode()
print("Mode:\n", mother_mode)


# second moment business decision

#standard deviation
print("Standard Deviation:\n", mother_eda.std(numeric_only=True))

# variance
print("Variance:\n", mother_eda.var(numeric_only=True))

# third moment business decision

# skewness
print("Skewness:\n", mother_eda.skew(numeric_only=True))

#fourth moment business decision

# kurtosis
print("Kurtosis:\n", mother_eda.kurt(numeric_only=True))

# ****offspring

offspring_features = ["weight(kg)","APGAR"]

offspring_eda = offspring[offspring_features]

# first moment business decision

# mean
print("Mean:\n", offspring_eda.mean(numeric_only=True))

# median
print("\nMedian:\n", offspring_eda.median(numeric_only=True))

offspring.columns

# mode
offspring_mode = offspring[[ "group(1=CHM 2=non-CHM)", 'gender?0=male 1=female?'
]].mode()

print("\nMode:\n", offspring_mode)


# second moment business decision

# standard deviation
print("\nStandard Deviation:\n", offspring_eda.std(numeric_only=True))

# variance
print("\nVariance:\n", offspring_eda.var(numeric_only=True))

# third moment business decision

# skewness
print("\nSkewness:\n", offspring_eda.skew(numeric_only=True))

# fourth moment business decision

#kurtosis
print("\nKurtosis:\n", offspring_eda.kurt(numeric_only=True))

# ****elisa

elisa_features = ["BMP15(pg/ml)", ' LIF(pg/ml)']
elisa_eda = elisa[elisa_features]

elisa.columns

# first moment business decision

#mean
print("Mean:\n", elisa_eda.mean(numeric_only=True))

#median
print("\nMedian:\n", elisa_eda.median(numeric_only=True))

# mode
print( elisa[["group(1=CHM 2=non-CHM)"]].mode())

# second moment business decision

# standard deviation
print("\nStandard Deviation:\n", elisa_eda.std(numeric_only=True))

# variance
print("\nVariance:\n", elisa_eda.var(numeric_only=True))

# third moment business decision

# skewness
print("\nSkewness:\n", elisa_eda.skew(numeric_only=True))

# fourth moment business decision

# kurtosis
print("\nKurtosis:\n", elisa_eda.kurt(numeric_only=True))

'''Graphical represenation'''

# age distribution of mother

plt.figure(figsize=(6,5))
sns.histplot(mother["age(year)"], kde=True)
plt.title("age distribution of mothers")
plt.xlabel("age (years)")
plt.ylabel("count")
plt.show()

# dose of gn vs retrieved oocytes

plt.figure(figsize=(6,5))
sns.scatterplot(x="dose of Gn(IU)", y="retrieved oocytes", data=mother)
plt.title("dose of Gn vs retrieved oocytes")
plt.xlabel("dose of Gn (IU)")
plt.ylabel("number of oocytes retrieved")
plt.show()

# good quality embryo vs clinical pregnancy

sns.boxplot(x="clinical pregnancy", y="good-quality embryo(%)", data=mother)
plt.title("good-quality embryo % vs clinical pregnancy")
plt.xlabel("Clinical Pregnancy (0 = No, 1 = Yes)")
plt.ylabel("Good-quality Embryo (%)")
plt.show()

# birth weight distribution

sns.countplot(x="group(1=CHM 2=non-CHM)", hue='gender?0=male 1=female?', data=offspring)
plt.title("Gender Distribution by Group")
plt.xlabel("Group (1 = CHM, 2 = Non-CHM)")
plt.ylabel("Count")
plt.legend(title="Gender (0 = Male, 1 = Female)")
plt.show()

# distribution of BMP15 levels

sns.histplot(elisa["BMP15(pg/ml)"], kde=True)
plt.title("distribution of BMP15 levels")
plt.xlabel("BMP15 (pg/ml)")
plt.ylabel("count")
plt.show()

# distribution of LIF level

sns.histplot(elisa[" LIF(pg/ml)"], kde=True)
plt.title("distribution of LIF levels")
plt.xlabel("LIF (pg/ml)")
plt.ylabel("count")
plt.show()

# BMP15 and LIF levels by group

sns.boxplot(x="group(1=CHM 2=non-CHM)", y="BMP15(pg/ml)", data=elisa)
plt.title("BMP15 levels by group (CHM vs Non-CHM)")
plt.xlabel("group (1 = CHM, 2 = Non-CHM)")
plt.ylabel("BMP15 (pg/ml)")
plt.show()

sns.boxplot(x="group(1=CHM 2=non-CHM)", y=" LIF(pg/ml)", data=elisa)
plt.title("LIF Levels by Group (CHM vs Non-CHM)")
plt.xlabel("Group (1 = CHM, 2 = Non-CHM)")
plt.ylabel("LIF (pg/ml)")
plt.show()

# ------ reprorts and dashboards data2 --------------

data2.columns

data2_eda = data2[['Age', 'Duration of infertility', 'BMI', 'AMH ng/ml', 'AFC',
                   'Days of stimulation', 'E2 on trigger day', 'P4 on trigger day',
                   'Total oocytes', 'Embryos formed', 'No of embryos frozen',
                   'transferred embryos', 'Result']]

# first moment business decsion

# mean
print("Mean:\n", data2_eda.mean(numeric_only=True))

# median
print("\nMedian:\n", data2_eda.median(numeric_only=True))

# mode
data2_mode = data2[['Day of embryo transfer', 'Clinical preg', 'Result']].mode()
print("\nMode:\n", data2_mode)


# second moment business decision

# standard deviation
print("\nStandard Deviation:\n", data2_eda.std(numeric_only=True))

# variance
print("\nVariance:\n", data2_eda.var(numeric_only=True))

# third moment business decision

# skewness
print("\nSkewness:\n", data2_eda.skew(numeric_only=True))

# fourth moment business decision

# kurtosis
print("\nKurtosis:\n", data2_eda.kurt(numeric_only=True))

''' Graphical representation'''

#Age Distribution of Patients

sns.histplot(data2['Age'], bins=10, kde=True, color='skyblue')
plt.title("Age Distribution of Patients")
plt.xlabel("Age (years)")
plt.ylabel("Count")
plt.show()

#AMH vs Total Oocytes Retrieved

plt.scatter(data2['AMH ng/ml'], data2['Total oocytes'])
plt.title("AMH vs Total Oocytes Retrieved")
plt.xlabel("AMH (ng/ml)")
plt.ylabel("Total Oocytes Retrieved")
plt.show()

#E2 on Trigger Day vs Embryos Formed

x = pd.to_numeric(data2['E2 on trigger day'], errors='coerce')
y = pd.to_numeric(data2['Embryos formed'], errors='coerce')
mask = x.notna() & y.notna()

plt.figure(figsize=(6,5))
plt.scatter(x[mask], y[mask])
plt.title("E2 Levels vs Number of Embryos Formed")
plt.xlabel("E2 on Trigger Day (pmol/L)")
plt.ylabel("Embryos Formed")
plt.show()

#Day of Embryo Transfer vs Clinical Pregnancy

sns.countplot(x='Day of embryo transfer', hue='Clinical preg', data=data2)
plt.title("Day of Embryo Transfer vs Clinical Pregnancy")
plt.xlabel("Embryo Transfer Day (D3 or D5)")
plt.ylabel("Number of Cases")
plt.legend(title='Clinical Pregnancy (0 = No, 1 = Yes)')
plt.show()

#Boxplot: Hormone Level vs Result

sns.boxplot(x='Result', y='E2 on trigger day', data=data2)
plt.title("E2 Levels vs Pregnancy Result")
plt.xlabel("Pregnancy Result (0 = Negative, 1 = Positive)")
plt.ylabel("E2 on Trigger Day (pmol/L)")
plt.show()

# reports and dashboard data 3

data4_eda = data3[[
    'Age (In Years)',
    'Body Mass Index (BMI)',
    'Serum FSH value (In IU/L)',
    'Serum AMH value (In pmol/L)',
    'Value of antral follicle count',
    'Serum estradiol value (in pmol/L)',
    'Post ovulatory thickness of the endometrium on day of HCG',
    'Number of oocytes retrieved',
    'Number of embryo(s) transfered? ',
]].apply(pd.to_numeric, errors='coerce')

# first moment business decision

# Mean
print("Mean:\n", data4_eda.mean(numeric_only=True))

#  Median
print("\nMedian:\n", data4_eda.median(numeric_only=True))

# Mode (for categorical-like columns)
data4_mode = data3[['Method of fertilization',
                    'Type of embryo transferred',
                    'Outcome',
                    'Pregnancy outcome']].mode()
print("\nMode:\n", data4_mode)

# second moment business decision

# Standard Deviation
print("\nStandard Deviation:\n", data4_eda.std(numeric_only=True))

#  Variance
print("\nVariance:\n", data4_eda.var(numeric_only=True))

# third moment business decision

#  Skewness
print("\nSkewness:\n", data4_eda.skew(numeric_only=True))

# fourth moment business decision

# Kurtosis
print("\nKurtosis:\n", data4_eda.kurt(numeric_only=True))

''' Graphical representation'''

# Age Distribution of Patients

sns.set_style("whitegrid")

plt.figure(figsize=(6,5))
sns.histplot(data3['Age (In Years)'], bins=10, kde=True, color='skyblue')
plt.title("Age Distribution of Patients")
plt.xlabel("Age (years)")
plt.ylabel("Count")
plt.show()

# AMH vs Oocytes Retrieved

plt.figure(figsize=(6,5))
sns.scatterplot(x=pd.to_numeric(data3['Serum AMH value (In pmol/L)'], errors='coerce'),
                y=pd.to_numeric(data3['Number of oocytes retrieved'], errors='coerce'),
                alpha=0.8)
plt.title("AMH vs Number of Oocytes Retrieved")
plt.xlabel("AMH (pmol/L)")
plt.ylabel("Oocytes Retrieved")
plt.show()

# Endometrial Thickness vs Pregnancy Outcome

plt.figure(figsize=(6,5))
sns.boxplot(x='Pregnancy outcome',
            y=pd.to_numeric(data3['Post ovulatory thickness of the endometrium on day of HCG'], errors='coerce'),
            data=data3)
plt.title("Endometrial Thickness vs Pregnancy Outcome")
plt.xlabel("Pregnancy Outcome")
plt.ylabel("Endometrial Thickness (mm)")
plt.show()

# Method of Fertilization vs Outcome

plt.figure(figsize=(6,5))
sns.countplot(x='Method of fertilization', hue='Outcome', data=data3)
plt.title("Method of Fertilization vs Outcome")
plt.xlabel("Method of Fertilization")
plt.ylabel("Number of Cases")
plt.legend(title='Outcome')
plt.show()

#BMI vs AMH Levels

plt.figure(figsize=(6,5))
sns.scatterplot(x=pd.to_numeric(data3['Body Mass Index (BMI)'], errors='coerce'),
                y=pd.to_numeric(data3['Serum AMH value (In pmol/L)'], errors='coerce'))
plt.title("BMI vs AMH Levels")
plt.xlabel("BMI")
plt.ylabel("AMH (pmol/L)")
plt.show()

'''preprocessing '''

# ------------ reports and dashboards data--------------

# feature selection

data.columns

# selecting imported features

df_selected = data[["PATIENT NAME AND SURNAME", "age", "Spouse AGE",
    "Clinical pregnancy: 0:0, Chemical: 1:1 Positive", 
    "Live Birth", "WEEK OF BIRTH", "Neonatal Death", "ABORTION",
    "BHCG 12", "BHCG 14", "BHCG 12-14% increase", 
   'Indication Hormonal = 1\n\nIndication Unexplained = 2\n\nIndication Male = 3\n\nIndication Other/Low = 4\n\nIndication DOR = 5\n\nIndication Tubal = 6', "FSH", "E2", "PROGESTERONE", "AMH",
    "NUMBER OF OOCYTES", "ENDOMETRIAL THICKNESS ON THE DAY OF TRANSFER",
    "Number of Embryos Transferred"]]

df_selected.info()
df_selected.describe()

# data cleansing and organising
# rename the long columns

df_selected = df_selected.rename(columns={"PATIENT NAME AND SURNAME": "Patient_Name",
    "age": "Age",
    "Spouse AGE": "Spouse_Age",
    "Clinical pregnancy: 0:0, Chemical: 1:1 Positive": "Clinical_Pregnancy",
    "Live Birth": "Live_Birth",
    "WEEK OF BIRTH": "Week_of_Birth",
    "Neonatal Death": "Neonatal_Death",
    "ABORTION": "Abortion",
    "BHCG 12": "BHCG_12",
    "BHCG 14": "BHCG_14",
    "BHCG 12-14% increase": "BHCG_Increase",
    "Indication Hormonal = 1\n\nIndication Unexplained = 2\n\nIndication Male = 3\n\nIndication Other/Low = 4\n\nIndication DOR = 5\n\nIndication Tubal = 6": "Indication_Type",
    "FSH": "FSH",
    "E2": "E2",
    "PROGESTERONE": "Progesterone",
    "AMH": "AMH",
    "NUMBER OF OOCYTES": "Num_Oocytes",
    "ENDOMETRIAL THICKNESS ON THE DAY OF TRANSFER": "Endometrial_Thickness",
    "Number of Embryos Transferred": "Embryos_Transferred"})

# type casting and duplicate handling

df_selected.dtypes

df_selected["Clinical_Pregnancy"] = (
    df_selected["Clinical_Pregnancy"]
    .replace({
        "0": 0, "1": 1,       # already numeric strings
        "Chemical": 0,        # means no/negative
        "Positive": 1,        # means yes/positive
        "N": 0, "Y": 1,       # if any yes/no type values
        "No": 0, "Yes": 1, 
        " ": np.nan, "-": np.nan  # clean blanks or hyphens
    })
)

col = "Clinical_Pregnancy"

# extract the number inside the parentheses
df_selected[col] = (df_selected[col]
      .astype(str)
      .str.extract(r'\((\d)\)', expand=False)  # capture the digit inside ()
      .fillna(df_selected[col].astype(str).str.extract(r'(\d)', expand=False))  # fallback if no brackets
      .astype("Int64"))

df_selected["Abortion"] = (
    df_selected["Abortion"]
      .astype(str)  # make everything a string
      .str.strip()  # remove extra spaces like '     '
      .replace({
          "Yes": 1, "Y": 1,
          "No": 0, "N": 0,
          "1(1)": 1, "1(0)": 0, "0(1)": 1, "0(0)": 0,  # handle any paired forms
          "": np.nan, "-": np.nan, "NA": np.nan, "None": np.nan
      })
)

df_selected["Abortion"] = pd.to_numeric(df_selected["Abortion"], errors='coerce').astype("Int64")

df_selected["Abortion"] = df_selected["Abortion"].replace(r'^\s*$', np.nan, regex=True)

col = "BHCG_Increase"

# remove % sign, turn error tokens/spaces into NaN, then cast
df_selected[col] = (df_selected[col].astype(str).str.replace('%', '', regex=False)
      .replace({r'^\s*$': np.nan, r'^#DIV/0!$': np.nan, r'^-$': np.nan}, regex=True) )

df_selected["E2"] = (df_selected["E2"]
    .astype(str)                                 # convert everything to string
    .replace({r'^\s*$': np.nan, "_": np.nan, "-": np.nan}, regex=True))  # turn blanks, _, - into NaN

df_selected["E2"] = (df_selected["E2"]
      .astype(str)                                     # ensure string
      .str.replace(r"[<>]", "", regex=True)            # remove < or > symbols
      .replace({r'^\s*$': np.nan, "_": np.nan, "-": np.nan}, regex=True))

df_selected["Progesterone"] = (df_selected["Progesterone"]
      .astype(str)                                      # make sure it's string
      .str.replace(",", ".", regex=False)               # change commas to dots
      .str.replace(r"[<>]", "", regex=True)             # remove < or > if present
      .replace({r'^\s*$': np.nan, "_": np.nan, "-": np.nan}, regex=True))

col = "Num_Oocytes"

# remove % sign, turn error tokens/spaces into NaN, then cast
df_selected[col] = (df_selected[col].astype(str).str.replace('%', '', regex=False)
      .replace({r'^\s*$': np.nan, r'^#DIV/0!$': np.nan, r'^-$': np.nan}, regex=True))

col = "Endometrial_Thickness"

df_selected[col] = (df_selected[col]
      .astype(str)                                    # make sure all entries are strings
      .str.replace(",", ".", regex=False)             # convert commas to decimal dots
      .str.replace(r"[<>]", "", regex=True)           # remove < and > signs if any
      .replace({r'^\s*$': np.nan, "_": np.nan, "-": np.nan}, regex=True))  # blanks, _, - → NaN

df_selected = df_selected.astype({
    "E2": "float",
    "Progesterone": "float",
    "Num_Oocytes": "float",
    "BHCG_Increase": "float",
    "Endometrial_Thickness": "float",
    "Live_Birth": "int",
    "Neonatal_Death": "int",
    "Patient_Name": "str"
})

df_selected["Clinical_Pregnancy"] = (
    df_selected["Clinical_Pregnancy"].astype("Int64")
)

df_selected["Num_Oocytes"] = pd.to_numeric(df_selected["Num_Oocytes"], errors="coerce")
df_selected["Patient_Name"].astype(str)

df_selected.dtypes

duplicate = df_selected.duplicated() 
print(sum(duplicate))   # no duplicates

# missing values

df_selected.isna().sum().sort_values(ascending=False)

# binary/categorical
# abortion column
df_selected["Abortion"] = df_selected["Abortion"].fillna(0)            # 0 = No
df_selected["Clinical_Pregnancy"] = df_selected["Clinical_Pregnancy"].fillna(0)

# indication type - mode imputer
from sklearn.impute import SimpleImputer
mode_imputer = SimpleImputer(missing_values = np.nan, strategy = "most_frequent")
df_selected['Indication_Type'] = pd.DataFrame(mode_imputer.fit_transform(df_selected[["Indication_Type"]]))

# median imputer

numeric_cols = ["Spouse_Age", "BHCG_12", "BHCG_14", "BHCG_Increase",
    "FSH", "E2", "Progesterone", "Num_Oocytes",
    "Endometrial_Thickness", "Embryos_Transferred"]

median_imputer = SimpleImputer(strategy="median")
df_selected[numeric_cols] = median_imputer.fit_transform(df_selected[numeric_cols])

# dropping columns
df_selected.drop(["AMH", "Week_of_Birth"], axis = 1, inplace = True)

# outliers treatment

cols = ["Age", "Spouse_Age",
    "BHCG_12", "BHCG_14", "BHCG_Increase",
    "FSH", "E2", "Progesterone",
    "Num_Oocytes", "Endometrial_Thickness",
    "Embryos_Transferred"]

for col in cols:
    IQR = df_selected[col].quantile(0.75) - df_selected[col].quantile(0.25)
    lower = df_selected[col].quantile(0.25) - 1.5 * IQR
    upper = df_selected[col].quantile(0.75) + 1.5 * IQR
    df_selected["is_outlier_" + col] = np.where(
        (df_selected[col] < lower) | (df_selected[col] > upper),
        True, False)
    print(f"{col} → {df_selected['is_outlier_' + col].sum()} outliers")
    
from feature_engine.outliers import Winsorizer

# select the numeric columns where you want to cap outliers
cap_cols = ["BHCG_12", "BHCG_14", "FSH", "E2", "Progesterone", "Num_Oocytes"]

# create the winsorizer object
winsor_iqr = Winsorizer(
    capping_method='iqr',   # use IQR method
    tail='both',             # cap both lower & upper tails
    fold=1.5,                # standard IQR range
    variables=cap_cols)       # columns to cap

# fit and transform the data
df_selected[cap_cols] = winsor_iqr.fit_transform(df_selected[cap_cols])

# zero variance check

zero_var = df_selected.columns[df_selected.nunique() <= 1]
print(zero_var)

df_selected.drop(columns=zero_var, inplace=True)

# ------------ reports and dashboards data 2 ----------------------

# sheet name : mother

mother.columns

# renaming columns

mother.rename(columns={
    'group(1=CHM 2=non-CHM)': 'Group',
    'age(year)': 'Age',
    'BMI(kg/m2)': 'BMI',
    'duration of fertility(year)': 'Fertility_Duration',
    'types of infertility?1=primary?2=secondary?': 'Infertility_Type',
    'LH/FSH': 'LH_FSH_Ratio',
    'TT(nmol/L)': 'Testosterone',
    'E2(pmol/L)': 'E2_Level',
    'dose of Gn(IU)': 'Gn_Dose',
    'duration of Gn(d)': 'Gn_Duration',
    'E2 on the HCG day(pmol/L)': 'E2_HCG_Day',
    'retrieved oocytes': 'Retrieved_Oocytes',
    'fertilization(%)': 'Fertilization_Rate',
    'good-quality embryo(%)': 'Good_Embryo_Rate',
    'clinical pregnancy': 'Clinical_Pregnancy',
    'miscarriage': 'Miscarriage',
    'live birth': 'Live_Birth',
    'GA(weeks)': 'Gestational_Age',
    'delivery(1=spontaneous delivery 2=CS 3=conversion to CS)': 'Delivery_Type'
}, inplace=True)

cols_to_keep = [
    'group(1=CHM 2=non-CHM)', 'age(year)', 'BMI(kg/m2)',
    'duration of fertility(year)', 'types of infertility?1=primary?2=secondary?',
    'LH/FSH', 'TT(nmol/L)', 'E2(pmol/L)', 'dose of Gn(IU)', 'duration of Gn(d)',
    'E2 on the HCG day(pmol/L)', 'retrieved oocytes', 'fertilization(%)',
    'good-quality embryo(%)', 'clinical pregnancy', 'miscarriage',
    'live birth', 'GA(weeks)',
    'delivery(1=spontaneous delivery 2=CS 3=conversion to CS)'
]

# Drop everything NOT in cols_to_keep
mother = mother.drop(columns=[col for col in mother.columns if col not in cols_to_keep])


# type casting

mother.dtypes

#  Testosterone → float
mother["Testosterone"] = (mother["Testosterone"]
      .astype(str)
      .str.replace(",", ".", regex=False)      # 8,7 -> 8.7
      .str.replace(r"[<>]", "", regex=True)   # <2.0 -> 2.0
      .str.strip()
      .replace({r"^$": np.nan, "_": np.nan, "-": np.nan, "NA": np.nan, "None": np.nan}, regex=True))
mother["Testosterone"] = pd.to_numeric(mother["Testosterone"], errors="coerce")

for col in ["Miscarriage", "Live_Birth", "Delivery_Type"]:
    mother[col] = pd.to_numeric(mother[col], errors="coerce").astype("Int64")

# missing values

mother.isna().sum().sort_values(ascending=False)

# Filling logical 0s
mother["Miscarriage"].fillna(0, inplace=True)
mother["Live_Birth"].fillna(0, inplace=True)

# Testosterone missing with median

median_imputer = SimpleImputer(strategy="median")
mother["Testosterone"] = median_imputer.fit_transform(mother[["Testosterone"]])

# outlier treatment

cap_cols = ["BMI", "LH_FSH_Ratio", "Testosterone", "E2_Level",
    "Gn_Dose", "Gn_Duration", "E2_HCG_Day",
    "Retrieved_Oocytes", "Fertilization_Rate", "Good_Embryo_Rate"]

# loop through each column and cap outliers
for col in cap_cols:
    Q1 = mother[col].quantile(0.25)
    Q3 = mother[col].quantile(0.75)
    IQR = Q3 - Q1

    lower_limit = Q1 - 1.5 * IQR
    upper_limit = Q3 + 1.5 * IQR

    mother[col] = np.where(
        mother[col] < lower_limit, lower_limit,
        np.where(mother[col] > upper_limit, upper_limit, mother[col])
    )

    print(f"{col}: Capped values below {lower_limit:.2f} and above {upper_limit:.2f}")

for col in cap_cols:
    outliers = mother[(mother[col] < lower) | (mother[col] > upper)]
    print(f"{col}: {len(outliers)} outliers remaining")
    
for col in ['BMI','E2_Level','Gn_Dose','Gn_Duration','E2_HCG_Day']:
    Q1 = mother[col].quantile(0.25)
    Q3 = mother[col].quantile(0.75)
    IQR = Q3 - Q1
    lower = Q1 - 3 * IQR
    upper = Q3 + 3 * IQR
    mother[col] = np.where(mother[col] < lower, lower,
                       np.where(mother[col] > upper, upper, mother[col]))

# binning/ encoding

# mapping dictionaries
group_map = {1: 'CHM', 2: 'Non-CHM'}
infertility_map = {1: 'Primary', 2: 'Secondary'}
delivery_map = {1: 'Spontaneous', 2: 'C-Section', 3: 'Converted C-Section'}

# apply maps
mother['Group'] = mother['Group'].map(group_map)
mother['Infertility_Type'] = mother['Infertility_Type'].map(infertility_map)
mother['Delivery_Type'] = mother['Delivery_Type'].map(delivery_map)

# zero variance
zero_var = mother.columns[mother.nunique() <= 1]
print("Zero variance columns:", zero_var.tolist())

# sheet name : offspring

offspring.columns

offspring = offspring.drop(columns=['note'])

# renaming columns

offspring.rename(columns={
    'group(1=CHM 2=non-CHM)': 'Group',
    'weight(kg)': 'Weight_kg',
    'APGAR': 'APGAR_Score',
    'gender?0=male 1=female?': 'Gender'}, inplace=True)

# type casting

offspring.dtypes

# missing values

offspring.isna().sum()

# drop rows where all main baby details are missing
offspring = offspring.dropna(subset=['Weight_kg', 'APGAR_Score', 'Gender'])

# verify
print(offspring.isna().sum())
print("New shape:", offspring.shape)

# outlier 

check_cols = ["Weight_kg", "APGAR_Score"]

for col in check_cols:
    Q1 = offspring[col].quantile(0.25)
    Q3 = offspring[col].quantile(0.75)
    IQR = Q3 - Q1

    lower_limit = Q1 - 1.5 * IQR
    upper_limit = Q3 + 1.5 * IQR

    offspring[col] = np.where(
        offspring[col] < lower_limit, lower_limit,
        np.where(offspring[col] > upper_limit, upper_limit, offspring[col])
    )

    print(f"{col}: capped values below {lower_limit:.2f} and above {upper_limit:.2f}")

for col in check_cols:
    Q1 = offspring[col].quantile(0.25)
    Q3 = offspring[col].quantile(0.75)
    IQR = Q3 - Q1
    lower = Q1 - 1.5 * IQR
    upper = Q3 + 1.5 * IQR
    outliers = offspring[(offspring[col] < lower) | (offspring[col] > upper)]
    print(f"{col}: {len(outliers)} outliers remaining")

# sheet name : elisa

elisa.columns
elisa = elisa.drop(columns=['Unnamed: 3'])

# renaming columns

elisa.rename(columns={
    'group(1=CHM 2=non-CHM)': 'Group',
    'BMP15(pg/ml)': 'BMP15_pgml',
    ' LIF(pg/ml)': 'LIF_pgml'
}, inplace=True)

# missing values

elisa.isna().sum()

# type casting

elisa.dtypes

# columns to check
check_cols = ['BMP15_pgml', 'LIF_pgml']

# apply IQR capping
for col in check_cols:
    Q1 = elisa[col].quantile(0.25)
    Q3 = elisa[col].quantile(0.75)
    IQR = Q3 - Q1

    lower_limit = Q1 - 1.5 * IQR
    upper_limit = Q3 + 1.5 * IQR

    elisa[col] = np.where(
        elisa[col] < lower_limit, lower_limit,
        np.where(elisa[col] > upper_limit, upper_limit, elisa[col])
    )

    print(f"{col}: capped values below {lower_limit:.2f} and above {upper_limit:.2f}")

for col in check_cols:
    Q1 = elisa[col].quantile(0.25)
    Q3 = elisa[col].quantile(0.75)
    IQR = Q3 - Q1
    lower = Q1 - 1.5 * IQR
    upper = Q3 + 1.5 * IQR
    outliers = elisa[(elisa[col] < lower) | (elisa[col] > upper)]
    print(f"{col}: {len(outliers)} outliers remaining")

# -------------- reports and dashboards data2 --------------------

data2.columns

# selected columns

df2_selected = data2[['Fc no', 'Cycle no', 'Age', 'Duration of infertility', 'BMI',
 'Primary infertility', 'Male/female/combined', 'Cause', 'AFC', 'AMH ng/ml',
 'Protocol', 'Stimulation', 'Days of stimulation', 'E2 on trigger day',
 'P4 on trigger day', 'Trigger', 'Total oocytes', 'M2 oocytes', 'Sperm',
 'Embryos formed', 'No of embryos frozen', 'Embryos',
 'Day of embryo transfer', 'transferred embryos', 'Result', 'Biochemical',
 'Clinical preg', 'Miscarriage', 'Ongoing', 'Twin', 'Triplet']]

# renaming the columns

df2_selected.rename(columns={
    'Fc no': 'Case_ID',
    'Cycle no': 'Cycle_No',
    'Age': 'Age',
    'Duration of infertility': 'Infertility_Duration',
    'BMI': 'BMI',
    'Primary infertility': 'Primary_Infertility',
    'Male/female/combined': 'Infertility_Type',
    'Cause': 'Infertility_Cause',
    'AFC': 'Antral_Follicle_Count',
    'AMH ng/ml': 'AMH',
    'Protocol': 'Protocol_Type',
    'Stimulation': 'Stimulation_Type',
    'Days of stimulation': 'Stimulation_Days',
    'E2 on trigger day': 'E2_Trigger',
    'P4 on trigger day': 'P4_Trigger',
    'Trigger': 'Trigger_Type',
    'Total oocytes': 'Total_Oocytes',
    'M2 oocytes': 'Mature_Oocytes',
    'Sperm': 'Sperm_Source',
    'Embryos formed': 'Embryos_Formed',
    'No of embryos frozen': 'Embryos_Frozen',
    'Embryos': 'Embryo_Quality',
    'Day of embryo transfer': 'Transfer_Day',
    'transferred embryos': 'Embryos_Transferred',
    'Result': 'Cycle_Result',
    'Biochemical': 'Biochemical_Pregnancy',
    'Clinical preg': 'Clinical_Pregnancy',
    'Miscarriage': 'Miscarriage',
    'Ongoing': 'Ongoing_Pregnancy',
    'Twin': 'Twin_Pregnancy',
    'Triplet': 'Triplet_Pregnancy'
}, inplace=True)

# type casting

df2_selected.dtypes

# integer columns (whole numbers)
int_cols = [
    'Age', 'Infertility_Duration', 'Antral_Follicle_Count', 'Stimulation_Days',
    'Total_Oocytes', 'Mature_Oocytes', 'Embryos_Formed', 'Embryos_Frozen',
    'Embryos_Transferred', 'Cycle_Result', 'Biochemical_Pregnancy',
    'Clinical_Pregnancy', 'Miscarriage', 'Ongoing_Pregnancy',
    'Twin_Pregnancy', 'Triplet_Pregnancy'
]

# float columns (decimal values)
float_cols = [
    'BMI', 'AMH', 'E2_Trigger', 'P4_Trigger'
]

# string (categorical/text) columns
str_cols = [
    'Case_ID', 'Cycle_No', 'Primary_Infertility', 'Infertility_Type',
    'Infertility_Cause', 'Protocol_Type', 'Stimulation_Type',
    'Trigger_Type', 'Sperm_Source', 'Embryo_Quality', 'Transfer_Day']

# convert integer columns
for col in int_cols:
    df2_selected[col] = pd.to_numeric(df2_selected[col], errors='coerce').astype('Int64')

# convert float columns
for col in float_cols:
    df2_selected[col] = pd.to_numeric(df2_selected[col], errors='coerce').astype('float64')

# convert string columns
for col in str_cols:
    df2_selected[col] = df2_selected[col].astype('string')
    
# verify
df2_selected.dtypes

# missing values

df2_selected.isna().sum()

# drop completely blank or invalid rows
df2_selected.dropna(subset=['Case_ID', 'Cycle_No', 'Age'], inplace=True)

# fill numeric columns with median
median_cols = ['Antral_Follicle_Count', 'AMH', 'E2_Trigger', 'P4_Trigger']
for col in median_cols:
    df2_selected[col].fillna(df2_selected[col].median(), inplace=True)
    
# fill categorical columns with mode
cat_cols = ['Protocol_Type', 'Stimulation_Type', 'Trigger_Type', 
            'Sperm_Source', 'Embryo_Quality', 'Transfer_Day']

for col in cat_cols:
    df2_selected[col].fillna(df2_selected[col].mode()[0], inplace=True)
    
#fill count/quantity columns with 0
count_cols = ['Total_Oocytes', 'Mature_Oocytes', 'Embryos_Formed', 
              'Embryos_Frozen', 'Embryos_Transferred']
for col in count_cols:
    df2_selected[col].fillna(0, inplace=True)
    
# fill binary outcome columns with 0
binary_cols = ['Biochemical_Pregnancy', 'Clinical_Pregnancy', 
               'Miscarriage', 'Ongoing_Pregnancy', 
               'Twin_Pregnancy', 'Triplet_Pregnancy']
for col in binary_cols:
    df2_selected[col].fillna(0, inplace=True)

# fill Good blast (categorical) with mode
df2_selected['Good blast'].fillna(df2_selected['Good blast'].mode()[0], inplace=True)

# fill Remain set (numeric) with 0
df2_selected['Remain set'].fillna(0, inplace=True)

# fill Ectopic (binary outcome) with 0
data2['Ectopic'].fillna(0, inplace=True)

# verify final result
df2_selected.isna().sum()

# outliers treatment

num_cols = [
    'Age', 'BMI', 'Infertility_Duration', 'Antral_Follicle_Count',
    'AMH', 'E2_Trigger', 'P4_Trigger', 'Stimulation_Days',
    'Total_Oocytes', 'Mature_Oocytes', 'Embryos_Formed',
    'Embryos_Frozen', 'Embryos_Transferred'
]

outlier_summary = {}

for col in num_cols:
    Q1 = df2_selected[col].quantile(0.25)
    Q3 = df2_selected[col].quantile(0.75)
    IQR = Q3 - Q1
    lower_limit = Q1 - 1.5 * IQR
    upper_limit = Q3 + 1.5 * IQR
    
    outliers = df2_selected[(df2_selected[col] < lower_limit) | (df2_selected[col] > upper_limit)]
    outlier_summary[col] = len(outliers)

# display total outliers per column
outlier_summary

# remove column with low variation
num_cols = [
    'Age', 'BMI', 'Infertility_Duration', 'Antral_Follicle_Count',
    'AMH', 'E2_Trigger', 'P4_Trigger', 'Stimulation_Days',
    'Total_Oocytes', 'Mature_Oocytes', 'Embryos_Formed', 'Embryos_Frozen'
]

# apply winsorization again
from feature_engine.outliers import Winsorizer

winsor = Winsorizer(
    capping_method='iqr',
    tail='both',
    fold=1.5,
    variables=num_cols
)

df2_selected = winsor.fit_transform(df2_selected)

df2_selected = df2_selected.astype({col: 'float64' for col in df2_selected.columns if df2_selected[col].dtype.name == 'Int64'})

# zero variance

zero_var_cols = df2_selected.columns[df2_selected.nunique() <= 1]
print(zero_var_cols)

# ---------------reports and dashboards data3---------------
data3.columns

# create a clean subset with only relevant columns
df3_selected = data3[[

    #  Patient & Baseline Info
    'Date of first presentation for IVF',
    'Age (In Years)',
    'Body Mass Index (BMI)',
    'Parity',
    'Number of children alive',
    'Is menses regular?',
    'Menstrual cycle length',

    #  Ovarian Reserve & Hormones
    'Value of antral follicle count',
    'Serum FSH value (In IU/L)',
    'Serum AMH value (In pmol/L)',
    'Serum estradiol value (in pmol/L)',
    'Type of stimulation protocol',
    'Post ovulatory thickness of the endometrium on day of HCG',

    #  Egg & Embryo Details
    'Number of cycles before successful or attempt at oocyte retrival?',
    'Number of oocytes retrieved',
    'Method of fertilization',
    'Quality of embryo used',
    'Number of embryo(s) transfered? ',
    'Type of embryo transferred',
    'Type of endometrial preparation before transfer',

    #  Donor & Male Factors
    'Male factor: Sperm Quality',
    'Was donor gamate used?',
    'Type of cycle',

    #  Complications & Outcomes
    'Complications developed',
    'Complications developed/OHSS',
    'Complications developed/Ectopic pregnancy',
    'Complications developed/Multiple pregnancy',
    'Outcome',
    'Pregnancy outcome',
    'Pregnancy outcome: Number of fetuses',
    'Mode of delivery',
    'Any congenital abnormality in the fetus/baby?'

]]

df3_selected.shape
df3_selected.columns.tolist()

df3_selected.rename(columns={

    #  Patient & Baseline Info
    'Date of first presentation for IVF': 'IVF_Start_Date',
    'Age (In Years)': 'Age',
    'Body Mass Index (BMI)': 'BMI',
    'Parity': 'Parity',
    'Number of children alive': 'Children_Alive',
    'Is menses regular?': 'Menses_Regular',
    'Menstrual cycle length': 'Cycle_Length',

    #  Ovarian Reserve & Hormones
    'Value of antral follicle count': 'Antral_Follicle_Count',
    'Serum FSH value (In IU/L)': 'Serum_FSH',
    'Serum AMH value (In pmol/L)': 'Serum_AMH',
    'Serum estradiol value (in pmol/L)': 'Serum_Estradiol',
    'Type of stimulation protocol': 'Stimulation_Protocol',
    'Post ovulatory thickness of the endometrium on day of HCG': 'Endometrium_Thickness',

    #  Egg & Embryo Details
    'Number of cycles before successful or attempt at oocyte retrival?': 'Previous_Cycles',
    'Number of oocytes retrieved': 'Oocytes_Retrieved',
    'Method of fertilization': 'Fertilization_Method',
    'Quality of embryo used': 'Embryo_Quality',
    'Number of embryo(s) transfered? ': 'Embryos_Transferred',
    'Type of embryo transferred': 'Embryo_Type',
    'Type of endometrial preparation before transfer': 'Endometrial_Preparation',

    #  Donor & Male Factors
    'Male factor: Sperm Quality': 'Sperm_Quality',
    'Was donor gamate used?': 'Donor_Gamete_Used',
    'Type of cycle': 'Cycle_Type',

    #  Complications & Outcomes
    'Complications developed': 'Complications',
    'Complications developed/OHSS': 'OHSS',
    'Complications developed/Ectopic pregnancy': 'Ectopic_Pregnancy',
    'Complications developed/Multiple pregnancy': 'Multiple_Pregnancy',
    'Outcome': 'Outcome',
    'Pregnancy outcome': 'Pregnancy_Outcome',
    'Pregnancy outcome: Number of fetuses': 'Number_of_Fetuses',
    'Mode of delivery': 'Delivery_Mode',
    'Any congenital abnormality in the fetus/baby?': 'Congenital_Abnormality'

}, inplace=True)

# type casting

df3_selected.dtypes

#  Date column
df3_selected['IVF_Start_Date'] = pd.to_datetime(df3_selected['IVF_Start_Date'], errors='coerce')

#  Numeric columns (int or float)
int_cols = [
    'Age', 'Parity', 'Children_Alive', 'Previous_Cycles',
    'Oocytes_Retrieved', 'Embryos_Transferred', 'Number_of_Fetuses'
]

float_cols = [
    'BMI', 'Cycle_Length', 'Antral_Follicle_Count', 'Serum_FSH',
    'Serum_AMH', 'Serum_Estradiol', 'Endometrium_Thickness'
]

for col in int_cols:
    df3_selected[col] = pd.to_numeric(df3_selected[col], errors='coerce').round().astype('Int64')

for col in float_cols:
    df3_selected[col] = pd.to_numeric(df3_selected[col], errors='coerce').astype('float64')

#  Text / categorical columns
str_cols = [
    'Menses_Regular', 'Stimulation_Protocol', 'Fertilization_Method',
    'Embryo_Quality', 'Embryo_Type', 'Endometrial_Preparation',
    'Sperm_Quality', 'Donor_Gamete_Used', 'Cycle_Type',
    'Complications', 'OHSS', 'Ectopic_Pregnancy', 'Multiple_Pregnancy',
    'Outcome', 'Pregnancy_Outcome', 'Delivery_Mode', 'Congenital_Abnormality'
]

for col in str_cols:
    df3_selected[col] = df3_selected[col].astype('string')

#  verify
df3_selected.dtypes

# missing values

df3_selected.isna().sum()

# find columns with >50% missing values
threshold = 0.5
high_missing = df3_selected.columns[df3_selected.isna().mean() > threshold]
high_missing

df3_selected.drop(columns=high_missing, inplace=True)

from sklearn.impute import SimpleImputer

# numeric (median)
num_cols = ['BMI', 'Serum_FSH', 'Endometrium_Thickness', 'Previous_Cycles', 'Oocytes_Retrieved', 'Embryos_Transferred']
median_imputer = SimpleImputer(strategy='median')
df3_selected[num_cols] = median_imputer.fit_transform(df3_selected[num_cols])

# categorical (mode)
cat_cols = [
    'Menses_Regular', 'Stimulation_Protocol', 'Fertilization_Method',
    'Embryo_Quality', 'Embryo_Type', 'Endometrial_Preparation',
    'Sperm_Quality', 'Donor_Gamete_Used', 'Cycle_Type', 'Outcome'
]
mode_imputer = SimpleImputer(strategy='most_frequent')
df3_selected[cat_cols] = mode_imputer.fit_transform(df3_selected[cat_cols])


# convert pandas NAs to numpy NaN for safety
df3_selected = df3_selected.replace({pd.NA: np.nan})

# ensure strings are proper strings (not pandas extension types)
for col in df3_selected.select_dtypes(include="string").columns:
    df3_selected[col] = df3_selected[col].astype(str)

# outlier treatment

num_cols = [
    'BMI', 'Serum_FSH', 'Endometrium_Thickness',
    'Previous_Cycles', 'Oocytes_Retrieved', 'Embryos_Transferred'
]

outlier_counts = {}

for col in num_cols:
    Q1 = df3_selected[col].quantile(0.25)
    Q3 = df3_selected[col].quantile(0.75)
    IQR = Q3 - Q1
    lower_limit = Q1 - 1.5 * IQR
    upper_limit = Q3 + 1.5 * IQR
    
    outliers = df3_selected[(df3_selected[col] < lower_limit) | (df3_selected[col] > upper_limit)]
    outlier_counts[col] = len(outliers)

outlier_counts

from feature_engine.outliers import Winsorizer

# winsorize continuous variables
winsor = Winsorizer(
    capping_method='iqr',
    tail='both',
    fold=1.5,
    variables=['BMI', 'Serum_FSH', 'Endometrium_Thickness', 'Oocytes_Retrieved']
)

df3_selected = winsor.fit_transform(df3_selected)

#  handle discrete variable
df3_selected['Embryos_Transferred'] = df3_selected['Embryos_Transferred'].clip(upper=3)

check_outliers = {}

for col in ['BMI', 'Serum_FSH', 'Endometrium_Thickness', 'Oocytes_Retrieved', 'Embryos_Transferred']:
    Q1 = df3_selected[col].quantile(0.25)
    Q3 = df3_selected[col].quantile(0.75)
    IQR = Q3 - Q1
    lower_limit = Q1 - 1.5 * IQR
    upper_limit = Q3 + 1.5 * IQR
    check_outliers[col] = len(df3_selected[(df3_selected[col] < lower_limit) | (df3_selected[col] > upper_limit)])

check_outliers

df3_selected['Embryos_Transferred'] = df3_selected['Embryos_Transferred'].clip(upper=3)

# zero variance

zero_var_cols = df3_selected.columns[df3_selected.nunique() <= 1]
print(zero_var_cols)

# saving the files

# Save all to CSV files
df_selected.to_csv("Reports_and_Dashboards_Data1_Cleaned.csv", index=False)
df2_selected.to_csv("Reports_and_Dashboards_Data2_Cleaned.csv", index=False)
df3_selected.to_csv("Reports_and_Dashboards_Data3_Cleaned.csv", index=False)
mother.to_csv("Mother_cleaned.csv", index=False)
elisa.to_csv("Elisa_cleaned.csv", index=False)
offspring.to_csv("Offspring_cleaned.csv", index=False)


import os
os.listdir()

