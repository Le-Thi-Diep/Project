# SALES DATA ANALYSIS FOR THE YEAR 2019

This project allows me to analyze sales data for the year 2019 to uncover important insights that can significantly benefit sales performance.

## Source Data:
The source data includes 12 CSV files containing sales data for each of the 12 months in 2019. These files are used to perform the analyses in the project.

## Data Cleaning and Analysis:
This process includes:
- Importing necessary libraries and loading data
- Cleaning and preprocessing data:
  - Merging 12-month data
  - Adding a month column

## Report:
1. What was the best month for sales? How much was earned that month?
2. What city has the best sales?
3. What time should we display ads to maximize the likelihood of customers buying products?
4. What products are most often sold together?
5. What product sold the most? Why do you think it sold the most?

## Exploratory Data Analysis
### Questions:
1. What's the best month for sales? How much was earned that month?
2. What city has the best sales?
3. What time should we display ads to maximize the likelihood of customers buying products?
4. What products are most often sold together?
5. What product sold the most? Why do you think it sold the most?

### Findings:
1. What's the best month for sales? How much was earned that month?
-Seasonality Pattern: 
The data shows a clear seasonal pattern, with the highest sales months being 11 and 12 (November and December). 
This suggests a significant spike in sales towards the end of the year, likely due to factors such as holiday shopping, end-of-year promotions, or other seasonal drivers of demand.
-Sales Trend: 
Overall, the sales revenue trend is increasing over the 12-month period. 
The sales revenue starts at around 1.8 million in month 1, peaks at over 4.6 million in month 12, and averages around 2.9 million across the full 12 months.
2. What city has the best sales?
The city with the best sales was San Francisco, with total sales of $8262203.91.
3. What time should we display ads to maximize the likelihood of customers buying products?
The chart shows that the total number of orders peaks around lunchtime, from 11 AM to 1 PM, and in the evening, from around 6 PM to 8 PM. This makes sense as the majority of online shoppers are typically working-age individuals or younger people like students. At these times, many employees have finished work, and students have finished their classes, giving them more free time to browse online shopping platforms or view advertisements.
Therefore, it is advisable to display advertisements during these times or 30 minutes prior, to ensure maximum visibility and promote purchasing activity when customers are most active.
4. What products are most often sold together?
Based on the results of data analysis on the frequency of product pairs sold together, it is recommended to implement a product suggestion system during the customer's shopping process. Specifically, when customers choose to buy an iPhone, the system should suggest adding a Lightning charging cable and wired headphones, as these product pairs appear together up to 1005 and 447 times, respectively. Similarly, with a Google Phone, a USB-C charging cable and wired headphones should be suggested, with a frequency of appearance of 987 and 414 times, respectively. These suggestions not only help customers easily find suitable and necessary products but also increase the rate of additional purchases, thereby optimizing revenue. These suggestions, based on frequency data, will be highly persuasive as they accurately reflect the actual needs and shopping behaviors of customers.
5. What product sold the most? Why do you think it sold the most?
-General Trend:
 + Typically, lower-priced items such as AA and AAA batteries show high quantities ordered (27635 and 31017 respectively).
 + Higher-priced items like the MacBook Pro Laptop ($1700) and ThinkPad Laptop ($999.99) have lower quantities ordered (4728 and 4130 respectively).
 + Products such as Lightning Charging Cable and USB-C Charging Cable, have relatively low prices ($14.95 and $11.95) and high order quantities (23217 and 23975). This is not necessarily due to price but also shows that these items are essential accessories with consistent demand.

-Exceptions:
 + Some mid-range priced items, like the Apple Airpods Headphones ($150) and Bose SoundSport Headphones ($99.99), still have significant quantities ordered (15661 and 13457 respectively). This may be due to brand loyalty, product quality, or popularity.
 + The iPhone, priced at $700, also shows a relatively high quantity ordered (6849), indicating strong brand influence and demand despite the higher price.

-Observations:
 + The Vareebadd Phone, although lower-priced ($400), has a significantly lower quantity ordered (2068), possibly due to lower brand recognition or perceived quality compared to competitors like the iPhone and Google Phone.

=> This analysis supports the general notion that lower-priced items tend to sell in higher quantities. However, factors such as brand reputation, product quality, and essential nature of the product can influence sales volumes significantly, as seen with items like Apple Airpods and iPhones.
