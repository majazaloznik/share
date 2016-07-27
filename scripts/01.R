###############################################################################
##
###############################################################################

## Preliminaries
###############################################################################
require(foreign)
test <- read.dta(file = "data/sharew1_rel5-0-0_ALL_datasets_stata/sharew1_rel5-0-0_cv_r.dta")

test <- read.dta(file = "data/sharew5_rel5-0-0_ALL_datasets_stata/sharew5_rel5-0-0_xt.dta")
head(test)
table(test$xt012c)
