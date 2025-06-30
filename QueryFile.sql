-- 1) retrieve the Name , SSN and Nationality for American Guestes
SELECT fname,ssn,nationality
FROM guest
WHERE Nationality = 'American';

-- 2) retrieve the Total Number of Booked Rooms in each hotel
SELECT name 'Hotel_Name' , total_num_of_rooms - num_of_free_rooms 'Total_Number_Of_Rooked_Rooms'
FROM hotel;

-- 3) retrieve the name of employee who has letter u in his/her name and have salary between 2100 and 2500
SELECT fname,lname,salary
from employee
WHERE fname like '%u%' and salary between 2100 and 2500;

-- 4) retrieve the name of the guest who rate the hotel with 3 stars
SELECT g.fname 'Guest_Name' , h.name 'Hotel_Name' , r.rate_stars
FROM guest g , hotel h , review r
where g.SSN = r.Guest_SSN and h.ID = r.Hotel_ID and r.Rate_stars = 3;

-- 5) retrieve the name of employee who's salary greater than average salary of employees
SELECT fname 'Employee_Name' , salary 'Salary'
FROM employee
WHERE salary > (SELECT avg(salary)
FROM employee);

-- 6) retrieve the Average room price in each hotel
SELECT h.Name , avg(r.price) 'Average_Room_Price'
FROM hotel h , room r
WHERE h.ID = r.Hotel_ID
GROUP BY h.ID;

-- 7) retrieve the hotels that contain suit with price more than 320 
SELECT distinct h.name
FROM hotel h , room r
WHERE r.Type = 'Suite' and r.price > 320 and r.Hotel_ID = h.ID
ORDER BY name;

-- 8) retrieve the dependent name who is a son for an employee
SELECT e.fname 'Employee_Name' , d.name 'Dependent_Name' , d.relation 'Relationship'
FROM employee e , dependent d
WHERE e.SSN = d.Employee_SSN and d.Relation = 'son';

-- 9) retrieve the Hotels with hall capacity greater than 200
SELECT h.name 'Hotel_Name' , hl.hall_num 'Hall_Number' , hl.capacity 'Hall_capacity'
FROM hotel h , hall hl
WHERE h.ID = hl.Hotel_ID and hl.Capacity >200;

-- 10) retrieve the salaries of employee working as Housekeeper after increasing his/her salary by 10 percent raise
SELECT fname 'Employee_Name' , salary 'Current_Salary' , 1.1 * salary 'Increased_Salary'
FROM employee
WHERE jop_description = 'Housekeeper';

-- 11) retrieve the name of each employee and his/her supervisor
SELECT e.fname 'Employee_Name' , s.fname 'Supervisor_Name'
FROM employee e left join employee s
on e.Super_ssn = s.SSN;

-- 12) retrieve the hotel with the highest number of free rooms
SELECT name 'Hotel_Name' , num_of_free_rooms
FROM hotel
WHERE num_of_free_rooms = (select max(num_of_free_rooms)
FROM hotel);

-- 13) retrieve each hotel name along with it's maximum room price
SELECT h.name 'Hotel_Name' , max(r.price) 'Max_Room_Price'
FROM hotel h , room r
WHERE h.ID = r.Hotel_ID
GROUP BY h.name;

-- 14) retrieve the hotel name and owner name for owner who own more than one hotel
SELECT h.name 'Hotel_Name' , o.fname 'Owner_Name'
FROM hotel h JOIN own ow
ON h.ID = ow.Hotel_ID
JOIN owner o
ON ow.Owner_SSN = o.SSN
WHERE ow.Owner_SSN IN ( SELECT Owner_SSN
						FROM own
                        GROUP BY Owner_SSN
                        HAVING count(Hotel_ID) > 1
);

-- 15) retrieve the female owners for hotels
SELECT h.name 'Hotel_Name' , o.fname 'Owner_Name'
FROM hotel h , own ow , owner o
WHERE h.id = ow.Hotel_ID and o.SSN = ow.Owner_SSN and o.sex = 'F';

-- 16) retrieve the hotels that does't contain GYM 
SELECT h.name 'Hotel_Name', h.ID , h.Location
FROM hotel h
WHERE h.ID NOT IN 
	(SELECT Hotel_ID
	FROM hotel_service
	WHERE service = 'GYM')
ORDER BY h.id;

-- 17) retrive the oldest manager(supervisor)
SELECT Fname 'First_Name', SSN 'Supervisor_SSN' , Bdate 'Birthdate'
FROM Employee
WHERE SSN IN (SELECT DISTINCT Super_ssn
			  FROM Employee)
ORDER BY Bdate ASC
LIMIT 1;

-- 18) retrive the phone number of Alexandria Beach Hotel manager 
SELECT e.fname 'Manager_Name', e.phone 'Manager_Phone'
FROM Employee e , hotel h
WHERE e.ssn = h.MGR_SSN and h.Name = 'Alexandria Beach Hotel';

-- 19) retrive the guest which pay cash and rate room with Excellent review
SELECT g.fname 'Guest_Name',r.Room_num , br.Pay_method
FROM guest g , book_room br , room r
WHERE g.SSN = br.Guest_SSN and br.Room_num = r.Room_num and br.Pay_method = 'cash'
AND br.Review = 'Excellent';

 -- 20) retrive the number of guests from each nationality:
SELECT Nationality, COUNT(*) 'Total_Guest_Count'
FROM Guest
GROUP BY Nationality;


-- 21) retrive the average rate for each hotel
SELECT Hotel_ID, AVG(CAST(Rate_stars AS DECIMAL)) AS Average_Rating
FROM Review
GROUP BY Hotel_ID;