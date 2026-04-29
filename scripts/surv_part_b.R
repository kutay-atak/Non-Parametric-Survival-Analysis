# Libraries: survival for core methods, survminer for plotting
library(survival)
library(survminer)

dat <- read.csv("C:/Users/kutay/Documents/Data/KUL_Surv/data/nasopharyngeal_clean.csv")
head(data)
# Omission of "Unknown" stage.
dat2 <- dat[dat$stage_clean != "Unknown", ]
# K-M Curves by Stage Category
KM <- survfit(Surv(surv_months, event) ~ stage_clean, data = dat2, conf.type = "log-log")
ggsurvplot(KM, conf.int = T)


# A. Median and Quantiles
quantile(KM, probs = c(0.25,0.5,0.75))


# B. Restricted Mean Survival Time
print(KM,print.rmean = T, rmean = 119)


# Log-rank test to compare the three curves
survdiff(Surv(surv_months, event) ~ stage_clean, data = dat2, rho = 0)
