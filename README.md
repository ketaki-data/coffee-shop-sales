# coffee-shop-sales
An end-to-end Power BI &amp; SQL analysis of 16k+ transactions across 3 store locations. Features interactive KPI tracking, sales trend decomposition, weekday vs. weekend patterns, and peak-hour heatmaps to optimize revenue and inventory.

**Coffee Shop Sales Analysis & Performance Dashboard**

## Project Overview
This project presents an interactive **Power BI Dashboard** backed by **SQL-driven data modeling** to analyze sales performance across three coffee shop locations (Hell's Kitchen, Astoria, and Lower Manhattan) for February 2023. 

The goal of this analysis is to evaluate revenue trends, identify peak operational hours, analyze category-level product performance, and provide actionable business recommendations to reverse month-over-month sales declines.

---

## Key Business Metrics (Feb 2023 Overview)
* **Total Revenue:** **$76K** (*-6.8% MoM*)
* **Total Transactions:** **16,359 orders** (*-5.5% MoM*)
* **Total Volume:** **24,000 items sold** (*-5.3% MoM*)
* **Average Daily Revenue:** **$2,719**

---

## Key Insights & Analytical Takeaways

### 1. Revenue Dynamics & Location Balance
* **Balanced Distribution:** Sales are evenly split across all three locations—**Hell's Kitchen ($25.72K)**, **Lower Manhattan ($25.52K)**, and **Astoria ($25.11K)**—indicating consistent brand footprint across neighborhoods.
* **MoM Downturn:** All locations experienced a ~4% to 8% dip in sales compared to the previous month, pointing toward broader seasonal trends or foot-traffic variations rather than location-specific issues.

### 2. Temporal & Customer Behavior Patterns
* **Weekday Dominance:** Weekday sales generate **70.92% ($54K)** of total revenue, confirming that foot traffic is primarily driven by morning working commuters.
* **Peak Hourly Demand:** The day-and-hour matrix highlights heavy concentration between **8:00 AM – 10:00 AM** on weekdays, identifying critical staffing and operational windows.

### 3. Product & Category Revenue Drivers
* **Beverages Lead Revenue:** **Coffee ($29.27K)** and **Tea ($21.73K)** account for the vast majority of total sales.
* **Top Individual Sellers:** **Barista Espresso ($10.03K)** and **Brewed Chai Tea ($8.38K)** are the primary revenue drivers.
* **Cross-Selling Gap:** High-margin food items like **Bakery ($9.04K)** represent a lower proportion of total orders, highlighting a key cross-selling opportunity during morning beverage rushes.

---

##  Strategic Recommendations
1. **Optimize Staffing & Barista Deployment:** Scale up shift capacity between **8:00 AM and 10:00 AM** on weekdays to minimize wait times, maximize throughput, and prevent lost sales during peak commute hours.
2. **Drive Cross-Selling Bundles:** Introduce "Coffee + Bakery" morning combos to raise the average order value (AOV) from beverage-only patrons.
3. **Targeted Weekend Promotions:** Develop weekend loyalty incentives or brunch specials to boost the weekend revenue contribution beyond its current 29% share.

---

##  Tools & Technologies Used
* **Power BI:** Dashboard design, custom DAX metrics (MoM variance, daily averages), and interactive visual layout.
* **SQL:** Data cleaning, aggregation, and temporal extraction (Extracting hour/day dimensions from timestamps).
* **Excel / CSV:** Raw data ingestion and preliminary validation.

---



##  Repository Structure

── data/                  # Raw and cleaned dataset files (or sample files)

── sql/                   # SQL scripts for data transformation & aggregation

── reports/               # Power BI project file (.pbix) & exported PDF/Image

── README.md              # Project documentation
