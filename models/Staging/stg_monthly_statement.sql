
--Displays the Monthly stats
SELECT dc.month_name, sum(dc.lifetime_value) as Total_Value, sum(number_of_orders) as Total_orders_for_month,
((total_value/1000)*100) as Monthly_Percentage
from dim_customers dc 
group by dc.month_name
