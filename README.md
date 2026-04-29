# Non-Parametric Survival Analysis of Nasopharyngeal Cancer

## Overview
This project presents a nonparametric survival analysis of nasopharyngeal cancer patients, with a focus on differences in survival across the stage at diagnosis. The primary objective is to understand how disease progression at the time of diagnosis influences long-term survival outcomes.

The analysis is conducted using classical survival analysis tools that explicitly account for right-censored data. Patients are categorized into three clinically meaningful groups:
* Localized
* Regional
* Distant

Observations with an "Unknown" stage are excluded from the analysis, as they represent missing information rather than a valid clinical category. Including such observations would confound interpretation by mixing biological differences with data quality issues.

---

## Methodology

### Kaplan–Meier Estimation
Survival functions are estimated using the Kaplan–Meier estimator, which provides a nonparametric estimate of the survival probability over time. This method correctly incorporates right-censored observations by allowing individuals to contribute information up to their last observed time.

Confidence intervals are constructed using the log-log transformation to ensure that survival probabilities remain within valid bounds.

### Survival Summary Measures

* **Quartiles:** Survival quartiles (25%, 50%, 75%) are computed when estimable. In the presence of heavy right-censoring, some quantiles—particularly the median—may not be defined.
* **Restricted Mean Survival Time (RMST):** To address the limitations of quantile-based summaries, RMST is calculated as the area under the survival curve up to a fixed time horizon (τ = 119 months). RMST provides a robust and always estimable measure of expected survival time.

### Log-Rank Test
A log-rank test is used to formally assess whether survival distributions differ across stage groups. This test compares observed and expected event counts over time under the null hypothesis of identical survival functions.

---

## Results

### Survival Patterns
The Kaplan–Meier curves show a clear separation across stage categories:
* Patients with **localized** disease have the highest survival probabilities.
* Patients with **regional** disease show intermediate survival.
* Patients with **distant** disease exhibit substantially worse outcomes.

The distant group experiences a rapid decline in survival, with an estimated median survival of **49 months**, while the other groups do not reach the median within the observation window.

### Restricted Mean Survival Time
RMST values further confirm these differences:
* **Distant:** 61.3 months
* **Regional:** 87.6 months
* **Localized:** 90.4 months

Localized and regional stages show similar overall survival within the observed timeframe, while distant-stage patients have significantly reduced expected survival.

### Statistical Testing
The log-rank test yields:
* **χ²** = 66.4
* **Degrees of freedom** = 2
* **p-value** < 0.001

This provides strong evidence against the null hypothesis, indicating that survival distributions differ significantly across stage categories.

---

## Project Structure

```text
KUL_Surv/
├── data/
│   └── nasopharyngeal_clean.csv
├── scripts/
│   └── surv_part_b.R
├── outputs/
│   └── km_curves.png
├── report/
│   ├── main.tex
│   └── report.pdf
└── README.md
```

Limitations
Heavy right-censoring limits the estimation of upper survival quantiles.

Median survival is not estimable for some groups.

RMST depends on the chosen truncation time (τ).

Conclusion
The analysis demonstrates that the stage at diagnosis is a critical determinant of survival outcomes. Patients diagnosed at earlier stages experience substantially better survival, both in terms of survival probabilities and expected survival time. These findings highlight the importance of early detection and accurate staging in clinical practice.

Author
Kutay
