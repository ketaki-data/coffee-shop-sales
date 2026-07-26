# COFFEE SHOP SALES ANALYSIS PROJECT 1 - DATA SIZE - 1,48,000 (DISHA COMPUTERS)

# GENERAL COMMAND TO SEE THE WHOLE TABLE 

select * from coffeeshopsales;

/*CONVERT DATE (transaction_date) COLUMN TO PROPER DATE FORMAT*/

update coffeeshopsales 
set transaction_date =
str_to_date(transaction_date,'%Y-%m-%d');


/*ALTER DATE (transaction_date) column to DATE DATA TYPE*/

alter table coffeeshopsales
modify column transaction_date date;


/*CONVERT TIME (transaction_time) COLUMN TO PROPER DATE FORMAT*/

update coffeeshopsales
set transaction_time = str_to_date(transaction_time,'%H:%i:%s');

/*ALTER TIME(transaction_time) COLUMN TO DATE DATA TYPE*/

ALTER TABLE coffeeshopsales
modify column transaction_time time;

/*DATA TYPES OF DIFFERENT COLUMNS*/

describe coffeeshopsales;


/*TOTAL SALES*/

select round(sum(unit_price * transaction_qty)) as TOTAL_SALES
From coffeeshopsales
where MONTH (Transaction_date) =2;


/*TOTAL SALES KPI _MOM DIFFERENCE AND MOM GROWTH*/ 

select 
      Month (transaction_date) as month,
      Round (Sum(unit_price*transaction_qty)) as TOTAL_SALES,
      (sum(unit_price*transaction_qty) -lag(sum(unit_price*transaction_qty),1)
      over(order by month(transaction_date)))/lag(sum(unit_price*transaction_qty),1)
      over(order by month(transaction_date))*100 as MOM_INCREASE_PERCENTAGE
      from
          coffeeshopsales
	  where
           month(transaction_date) in (4,5)
	  group by 
             month(transaction_date)
	  order by 
             month(transaction_date);


/*TOTAL ORDERS*/

select count(transaction_id) as TOTAL_ORDERS
from coffeeshopsales
Where month(transaction_date) =5;


/*TOTAL ORDERS KPI _MOM DIFFERENCE AND MOM GROWTH*/ 

select 
		month(transaction_date) as month,
        round(count(transaction_id)) as TOTAL_ORDERS, 
        (count(transaction_id) - lag(count(transaction_id),1)
        over(order by month(transaction_date))) / lag(count(transaction_id),1)
        over(order by month(transaction_date))* 100 as MOM_INCREASE_PERCENTAGE
FROM
	coffeeshopsales
where 
	month(transaction_date) in (1,2)
group by
		month(transaction_date)
order by 
		month(transaction_date);


/*TOTAL QUANTITY SOLD*/ 

select sum(transaction_qty) as TOTAL_QUANTITY_SOLD
from coffeeshopsales
where month(transaction_date) =2;


/*TOTAL QUANTITY SOLD KPI - MOM DIFFERENCE AND MOM GROWTH*/ 

select 
		month(transaction_date) as month,
        round(sum(transaction_qty)) as TOTAL_QUANTITY_SOLD, 
        (sum(transaction_qty)-lag(sum(transaction_qty),1)
        over(order by month (transaction_date))) /lag(sum(transaction_qty),1)
		over(order by month(transaction_date))* 100 as MOM_INCREASE_PERCENTAGE
from 
	coffeeshopsales
where
	month(transaction_date) in(1,2)
group by
		month(transaction_date)
order by 
		month(transaction_date);
                
                
/*CALENDAR TABLE - DAILY SALES, QUANTITY AND TOTAL ORDERS*/ 

SELECT
		SUM(unit_price*transaction_qty) as TOTAL_SALES,
        sum(transaction_qty) as TOTAL_QUANTITY_SOLD,
        count(transaction_id) as TOTAL_ORDERS
from 
	coffeeshopsales
where
	transaction_date = '2023-02-18';
    
    
/*SALES TREND OVER PERIOD*/ 
    
select avg(total_sales) as AVERAGE_SALES 
from (
		select
				sum(unit_price*transaction_qty) as TOTAL_SALES
		from
				coffeeshopsales
		where 
				month(transaction_date) =2 
		group by 
				transaction_date
	  ) as internal_query;
      
      
/*DAILY SALES FOR MONTH SELECTED*/ 

select
		day(transaction_date) as DAY_OF_MONTH,
        round(sum(unit_price*transaction_qty),1) as TOTAL_SALES
from
	coffeeshopsales
where
	month(transaction_date) =2
group by 
		day(transaction_date)
order by
		day(transaction_date);
    
    
/*COMPARING DAILY SALES WITH AVERAGE SALES - IF GREATER THAN "ABOVE AVERAGE" AND LESSER THAN "BELOW AVERAGE"*/

select 
		DAY_OF_MONTH,
case 
	when TOTAL_SALES > AVG_SALES THEN "ABOVE AVERAGE"
    when TOTAL_SALES < AVG_SALES THEN "BELOW AVERAGE"
    else "AVERAGE"
END as SALES_STATUS,
TOTAL_SALES
from (
		select 
				DAY(transaction_date) as DAY_OF_MONTH,
                SUM(unit_price*transaction_qty) as TOTAL_SALES, 
                AVG(SUM(unit_price*transaction_qty)) over () as AVG_SALES
		from
				coffeeshopsales
		where 
				month(transaction_date) =2
		group by
				day(transaction_date)
		) as SALES_DATA
        order by
				DAY_OF_MONTH;
                
                
/*SALES BY WEEKDAY/ WEEKEND */ 

select 
		case 
			when DAYOFWEEK (transaction_date) in (1,7) then "WEEKENDS"
			else "WEEKDAYS"
        end as DAY_type,
round(sum(unit_price*transaction_qty),2) as TOTAL_SALES
from 
	coffeeshopsales
where 
	month(transaction_date) =2 
group by
		case 
			when DAYOFWEEK (transaction_date) in (1,7) then "WEEKENDS"
            else "WEEKDAYS"
END;


/*SALES BY STORE LOCATION*/ 

select 
		store_location, 
		sum(unit_price*transaction_qty) as TOTAL_SALES
from 
		coffeeshopsales
where 
		month(transaction_date) = 2 
group by
		store_location
order by 
		sum(unit_price*transaction_qty) DESC;
        
        
/*SALES BY PRODUCT CATEGORY*/

select 
		product_category,
        round(sum(unit_price*transaction_qty),1) as TOTAL_SALES
from 
		coffeeshopsales
where 
		month(transaction_date) = 2 
group by 
		product_category
order by
		sum(unit_price*transaction_qty) DESC;


/*SALES BY PRODUCTS(TOP 10)*/ 

select 
		product_type,
        round(sum(unit_price*transaction_qty),1)as TOTAL_SALES
from 
		coffeeshopsales
where
		month(transaction_date) = 2 
group by 
		product_type
order by
		sum(unit_price*transaction_qty) DESC 
LIMIT 10;


/*SALES BY DAY|HOUR*/ 

select 
		ROUND(SUM(unit_price*transaction_qty)) as TOTAL_SALES, 
        sum(transaction_qty) as TOTAL_QUANTITY,
        count(*) as TOTAL_ORDERS
from 
		coffeeshopsales
where
		dayofweek(transaction_date) =3       #3rd date
        and hour(transaction_time) =8        #08:00 o'clock
        and month(transaction_date) =2;    #february month 
        
        
/*TO GET SALES FROM MONDAY TO SUNDAY FOR MONTH OF MAY*/ 

select 
		case 
				when dayofweek(transaction_date) =2 then "MONDAY"
                when dayofweek(transaction_date) =3 then "TUESDAY"
                when dayofweek(transaction_date) =4 then "WEDNESDAY"
                when dayofweek(transaction_date) =5 then "THURSDAY"
                when dayofweek(transaction_date) =6 then "FRIDAY"
                when dayofweek(transaction_date) =7 then "SATURDAY"
                else "SUNDAY"
		end as DAY_OF_WEEK,
        round(sum(unit_price*transaction_qty)) as TOTAL_SALES
from 	
		coffeeshopsales
where 
		month(transaction_date) =5
group by 
		case 
			when dayofweek(transaction_date) =2 then "MONDAY"
                when dayofweek(transaction_date) =3 then "TUESDAY"
                when dayofweek(transaction_date) =4 then "WEDNESDAY"
                when dayofweek(transaction_date) =5 then "THURSDAY"
                when dayofweek(transaction_date) =6 then "FRIDAY"
                when dayofweek(transaction_date) =7 then "SATURDAY"
                else "SUNDAY"
		END;


/*TO GET SALES FOR ALL HOURS FOR MONTH OF MAY*/ 

select 
		hour(transaction_time) as HOUR_OF_DAY,
        round(sum(unit_price*transaction_qty)) as TOTAL_SALES
from 
		coffeeshopsales
where 
		month(transaction_date) =5
group by 										#group by used to classify 
		hour(transaction_time)       			
order by 										#order by to put in ascending or descending order. 
		hour(transaction_time) asc;   			
        

