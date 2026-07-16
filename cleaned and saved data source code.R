data1 <- read.csv(file.choose())
> data2 <- read_excel(file.choose())
> names(data1)
[1] "LYLTY_CARD_NBR"   "LIFESTAGE"        "PREMIUM_CUSTOMER"
> names(data2)
[1] "DATE"           "STORE_NBR"      "LYLTY_CARD_NBR" "TXN_ID"         "PROD_NBR"       "PROD_NAME"     
[7] "PROD_QTY"       "TOT_SALES"     
> colSums(is.na(data1))
LYLTY_CARD_NBR        LIFESTAGE PREMIUM_CUSTOMER 
0                0                0 
> colSums(is.na(data2))
DATE      STORE_NBR LYLTY_CARD_NBR         TXN_ID       PROD_NBR      PROD_NAME       PROD_QTY      TOT_SALES 
0              0              0              0              0              0              0              0 
> sum(duplicated(data1))
[1] 0
> sum(duplicated(data2))
[1] 1
> data2 <- data2[!duplicated(data2), ]
> sum(duplicated(data2))
[1] 0
> data2$DATE <- as.Date(data2$DATE, origin = "1899-12-30")
> head(data2$DATE)
[1] "2018-10-17" "2019-05-14" "2019-05-20" "2018-08-17" "2018-08-18" "2019-05-19"
> data2 <- subset(data2, LYLTY_CARD_NBR != 226000)
> summary(data2$PROD_QTY)
Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
1.000   2.000   2.000   1.906   2.000   5.000 
> data2 <- data2 %>% filter(!str_detect(PROD_NAME, regex("salsa", ignore_case = TRUE)))
> data3 <- left_join(data2, data1, by = "LYLTY_CARD_NBR")
> dim(data3)
[1] 246739     10
> str(data3)
tibble [246,739 × 10] (S3: tbl_df/tbl/data.frame)
$ DATE            : Date[1:246739], format: "2018-10-17" "2019-05-14" "2019-05-20" "2018-08-17" ...
$ STORE_NBR       : num [1:246739] 1 1 1 2 2 4 4 5 7 7 ...
$ LYLTY_CARD_NBR  : num [1:246739] 1000 1307 1343 2373 2426 ...
$ TXN_ID          : num [1:246739] 1 348 383 974 1038 ...
$ PROD_NBR        : num [1:246739] 5 66 61 69 108 16 24 42 52 16 ...
$ PROD_NAME       : chr [1:246739] "Natural Chip        Compny SeaSalt175g" "CCs Nacho Cheese    175g" "Smiths Crinkle Cut  Chips Chicken 170g" "Smiths Chip Thinly  S/Cream&Onion 175g" ...
$ PROD_QTY        : num [1:246739] 2 3 2 5 3 1 1 1 2 1 ...
$ TOT_SALES       : num [1:246739] 6 6.3 2.9 15 13.8 5.7 3.6 3.9 7.2 5.7 ...
$ LIFESTAGE       : chr [1:246739] "YOUNG SINGLES/COUPLES" "MIDAGE SINGLES/COUPLES" "MIDAGE SINGLES/COUPLES" "MIDAGE SINGLES/COUPLES" ...
$ PREMIUM_CUSTOMER: chr [1:246739] "Premium" "Budget" "Budget" "Budget" ...
> colSums(is.na(data3))
DATE        STORE_NBR   LYLTY_CARD_NBR           TXN_ID         PROD_NBR        PROD_NAME         PROD_QTY 
0                0                0                0                0                0                0 
TOT_SALES        LIFESTAGE PREMIUM_CUSTOMER 
0                0                0 
> save(data1,data2, data3, file = QVI_Cleaned_data.RData)
Error: object 'QVI_Cleaned_data.RData' not found

> save(data1,data2, data3, file = "QVI_Cleaned_merged_data.RData")