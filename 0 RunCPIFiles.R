
# -------- Run Get ABS CPI Data ----------

source("1 ReadABS_API.R", echo=TRUE)

# -------- Load Language ----------

source("2 Language.R", echo=TRUE)

# -------- Produce Report ----------------

library(rmarkdown)
#load("CPI.RData")
render("3 Make Report.Rmd", output_file = paste0("Australian CPI ",max(xx$Dates)))
