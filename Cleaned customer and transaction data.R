 #Installing packages
> install.packages(c(
+     "tidyverse",
+     "readxl",
+     "psych",
+     "skimr",
+     "janitor",
+     "car",
+     "GGally",
+     "corrplot",
+     "ggpubr",
+     "rstatix",
+     "effectsize"
+ ))
WARNING: Rtools is required to build R packages but is not currently installed. Please download and install the appropriate version of Rtools before proceeding:

https://cran.rstudio.com/bin/windows/Rtools/
Installing packages into ‘C:/Users/User/AppData/Local/R/win-library/4.5’
(as ‘lib’ is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.5/tidyverse_2.0.0.zip'
trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.5/readxl_1.5.0.zip'
trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.5/psych_2.6.5.zip'
trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.5/skimr_2.2.2.zip'
trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.5/janitor_2.2.1.zip'
trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.5/car_3.1-5.zip'
trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.5/GGally_2.4.0.zip'
trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.5/corrplot_0.95.zip'
trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.5/ggpubr_1.0.0.zip'
trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.5/rstatix_1.0.0.zip'
trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.5/effectsize_1.0.3.zip'
package ‘tidyverse’ successfully unpacked and MD5 sums checked
package ‘readxl’ successfully unpacked and MD5 sums checked
package ‘psych’ successfully unpacked and MD5 sums checked
package ‘skimr’ successfully unpacked and MD5 sums checked
package ‘janitor’ successfully unpacked and MD5 sums checked
package ‘car’ successfully unpacked and MD5 sums checked
package ‘GGally’ successfully unpacked and MD5 sums checked
package ‘corrplot’ successfully unpacked and MD5 sums checked
package ‘ggpubr’ successfully unpacked and MD5 sums checked
package ‘rstatix’ successfully unpacked and MD5 sums checked
package ‘effectsize’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
	C:\Users\User\AppData\Local\Temp\RtmpkxcomV\downloaded_packages
> library(tidyverse)
── Attaching core tidyverse packages ───────────────────────────────────────────────────────────────── tidyverse 2.0.0 ──
✔ dplyr     1.2.1     ✔ readr     2.1.5
✔ forcats   1.0.0     ✔ stringr   1.5.1
✔ ggplot2   4.0.3     ✔ tibble    3.2.1
✔ lubridate 1.9.4     ✔ tidyr     1.3.2
✔ purrr     1.0.4     
── Conflicts ─────────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
✖ dplyr::filter() masks stats::filter()
✖ dplyr::lag()    masks stats::lag()
ℹ Use the conflicted package to force all conflicts to become errors
Warning messages:
1: package ‘tidyverse’ was built under R version 4.5.3 
2: package ‘ggplot2’ was built under R version 4.5.3 
3: package ‘tidyr’ was built under R version 4.5.3 
4: package ‘dplyr’ was built under R version 4.5.3 
> library(readxl)
Warning message:
package ‘readxl’ was built under R version 4.5.3 
> library(psych)

Attaching package: ‘psych’

The following objects are masked from ‘package:ggplot2’:

    %+%, alpha

Warning message:
package ‘psych’ was built under R version 4.5.3 
> library(skimr)
Warning message:
package ‘skimr’ was built under R version 4.5.3 
> library(janitor)

Attaching package: ‘janitor’

The following objects are masked from ‘package:stats’:

    chisq.test, fisher.test

Warning message:
package ‘janitor’ was built under R version 4.5.3 
> library(car)
Loading required package: carData

Attaching package: ‘car’

The following object is masked from ‘package:psych’:

    logit

The following object is masked from ‘package:dplyr’:

    recode

The following object is masked from ‘package:purrr’:

    some

Warning message:
package ‘car’ was built under R version 4.5.3 
> library(GGally)
Warning message:
package ‘GGally’ was built under R version 4.5.3 
> library(corrplot)
corrplot 0.95 loaded
Warning message:
package ‘corrplot’ was built under R version 4.5.3 
> library(ggpubr)
Warning message:
package ‘ggpubr’ was built under R version 4.5.3 
> library(rstatix)

Attaching package: ‘rstatix’

The following object is masked from ‘package:janitor’:

    make_clean_names

The following object is masked from ‘package:stats’:

    filter

Warning message:
package ‘rstatix’ was built under R version 4.5.3 
> library(effectsize)

Attaching package: ‘effectsize’

The following objects are masked from ‘package:rstatix’:

    cohens_d, eta_squared

The following object is masked from ‘package:psych’:

    phi

Warning message:
package ‘effectsize’ was built under R version 4.5.3 

> #importing data
> data1 <- read.csv(file.choose())
Error in type.convert.default(data[[i]], as.is = as.is[i], dec = dec,  : 
  invalid multibyte string at '<d7><db>'
In addition: 
Warning messages:
1: In read.table(file = file, header = header, sep = sep, quote = quote,  :
  line 1 appears to contain embedded nulls
2: In read.table(file = file, header = header, sep = sep, quote = quote,  :
  line 5 appears to contain embedded nulls
3: In scan(file = file, what = what, sep = sep, quote = quote, dec = dec,  :
  EOF within quoted string
4: In scan(file = file, what = what, sep = sep, quote = quote, dec = dec,  :
  EOF within quoted string
5: In scan(file = file, what = what, sep = sep, quote = quote, dec = dec,  :
  EOF within quoted string
6: In scan(file = file, what = what, sep = sep, quote = quote, dec = dec,  :
  embedded nul(s) found in input

> data1 <- read.csv(file.choose())
> names(data1)
[1] "LYLTY_CARD_NBR"   "LIFESTAGE"        "PREMIUM_CUSTOMER"
> head(data1)
  LYLTY_CARD_NBR              LIFESTAGE PREMIUM_CUSTOMER
1           1000  YOUNG SINGLES/COUPLES          Premium
2           1002  YOUNG SINGLES/COUPLES       Mainstream
3           1003         YOUNG FAMILIES           Budget
4           1004  OLDER SINGLES/COUPLES       Mainstream
5           1005 MIDAGE SINGLES/COUPLES       Mainstream
6           1007  YOUNG SINGLES/COUPLES           Budget
> data2<- read_excel(file.choose())
> head(data2)
# A tibble: 6 × 8
   DATE STORE_NBR LYLTY_CARD_NBR TXN_ID PROD_NBR PROD_NAME                                PROD_QTY TOT_SALES
  <dbl>     <dbl>          <dbl>  <dbl>    <dbl> <chr>                                       <dbl>     <dbl>
1 43390         1           1000      1        5 Natural Chip        Compny SeaSalt175g          2       6  
2 43599         1           1307    348       66 CCs Nacho Cheese    175g                        3       6.3
3 43605         1           1343    383       61 Smiths Crinkle Cut  Chips Chicken 170g          2       2.9
4 43329         2           2373    974       69 Smiths Chip Thinly  S/Cream&Onion 175g          5      15  
5 43330         2           2426   1038      108 Kettle Tortilla ChpsHny&Jlpno Chili 150g        3      13.8
6 43604         4           4074   2982       57 Old El Paso Salsa   Dip Tomato Mild 300g        1       5.1
> #cleaning the 2 data
> #Missing data
> colSums(is.na(data1))
  LYLTY_CARD_NBR        LIFESTAGE PREMIUM_CUSTOMER 
               0                0                0 
> colSums(is.na(data2))
          DATE      STORE_NBR LYLTY_CARD_NBR         TXN_ID       PROD_NBR      PROD_NAME       PROD_QTY      TOT_SALES 
             0              0              0              0              0              0              0              0 
> #check duplicate values
> sum(duplicated(data1))
[1] 0
> sum(duplicated(data1$LYLTY_CARD_NBR))
[1] 0
> sum(duplicated(data2))
[1] 1
> data2[duplicated(data2),]
# A tibble: 1 × 8
   DATE STORE_NBR LYLTY_CARD_NBR TXN_ID PROD_NBR PROD_NAME                              PROD_QTY TOT_SALES
  <dbl>     <dbl>          <dbl>  <dbl>    <dbl> <chr>                                     <dbl>     <dbl>
1 43374       107         107024 108462       45 Smiths Thinly Cut   Roast Chicken 175g        2         6
> data2 <- data2[!duplicated(data2),]
> sum(duplicated(data2))
[1] 0
> #customer segments
> table(data1$LIFESTAGE)

MIDAGE SINGLES/COUPLES           NEW FAMILIES         OLDER FAMILIES  OLDER SINGLES/COUPLES               RETIREES 
                  7275                   2549                   9780                  14609                  14805 
        YOUNG FAMILIES  YOUNG SINGLES/COUPLES 
                  9178                  14441 
> table(data1$PREMIUM_CUSTOMER)

    Budget Mainstream    Premium 
     24470      29245      18922 
> #blank values
> colSums(data1 == "", na.rm = TRUE)
  LYLTY_CARD_NBR        LIFESTAGE PREMIUM_CUSTOMER 
               0                0                0 
> colSums(data2 == "", na.rm = TRUE)
          DATE      STORE_NBR LYLTY_CARD_NBR         TXN_ID       PROD_NBR      PROD_NAME       PROD_QTY      TOT_SALES 
             0              0              0              0              0              0              0              0 
> sum(data1$LIFESTAGE == "", na.rm = TRUE)
[1] 0
> #convert the date
> data2$DATE <- as.Date(data2$DATE, origin = "1899-12-30")
> head(data2$DATE)
[1] "2018-10-17" "2019-05-14" "2019-05-20" "2018-08-17" "2018-08-18" "2019-05-19"
> #Examine product quantities
> summary(data2$PROD_QTY)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  1.000   2.000   2.000   1.907   2.000 200.000 
> #outlier transaction(s)
> #maximum product quantity is an outlier because it suggests a commercial transaction. The task is to analyze retail transactions thus this is an outlier.
> #Removing the outlier
> data2[data2$PROD_QTY == 200, ]
# A tibble: 2 × 8
  DATE       STORE_NBR LYLTY_CARD_NBR TXN_ID PROD_NBR PROD_NAME                        PROD_QTY TOT_SALES
  <date>         <dbl>          <dbl>  <dbl>    <dbl> <chr>                               <dbl>     <dbl>
1 2018-08-19       226         226000 226201        4 Dorito Corn Chp     Supreme 380g      200       650
2 2019-05-20       226         226000 226210        4 Dorito Corn Chp     Supreme 380g      200       650
> #Now that the customer is not a consumer. the best option is to remove the customer with that particular id
> data2 <- subset(data2, LYLTY_CARD_NBR != 226000)
> summary(data2$PROD_QTY)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  1.000   2.000   2.000   1.906   2.000   5.000 
> #Examine Sales
> summary(data2$TOT_SALES)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  1.500   5.400   7.400   7.299   9.200  29.500 
> #Examine product names
> summary(data2$PROD_NAME)
   Length     Class      Mode 
   264833 character character 
> #Check the salsa products
> #Because we are only tasked to analyze chips products, we can remove non-chips products
> data2 %>% filter(str_detect(PROD_NAME,regex("salsa", ignore_case = TRUE)))
# A tibble: 18,094 × 8
   DATE       STORE_NBR LYLTY_CARD_NBR TXN_ID PROD_NBR PROD_NAME                                PROD_QTY TOT_SALES
   <date>         <dbl>          <dbl>  <dbl>    <dbl> <chr>                                       <dbl>     <dbl>
 1 2019-05-19         4           4074   2982       57 Old El Paso Salsa   Dip Tomato Mild 300g        1       5.1
 2 2019-05-15        39          39144  35506       57 Old El Paso Salsa   Dip Tomato Mild 300g        1       5.1
 3 2019-05-20        45          45127  41122       64 Red Rock Deli SR    Salsa & Mzzrlla 150g        2       5.4
 4 2018-08-18        56          56013  50090       39 Smiths Crinkle Cut  Tomato Salsa 150g           1       2.6
 5 2019-05-15        82          82480  82047      101 Doritos Salsa       Medium 300g                 1       2.6
 6 2018-08-15        94          94233  93956       65 Old El Paso Salsa   Dip Chnky Tom Ht300g        1       5.1
 7 2018-08-16        97          97159  97271       35 Woolworths Mild     Salsa 300g                  5       7.5
 8 2018-08-15       116         116184 120270       59 Old El Paso Salsa   Dip Tomato Med 300g         1       5.1
 9 2018-08-16       157         157185 159562       59 Old El Paso Salsa   Dip Tomato Med 300g         2      10.2
10 2018-08-19       175         175306 176634       59 Old El Paso Salsa   Dip Tomato Med 300g         1       5.1
# ℹ 18,084 more rows
# ℹ Use `print(n = ...)` to see more rows
> #Removal
> data2 <- data2 %>% filter(!str_detect(PROD_NAME, regex("salsa", ignore_case = TRUE)))
> data2 %>% filter(str_detect(PROD_NAME,regex("salsa", ignore_case = TRUE)))
# A tibble: 0 × 8
# ℹ 8 variables: DATE <date>, STORE_NBR <dbl>, LYLTY_CARD_NBR <dbl>, TXN_ID <dbl>, PROD_NBR <dbl>, PROD_NAME <chr>,
#   PROD_QTY <dbl>, TOT_SALES <dbl>
> source("C:/Users/User/Desktop/Data Science/Forage Analysis/Customer Churn analysis/Cleaned customer and transaction data.R")
