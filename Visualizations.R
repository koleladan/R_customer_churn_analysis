#Visualizations
> Sales by life stage
Error: unexpected symbol in "Sales by"

> #Sales by life stage
  > library(ggplot2)
> 
  > ggplot(data3, aes(x = LIFESTAGE, y = TOT_SALES)) + geom_col(stat = "summary", fun = "sum")+ coord_flip() + labs(title = "Total Sales by Customer Life Stage", x = "Life Stage", y = "Total Sales")
> library(dplyr)
> library(ggplot2)
> 
  > life_stage_sales <- data3 %>%
  +     group_by(LIFESTAGE) %>%
  +     summarise(Total_Sales = sum(TOT_SALES), .groups = "drop")
> 
  > ggplot(life_stage_sales,
           +        aes(x = reorder(LIFESTAGE, Total_Sales),
                        +            y = Total_Sales)) +
  +     geom_col(fill = "steelblue") +
  +     coord_flip() +
  +     labs(
    +         title = "Total Sales by Customer Life Stage",
    +         x = "Life Stage",
    +         y = "Total Sales ($)"
    +     ) +
  +     theme_minimal()
> # Load required packages
  > library(dplyr)
> library(ggplot2)
> library(scales)

Attaching package: ‘scales’

The following objects are masked from ‘package:psych’:
  
  alpha, rescale

The following object is masked from ‘package:purrr’:
  
  discard

The following object is masked from ‘package:readr’:
  
  col_factor
> 
  > # Summarize total sales by life stage
  > life_stage_sales <- data3 %>%
  +     group_by(LIFESTAGE) %>%
  +     summarise(
    +         Total_Sales = sum(TOT_SALES),
    +         .groups = "drop"
    +     )
> 
  > # Create the chart
  > ggplot(life_stage_sales,
           +        aes(x = reorder(LIFESTAGE, Total_Sales),
                        +            y = Total_Sales)) +
  +     geom_col(fill = "steelblue") +
  +     geom_text(aes(label = comma(round(Total_Sales))),
                  +               hjust = -0.1,
                  +               size = 4) +
  +     coord_flip() +
  +     scale_y_continuous(
    +         labels = comma,
    +         expand = expansion(mult = c(0, 0.08))
    +     ) +
  +     labs(
    +         title = "Total Sales by Customer Life Stage",
    +         x = "Life Stage",
    +         y = "Total Sales ($)"
    +     ) +
  +     theme_minimal() +
  +     theme(
    +         plot.title = element_text(
      +             hjust = 0.5,
      +             face = "bold",
      +             size = 16
      +         ),
    +         axis.title = element_text(
      +             face = "bold",
      +             size = 12
      +         ),
    +         axis.text = element_text(size = 11)
    +     )
> 
  > #Total Sales by Customer Type
  > customer_sales <- data3 %>%
  +     group_by(PREMIUM_CUSTOMER) %>%
  +     summarise(Total_Sales = sum(TOT_SALES), .groups = "drop")
> 
  > ggplot(customer_sales,
           +        aes(x = reorder(PREMIUM_CUSTOMER, Total_Sales),
                        +            y = Total_Sales)) +
  +     geom_col(fill = "steelblue") +
  +     geom_text(aes(label = comma(round(Total_Sales))),
                  +               vjust = -0.4,
                  +               size = 4) +
  +     scale_y_continuous(labels = comma,
                           +                        expand = expansion(mult = c(0,0.08))) +
  +     labs(
    +         title = "Total Sales by Customer Type",
    +         x = "Customer Type",
    +         y = "Total Sales ($)"
    +     ) +
  +     theme_minimal() +
  +     theme(
    +         plot.title = element_text(face="bold",hjust=.5,size=16),
    +         axis.title = element_text(face="bold")
    +     )
> 
  > #Top 10 brands by Total sales
  > top10_brands <- brand_sales %>%
  +     slice_max(Total_Sales, n = 10)
> 
  > ggplot(top10_brands,
           +        aes(x = reorder(BRAND, Total_Sales),
                        +            y = Total_Sales)) +
  +     geom_col(fill = "steelblue") +
  +     geom_text(aes(label = comma(round(Total_Sales))),
                  +               hjust = -0.1,
                  +               size = 3.8) +
  +     coord_flip() +
  +     scale_y_continuous(labels = comma,
                           +                        expand = expansion(mult = c(0,0.08))) +
  +     labs(
    +         title = "Top 10 Brands by Total Sales",
    +         x = "Brand",
    +         y = "Total Sales ($)"
    +     ) +
  +     theme_minimal() +
  +     theme(
    +         plot.title = element_text(face="bold",hjust=.5,size=16),
    +         axis.title = element_text(face="bold")
    +     )
> 
  > #Top 10 Pack Sizes
  > pack_sales <- data3 %>%
  +     group_by(PACK_SIZE) %>%
  +     summarise(
    +         Total_Sales = sum(TOT_SALES),
    +         .groups = "drop"
    +     ) %>%
  +     arrange(desc(Total_Sales))
> 
  > top10_pack <- pack_sales %>%
  +     slice_max(Total_Sales, n = 10)
> 
  > ggplot(top10_pack,
           +        aes(x = reorder(as.factor(PACK_SIZE), Total_Sales),
                        +            y = Total_Sales)) +
  +     geom_col(fill = "steelblue") +
  +     geom_text(aes(label = comma(round(Total_Sales))),
                  +               vjust = -0.4,
                  +               size = 3.8) +
  +     scale_y_continuous(labels = comma,
                           +                        expand = expansion(mult = c(0,0.08))) +
  +     labs(
    +         title = "Top 10 Pack Sizes by Total Sales",
    +         x = "Pack Size (g)",
    +         y = "Total Sales ($)"
    +     ) +
  +     theme_minimal() +
  +     theme(
    +         plot.title = element_text(face="bold",hjust=.5,size=16),
    +         axis.title = element_text(face="bold")
    +     )
> 
  > #Top brand by Customer Segment
  > ggplot(top_brand,
           +        aes(x = reorder(paste(LIFESTAGE,
                                          +                              PREMIUM_CUSTOMER,
                                          +                              sep = " - "),
                                    +                        Sales),
                        +            y = Sales)) +
  +     geom_col(fill = "steelblue") +
  +     geom_text(aes(label = comma(round(Sales))),
                  +               hjust = -0.1,
                  +               size = 3.5) +
  +     coord_flip() +
  +     scale_y_continuous(labels = comma,
                           +                        expand = expansion(mult = c(0,0.08))) +
  +     labs(
    +         title = "Top Brand by Customer Segment",
    +         x = "Customer Segment",
    +         y = "Total Sales ($)"
    +     ) +
  +     theme_minimal() +
  +     theme(
    +         plot.title = element_text(face="bold",hjust=.5,size=16),
    +         axis.title = element_text(face="bold"),
    +         axis.text.y = element_text(size=8)
    +     )
> 
  > #Average Spend by Customer Type
  > avg_spend <- data3 %>%
  +     group_by(PREMIUM_CUSTOMER) %>%
  +     summarise(
    +         Avg_Spend = mean(TOT_SALES),
    +         .groups = "drop"
    +     )
> 
  > ggplot(avg_spend,
           +        aes(x = PREMIUM_CUSTOMER,
                        +            y = Avg_Spend)) +
  +     geom_col(fill = "steelblue") +
  +     geom_text(aes(label = round(Avg_Spend,2)),
                  +               vjust = -0.4,
                  +               size = 4) +
  +     labs(
    +         title = "Average Spend per Transaction by Customer Type",
    +         x = "Customer Type",
    +         y = "Average Spend ($)"
    +     ) +
  +     theme_minimal() +
  +     theme(
    +         plot.title = element_text(face="bold",hjust=.5,size=16),
    +         axis.title = element_text(face="bold")
    +     )
> 
  > #Average Units purchased by Life Stage
  > avg_units <- data3 %>%
  +     group_by(LIFESTAGE) %>%
  +     summarise(
    +         Avg_Units = mean(PROD_QTY),
    +         .groups = "drop"
    +     )
> 
  > ggplot(avg_units,
           +        aes(x = reorder(LIFESTAGE, Avg_Units),
                        +            y = Avg_Units)) +
  +     geom_col(fill = "steelblue") +
  +     geom_text(aes(label = round(Avg_Units,2)),
                  +               hjust = -0.1,
                  +               size = 4) +
  +     coord_flip() +
  +     labs(
    +         title = "Average Units Purchased by Life Stage",
    +         x = "Life Stage",
    +         y = "Average Units"
    +     ) +
  +     theme_minimal() +
  +     theme(
    +         plot.title = element_text(face="bold",hjust=.5,size=16),
    +         axis.title = element_text(face="bold")
    +     )