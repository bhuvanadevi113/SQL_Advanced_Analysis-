# SQL_Advanced_Analysis
Noon launched Food in Dubai on 1st of May and  line manager has asked me to share key performance metrics to gauge the performance of the verticals. 
All the data of orders is being stored in the below table  and  used this table to write queries to find the insights.
This Orders table contains records of all orders placed on noon Food.
<img width="504" alt="image" src="https://github.com/user-attachments/assets/6c7fa077-0f13-48cd-bd69-d578db853ff9" />

## Business Questions
### 1)Find the most popular restaurant or outlet for each cuisine.
  📊 Insight:\
Understand which brands are leading in each food category.\
Useful for promotions, partnerships, and new launches (e.g., which outlet to feature or boost).

### 2)Find daily new customer count from the launch date (Everyday how many new customers we are acquiring)
  📈 Insight:\
Track acquisition trends day by day.\
See spikes or drops — maybe after campaigns, festivals, or events.\
Helps evaluate marketing performance over time.\
Identify best days and silent periods for customer sign-ups.


### 3)Count of all the users who were acquired in January Jan2025 and only placed in Jan and did not place any other order
  🔍 Insight:\
Identify one-time users — people who never came back after the first month.\
Very useful for retention analysis.\
Signals need for re-engagement campaigns targeting these customers.

### 4)List all the customers with no order in the last 7 days but were acquired one month ago with their first order on promo
 🔥 Insight:\
Spot recently acquired customers who are at risk of churn.\
They used a promo to join, but didn’t stay active.\
Very useful to design early reactivation triggers or personalized nudges (like extra discounts, loyalty programs).

### 5)Growth team is planning to create trigger that will target customers after their  very third order with the personalized communication and they have asked  to create a query for this
 🛎️ Insight:\
After 3 orders, customers show strong buying intent → they are moving from "new" to "loyal".\
Target them with personalized rewards (e.g., loyalty membership, discounts, upgrade offers).\
Helps boost lifetime value (LTV) and reduce churn.

### 6)list the customers who placed more than one orders and all their orders are promo only
 🧠 Insight:\
Identify promo-dependent customers.\
These users only order if there is a discount.\
Important for profitability — helps decide whether to continue heavy discounting for them or move them towards full-price behavior.

### 7)what percentage of customers where organically acquired in Jan 2025?(placed their first order without promo code)

 📉 Insight:\
Measure true organic growth (i.e., customers who came without a promo offer).\
A higher organic percentage = strong brand value and product-market fit.\
Helps in budgeting marketing spend — if organic is strong, less need for paid promotions.\

These insights are super important for growth, marketing, product, and retention teams.

## SQL concepts
<img width="590" alt="image" src="https://github.com/user-attachments/assets/0d0283e9-a58b-479a-8e80-1a57cfe23159" />

