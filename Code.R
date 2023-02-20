### Anonomaly detection in currency exchange rates to Brazil
library(tidyverse) ## library to detection 
library(timetk)  ## library to detection anomaly
library(readxl)
library(dplyr)
library(lubridate)


exc <- readxl::read_excel('SPGlobal_Brazil_CurrencyExchangeRates_20-Feb-2023.xls', 
                          skip=9) ## load the dataset

str(exc)

colnames(exc) <- c('Date', 'argentine', 'brazil', 'Chile', 'colombian', 'mexican', 'uruguay')

exc %>%
  mutate(pct_arg = (lag(argentine)-argentine)/argentine*100)

exc %>%
  mutate(exc_arge = (lag(argentine) - argentine)/argentine) %>%
  group_by(year(Date)) %>%
  timetk::plot_seasonal_diagnostics(Date, exc_arge, .feature_set = c('week', 'month.lbl', 'quarter'))
  
View(exc)
