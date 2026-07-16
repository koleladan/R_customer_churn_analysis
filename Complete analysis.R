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
> load("C:/Users/User/Documents/Downloads/QVI_Cleaned_merged_data.RData")
> load(data3)
Error in load(data3) : bad 'file' argument

> #Feature extraction
  > data3$PACK_SIZE <- as.numeric(str_extract(data3$PROD_NAME, "\d+"))
Error: '\d' is an unrecognized escape in character string (<input>:1:62)

> data3$PACK_SIZE <- as.numeric(str_extract(data3$PROD_NAME, "\\d+"))
> summary(data3$PACK_SIZE)
Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
70.0   150.0   170.0   175.6   175.0   380.0 
> data3$BRAND <- word(data3$PROD_NAME, 1)
> table(data3$BRAND)

Burger        CCs    Cheetos   Cheezels       Cobs     Dorito    Doritos     French      Grain    GrnWves  Infuzions 
1564       4551       2927       4603       9693       3183      22041       1418       6272       1468      11057 
Infzns     Kettle    Natural        NCC   Pringles        Red        RRD      Smith     Smiths      Snbts   Sunbites 
3144      41288       6050       1419      25102       4427      11894       2963      27389       1576       1432 
Thins   Tostitos   Twisties   Tyrrells Woolworths         WW 
14075       9471       9454       6442       1516      10320 
> data2[data2$PROD_NAME]
Error in `data2[data2$PROD_NAME]`:
  ! Can't subset columns that don't exist.
✖ Columns `Natural Chip        Compny SeaSalt175g`, `CCs Nacho Cheese    175g`, `Smiths Crinkle Cut  Chips Chicken 170g`, `Smiths Chip Thinly  S/Cream&Onion 175g`, `Kettle Tortilla ChpsHny&Jlpno Chili 150g`, etc. don't exist.
Run `rlang::last_trace()` to see where the error occurred.

> #Calculate Key performance Metrics
> #Total sales
> sum(data3$TOT_SALES)
[1] 1805172
> #Total Transactions
> nrow(data3)
[1] 246739
> #Total customers
> n_distinct(data3$LYLTY_CARD_NBR)
[1] 71287
> #Average Transaction Value
> mean(data3$TOT_SALES)
[1] 7.316118
> #Average Quantity Purchased
> mean(data3$PROD_QTY)
[1] 1.906456
> #Average Units per Customer
> data3 %>% group_by(LYLTY_CARD_NBR) %>% summarise(units = sum(PROD_QTY)) %>% summarise(Avg = mean(units))
# A tibble: 1 × 1
    Avg
  <dbl>
1  6.60
> #Sales by customer Segment
> sales_segment<- data3 %>% group_by(LIFESTAGE, PREMIUM_CUSTOMER) %>% summarise(Total_sale = sum(TOT_SALES), Transactions = n(), Customers = n_distinct(LYLTY_CARD_NBR), Avg_Spend = mean(TOT_SALES), .groups = "drop") sales_segment
Error: unexpected symbol in "sales_segment<- data3 %>% group_by(LIFESTAGE, PREMIUM_CUSTOMER) %>% summarise(Total_sale = sum(TOT_SALES), Transactions = n(), Customers = n_distinct(LYLTY_CARD_NBR), Avg_Spend = mean(TOT_SALE"

> sales_segment <- data3 %>%
+     group_by(LIFESTAGE, PREMIUM_CUSTOMER) %>%
+     summarise(
+         Total_Sales = sum(TOT_SALES),
+         Transactions = n(),
+         Customers = n_distinct(LYLTY_CARD_NBR),
+         Avg_Spend = mean(TOT_SALES),
+         .groups = "drop"
+     )
> sales_segment
# A tibble: 21 × 6
   LIFESTAGE              PREMIUM_CUSTOMER Total_Sales Transactions Customers Avg_Spend
   <chr>                  <chr>                  <dbl>        <int>     <int>     <dbl>
 1 MIDAGE SINGLES/COUPLES Budget                33346.         4691      1474      7.11
 2 MIDAGE SINGLES/COUPLES Mainstream            84734.        11095      3298      7.64
 3 MIDAGE SINGLES/COUPLES Premium               54444.         7612      2369      7.15
 4 NEW FAMILIES           Budget                20607.         2824      1087      7.30
 5 NEW FAMILIES           Mainstream            15980.         2185       830      7.31
 6 NEW FAMILIES           Premium               10761.         1488       575      7.23
 7 OLDER FAMILIES         Budget               156864.        21514      4611      7.29
 8 OLDER FAMILIES         Mainstream            96414.        13241      2788      7.28
 9 OLDER FAMILIES         Premium               75243.        10403      2231      7.23
10 OLDER SINGLES/COUPLES  Budget               127834.        17172      4849      7.44
# ℹ 11 more rows
# ℹ Use `print(n = ...)` to see more rows
> View(sales_segment)
> #Sales Drivers
> #Which life stage spends the most
> data3 %>%
+ 
+ )
Error: unexpected ')' in:
"
)"

> data3 %>% group_by(LIFESTAGE) %>% summarise(Sales = sum(TOT_SALES)) %>% arrange(desc(Sales))
# A tibble: 7 × 2
  LIFESTAGE                Sales
  <chr>                    <dbl>
1 OLDER SINGLES/COUPLES  376014.
2 RETIREES               342382.
3 OLDER FAMILIES         328520.
4 YOUNG FAMILIES         294628.
5 YOUNG SINGLES/COUPLES  243757.
6 MIDAGE SINGLES/COUPLES 172524.
7 NEW FAMILIES            47348.
> #Which customer type spends most
> data3 %>% group_by(PREMIUM_CUSTOMER) %>% summarise(Sales = sum(TOT_SALES)) %>% arrange(desc(Sales))
# A tibble: 3 × 2
  PREMIUM_CUSTOMER   Sales
  <chr>              <dbl>
1 Mainstream       700865.
2 Budget           631407.
3 Premium          472899.
> #Top selling brands
> data3 %>% group_by(BRAND) %>% summarise(Sales = sum(TOT_SALES)) %>% arrange(desc(Sales))
# A tibble: 28 × 2
   BRAND       Sales
   <chr>       <dbl>
 1 Kettle    390240.
 2 Smiths    202903.
 3 Doritos   187278.
 4 Pringles  177656.
 5 Thins      88853.
 6 Twisties   81522.
 7 Tostitos   79790.
 8 Infuzions  76248.
 9 Cobs       70570.
10 RRD        64954.
# ℹ 18 more rows
# ℹ Use `print(n = ...)` to see more rows
> #Most popular pack sizes
> data3 %>% group_by(PACK_SIZE) %>% summarise(Sales = sum(TOT_SALES)) %>% arrange(desc(Sales))
# A tibble: 20 × 2
   PACK_SIZE   Sales
       <dbl>   <dbl>
 1       175 485431.
 2       150 289682.
 3       134 177656.
 4       110 162765.
 5       170 146673 
 6       330 136794.
 7       165 101361.
 8       380  75420.
 9       270  55425.
10       210  43049.
11       250  26097.
12       135  26090.
13       200  16008.
14       190  14413.
15       160  10648.
16        90   9676.
17       180   8568.
18        70   6852 
19       220   6831 
20       125   5733 
> data3 %>%
+     group_by(PREMIUM_CUSTOMER) %>%
+     summarise(
+         Avg_Spend = mean(TOT_SALES),
+         Transactions = n(),
+         Customers = n_distinct(LYLTY_CARD_NBR)
+     )
# A tibble: 3 × 4
  PREMIUM_CUSTOMER Avg_Spend Transactions Customers
  <chr>                <dbl>        <int>     <int>
1 Budget                7.28        86762     24006
2 Mainstream            7.37        95043     28734
3 Premium               7.28        64934     18547
> #In the customer type spending behavior; Mainstream customers are the strongest-performing customer segment, generating the highest total sales. This performance appears to be  driven by a combination of having the largest customer base, the highest transaction volume, and a slightly higher average spend per transction compared with budget and premium customers.
> 
> #Lifestage
> data3 %>% group_by(LIFESTAGE) %>% summarise(Avg_Spend = mean(TOT_SALES), Transactions = n(), Customers = n_distinct(LYLTY_CARD_NBR))
# A tibble: 7 × 4
  LIFESTAGE              Avg_Spend Transactions Customers
  <chr>                      <dbl>        <int>     <int>
1 MIDAGE SINGLES/COUPLES      7.37        23398      7141
2 NEW FAMILIES                7.29         6497      2492
3 OLDER FAMILIES              7.27        45158      9630
4 OLDER SINGLES/COUPLES       7.40        50792     14389
5 RETIREES                    7.37        46431     14555
6 YOUNG FAMILIES              7.28        40494      9036
7 YOUNG SINGLES/COUPLES       7.18        33969     14044
> data3 %>% group_by(LIFESTAGE) %>% summarise(Avg_Spend = mean(TOT_SALES), Transactions = n(), Customers = n_distinct(LYLTY_CARD_NBR)) %>% arrange(desc(Customers))
# A tibble: 7 × 4
  LIFESTAGE              Avg_Spend Transactions Customers
  <chr>                      <dbl>        <int>     <int>
1 RETIREES                    7.37        46431     14555
2 OLDER SINGLES/COUPLES       7.40        50792     14389
3 YOUNG SINGLES/COUPLES       7.18        33969     14044
4 OLDER FAMILIES              7.27        45158      9630
5 YOUNG FAMILIES              7.28        40494      9036
6 MIDAGE SINGLES/COUPLES      7.37        23398      7141
7 NEW FAMILIES                7.29         6497      2492
> data3 %>% group_by(LIFESTAGE) %>% summarise(Avg_Spend = mean(TOT_SALES), Transactions = n(), Customers = n_distinct(LYLTY_CARD_NBR), Sales = sum(TOT_SALES)) %>% arrange(desc(Sales))
# A tibble: 7 × 5
  LIFESTAGE              Avg_Spend Transactions Customers   Sales
  <chr>                      <dbl>        <int>     <int>   <dbl>
1 OLDER SINGLES/COUPLES       7.40        50792     14389 376014.
2 RETIREES                    7.37        46431     14555 342382.
3 OLDER FAMILIES              7.27        45158      9630 328520.
4 YOUNG FAMILIES              7.28        40494      9036 294628.
5 YOUNG SINGLES/COUPLES       7.18        33969     14044 243757.
6 MIDAGE SINGLES/COUPLES      7.37        23398      7141 172524.
7 NEW FAMILIES                7.29         6497      2492  47348.
> data3 %>%
+     group_by(LIFESTAGE) %>%
+     summarise(
+         Avg_Units = mean(PROD_QTY),
+         Avg_Spend = mean(TOT_SALES),
+         Transactions = n(),
+         Customers = n_distinct(LYLTY_CARD_NBR),
+         Sales = sum(TOT_SALES)
+     ) %>%
+     arrange(desc(Avg_Units))
# A tibble: 7 × 6
  LIFESTAGE              Avg_Units Avg_Spend Transactions Customers   Sales
  <chr>                      <dbl>     <dbl>        <int>     <int>   <dbl>
1 OLDER FAMILIES              1.95      7.27        45158      9630 328520.
2 YOUNG FAMILIES              1.94      7.28        40494      9036 294628.
3 OLDER SINGLES/COUPLES       1.91      7.40        50792     14389 376014.
4 MIDAGE SINGLES/COUPLES      1.90      7.37        23398      7141 172524.
5 RETIREES                    1.89      7.37        46431     14555 342382.
6 NEW FAMILIES                1.86      7.29         6497      2492  47348.
7 YOUNG SINGLES/COUPLES       1.83      7.18        33969     14044 243757.
> #From the analysis: Older singles/Couples are the highest-value segment beacause they generate the most revenue, make the most transactions, and spend the most per transaction. Older families and Young Families tend to purchase the highest number of chip packs per visit, suggesting family households buy in large quantities.Retirees contribute substantially to revenue due to their large customes and frequent purchase. Differences in total sales are influenced by both customer numbers and purchase frequency, while average spend per transaction varies only slightly across life stages.
> 
> # brand Vs sales behavior
> brand_sales <- data3 %>%
+   group_by(BRAND) %>%
+   summarise(
+     Total_Sales = sum(TOT_SALES),
+     Transactions = n(),
+     Avg_Units = mean(PROD_QTY),
+     .groups = "drop"
+   ) %>%
+   arrange(desc(Total_Sales))
> brand_sales
# A tibble: 28 × 4
   BRAND     Total_Sales Transactions Avg_Units
   <chr>           <dbl>        <int>     <dbl>
 1 Kettle        390240.        41288      1.91
 2 Smiths        202903.        27389      1.90
 3 Doritos       187278.        22041      1.92
 4 Pringles      177656.        25102      1.91
 5 Thins          88853.        14075      1.91
 6 Twisties       81522.         9454      1.92
 7 Tostitos       79790.         9471      1.91
 8 Infuzions      76248.        11057      1.91
 9 Cobs           70570.         9693      1.92
10 RRD            64954.        11894      1.89
# ℹ 18 more rows
# ℹ Use `print(n = ...)` to see more rows
> view(brand_sales)
> #Kettle is the clear market leader, generating almost twice the sales of the second-ranked brand(Smiths).Smiths, Doritos and Pringles also contribute substantially to total revenue. The average units per transaction are very similar across brands (around 1.9 units), indicating that customers tend to purchase about packs regardless of brand. This susggest that differences in total sales are driven primarily by how often ccustomes buy each brand rather than by purchasing larger quantities of one brand over the other.
> 
> #Most popular pack_sizes
> data3 %>% group_by(PACK_SIZE) %>% summarise(Sales = sum(TOT_SALES), Transactions = n(), Avg_Units = mean(PROD_QTY), Customers = n_distinct(LYLTY_CARD_NBR), Avg_spend = mean(TOT_SALES)) %>% arrange(desc(Sales))
# A tibble: 20 × 6
   PACK_SIZE   Sales Transactions Avg_Units Customers Avg_spend
       <dbl>   <dbl>        <int>     <dbl>     <int>     <dbl>
 1       175 485431.        66389      1.90     40736      7.31
 2       150 289682.        40203      1.91     29359      7.21
 3       134 177656.        25102      1.91     20657      7.08
 4       110 162765.        22387      1.91     18678      7.27
 5       170 146673         19983      1.91     16916      7.34
 6       330 136794.        12540      1.91     11282     10.9 
 7       165 101361.        15297      1.90     13229      6.63
 8       380  75420.         6416      1.91      6095     11.8 
 9       270  55425.         6285      1.92      5924      8.82
10       210  43049.         6272      1.91      5921      6.86
11       250  26097.         3169      1.92      3092      8.23
12       135  26090.         3257      1.91      3179      8.01
13       200  16008.         4473      1.88      4165      3.58
14       190  14413.         2995      1.89      2874      4.81
15       160  10648.         2970      1.89      2841      3.59
16        90   9676.         3008      1.89      2875      3.22
17       180   8568.         1468      1.88      1440      5.84
18        70   6852          1507      1.89      1474      4.55
19       220   6831          1564      1.90      1519      4.37
20       125   5733          1454      1.88      1416      3.94
> #175g is by far the most popular pack size with the highest total sales, highest number of transactions and the largest number of customers purchasing it. 150g is the second most popular pack size. 330g and 380g stand out because they have much higher average spend per transaction (10.9 and 11.8 respectively), which is expected since they are larger pack. However, they generate fewer transactions than the smaller packs. The average units purchased per transaction remain close to 1.9 across all pack sizes, suggesting customers typically buy about 2 packs regardless of size.
> 
> #Busines implications: Ensure 175g and 150g packs remain well stocked, as they drive the largest share of sales.Consider promotions or targeted marketing around these popular pack sizes because they appeal to the widest customer base. Larger packs (330g and 380g) generate higher spend per transaction and may be suitable for promotions aimed at family shoppers or larger households.
> 
> #Lifestage and customer type buy the most 175g packs
> data3 %>%
+     filter(PACK_SIZE == 175) %>%
+     group_by(LIFESTAGE, PREMIUM_CUSTOMER) %>%
+     summarise(
+         Sales = sum(TOT_SALES),
+         Transactions = n(),
+         .groups = "drop"
+     ) %>%
+     arrange(desc(Sales))
# A tibble: 21 × 4
   LIFESTAGE             PREMIUM_CUSTOMER  Sales Transactions
   <chr>                 <chr>             <dbl>        <int>
 1 OLDER FAMILIES        Budget           42205.         5808
 2 RETIREES              Mainstream       38243.         5295
 3 YOUNG SINGLES/COUPLES Mainstream       37968.         4997
 4 YOUNG FAMILIES        Budget           35635.         4921
 5 OLDER SINGLES/COUPLES Budget           34497          4625
 6 OLDER SINGLES/COUPLES Premium          33387.         4457
 7 OLDER SINGLES/COUPLES Mainstream       33042.         4525
 8 RETIREES              Budget           28977.         3847
 9 OLDER FAMILIES        Mainstream       25975.         3588
10 RETIREES              Premium          24868.         3306
# ℹ 11 more rows
# ℹ Use `print(n = ...)` to see more rows
> #The result insights: Budget Older Families are the strongest buyers of the most popular pack size (175g, making them an attractive segment for promotions on standard-sized packs. Mainstream Retirees and Mainstream YOung Singles/Couples are also major purchasers of 175g packs. Several Older Single/Couples segments (Budget, Premium, and Mainstream) appear in the top rankings, reinforcing the earlier finding that this stage is highly valuable. Finally, this suggests that the 175g pack appeals across multiple customer groups, but particularly to Older Families and Older Singles/Couples
> 
> # Favorite brand for each segment
> brand_preference <- data3 %>%
+     group_by(LIFESTAGE, PREMIUM_CUSTOMER, BRAND) %>%
+     summarise(
+         Sales = sum(TOT_SALES),
+         Transactions = n(),
+         .groups = "drop"
+     ) %>%
+     arrange(LIFESTAGE, PREMIUM_CUSTOMER, desc(Sales))
> brand_preference
# A tibble: 588 × 5
   LIFESTAGE              PREMIUM_CUSTOMER BRAND     Sales Transactions
   <chr>                  <chr>            <chr>     <dbl>        <int>
 1 MIDAGE SINGLES/COUPLES Budget           Kettle    6736.          713
 2 MIDAGE SINGLES/COUPLES Budget           Smiths    3708.          522
 3 MIDAGE SINGLES/COUPLES Budget           Doritos   3556.          419
 4 MIDAGE SINGLES/COUPLES Budget           Pringles  3160.          449
 5 MIDAGE SINGLES/COUPLES Budget           Thins     1673.          269
 6 MIDAGE SINGLES/COUPLES Budget           Twisties  1505.          176
 7 MIDAGE SINGLES/COUPLES Budget           Tostitos  1404.          163
 8 MIDAGE SINGLES/COUPLES Budget           Infuzions 1399.          202
 9 MIDAGE SINGLES/COUPLES Budget           RRD       1342.          252
10 MIDAGE SINGLES/COUPLES Budget           Cobs      1311           180
# ℹ 578 more rows
# ℹ Use `print(n = ...)` to see more rows
> top_brand <- brand_preference %>%
+     group_by(LIFESTAGE, PREMIUM_CUSTOMER) %>%
+     slice_max(Sales, n = 1, with_ties = FALSE) %>%
+     arrange(desc(Sales))
> top_brand
# A tibble: 21 × 5
# Groups:   LIFESTAGE, PREMIUM_CUSTOMER [21]
   LIFESTAGE              PREMIUM_CUSTOMER BRAND   Sales Transactions
   <chr>                  <chr>            <chr>   <dbl>        <int>
 1 YOUNG SINGLES/COUPLES  Mainstream       Kettle 35424.         3844
 2 OLDER FAMILIES         Budget           Kettle 32058          3320
 3 RETIREES               Mainstream       Kettle 31652.         3386
 4 OLDER SINGLES/COUPLES  Budget           Kettle 29066.         3065
 5 OLDER SINGLES/COUPLES  Premium          Kettle 27943.         2947
 6 OLDER SINGLES/COUPLES  Mainstream       Kettle 26853.         2835
 7 YOUNG FAMILIES         Budget           Kettle 26370.         2743
 8 RETIREES               Budget           Kettle 24340          2592
 9 RETIREES               Premium          Kettle 20922.         2216
10 MIDAGE SINGLES/COUPLES Mainstream       Kettle 20232.         2136
# ℹ 11 more rows
# ℹ Use `print(n = ...)` to see more rows
> #Kettle is top-selling brand in every customer segment shown in your top 10 results. It consistently generates the highest sales across different life stages and customer types. This strongly suggests that Kettle has broad appeal, regardless of wheather customers are Budget, Mainstream, or Premium.