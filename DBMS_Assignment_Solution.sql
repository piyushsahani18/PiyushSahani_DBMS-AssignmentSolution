create database `TravelOnTheGO`;
use `TravelOnTheGO`;

-- Q1.
create table `PASSENGER` (
Passenger_Id int auto_increment not null primary key ,
Passenger_Name varchar(20),
Category varchar(19),
Gender varchar(10),
Boarding_City varchar(20),
Destination_City varchar(20),
Distance int,
Bus_Type varchar(20)
);

create table `PRICE` (
Id int auto_increment not null primary key   ,
Bus_Type varchar(20),
Distance int,
Price int
);

-- Q.2
insert into `PASSENGER`(Passenger_Name,Category,Gender,Boarding_City,Destination_City,Distance,Bus_Type) values( 'Sejal', 'AC', 'F', 'Bengaluru', 'Chennai', 350, 'Sleeper');
insert into `PASSENGER`(Passenger_Name,Category,Gender,Boarding_City,Destination_City,Distance,Bus_Type) values( 'Anmol', 'Non-AC', 'M', 'Mumbai', 'Hyderabad', 700, 'Sitting');
insert into `PASSENGER`(Passenger_Name,Category,Gender,Boarding_City,Destination_City,Distance,Bus_Type) values( 'Pallavi', 'AC', 'F', 'Panaji', 'Bengaluru', 600, 'Sleeper');
insert into `PASSENGER`(Passenger_Name,Category,Gender,Boarding_City,Destination_City,Distance,Bus_Type) values( 'Khusboo', 'AC', 'F', 'Chennai', 'Mumbai', 1500, 'Sleeper');
insert into `PASSENGER`(Passenger_Name,Category,Gender,Boarding_City,Destination_City,Distance,Bus_Type) values( 'Udit', 'Non-AC', 'M', 'Trivandrum', 'Panaji', 1000, 'Sleeper');
insert into `PASSENGER`(Passenger_Name,Category,Gender,Boarding_City,Destination_City,Distance,Bus_Type) values( 'Ankur', 'AC', 'M', 'Nagpur', 'Hyderabad', 500, 'Sitting');
insert into `PASSENGER`(Passenger_Name,Category,Gender,Boarding_City,Destination_City,Distance,Bus_Type) values( 'Hemant', 'Non-AC', 'M', 'Panaji', 'Mumbai', 700, 'Sleeper');
insert into `PASSENGER`(Passenger_Name,Category,Gender,Boarding_City,Destination_City,Distance,Bus_Type) values( 'Manish', 'Non-AC', 'M', 'Hyderabad', 'Bengaluru', 500, 'Sitting');
insert into `PASSENGER`(Passenger_Name,Category,Gender,Boarding_City,Destination_City,Distance,Bus_Type) values( 'Piyush', 'AC', 'M', 'Pune', 'Nagpur', 700, 'Sitting');

-- Q2.
insert into `PRICE`(Bus_Type, Distance, Price) values('Sleeper', 350, 770);
insert into `PRICE`(Bus_Type, Distance, Price) values('Sleeper', 500, 1100);
insert into `PRICE`(Bus_Type, Distance, Price) values('Sleeper', 600, 1320);
insert into `PRICE`(Bus_Type, Distance, Price) values('Sleeper', 700, 1540);
insert into `PRICE`(Bus_Type, Distance, Price) values('Sleeper', 1000, 2200);
insert into `PRICE`(Bus_Type, Distance, Price) values('Sleeper', 1200, 2640);
insert into `PRICE`(Bus_Type, Distance, Price) values('Sleeper', 350, 434);
insert into `PRICE`(Bus_Type, Distance, Price) values('Sitting', 500, 620);
insert into `PRICE`(Bus_Type, Distance, Price) values('Sitting', 500, 620);
insert into `PRICE`(Bus_Type, Distance, Price) values('Sitting', 600, 744);
insert into `PRICE`(Bus_Type, Distance, Price) values('Sitting', 700, 868);
insert into `PRICE`(Bus_Type, Distance, Price) values('Sitting', 1000, 1240);
insert into `PRICE`(Bus_Type, Distance, Price) values('Sitting', 1200, 1488);
insert into `PRICE`(Bus_Type, Distance, Price) values('Sitting', 1500, 1860);

-- Q3. 
Select Gender, count(Gender) from PASSENGER Psgr where distance >= 600 group by gender;

-- Q4. 
Select min(price) from PRICE where bus_type = 'Sleeper';

-- Q5. 
Select Passenger_name from PASSENGER where Passenger_name like 'S%';

-- Q6. 
Select Psgr.passenger_name, Psgr.boarding_city, Psgr.destination_city, Psgr.bus_type, min(prc.price) as T_price 
from passenger Psgr inner join price prc on Psgr.bus_type = prc.bus_type and Psgr.distance = prc.distance
group by Psgr.passenger_name; 

-- Q7. 
Select Psgr.Passenger_name, prc.price 
from PASSENGER Psgr inner join price prc on Psgr.bus_type = prc.bus_type and Psgr.distance = prc.distance
where Psgr.bus_type = 'Sitting' and Psgr.distance = 1000;

-- Q8. 
Select prc.bus_type, prc.price from PASSENGER Psgr, price prc where Psgr.passenger_name = 'Pallavi' and Psgr.distance = prc.distance;

-- Q9. 
Select distance from PASSENGER group by distance having count(distance) = 1 order by distance DESC;

-- Q10. 
Select passenger_name, (distance /(Select sum(distance) from PASSENGER) * 100) as Distance_Percent from passenger;

-- Q11. 
Select distance, price,
case  
	when price > 1000 then 'Expensive'
    when price <= 1000 and price > 500 then 'Average Cost'
    else 'Cheap'
end as price_category
from PRICE;