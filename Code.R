### Anonomaly detection in currency exchange rates to Brazil
library(tidyverse) ## library to detection 
library(timetk)  ## library to detection anomaly
library(readxl)
library(dplyr)
library(lubridate)
library(xts)


exc <- readxl::read_excel('SPGlobal_Brazil_CurrencyExchangeRates_20-Feb-2023.xls', 
                          skip=9) ## load the dataset

str(exc)

colnames(exc) <- c('Date', 'argentine', 'brazil', 'Chile', 'colombian', 'mexican', 'uruguay')


exc %>%
  #group_by(year(Date)) %>%
  timetk::plot_anomaly_diagnostics(Date, argentine, .facet_scales='free', .interactive=TRUE)
 
