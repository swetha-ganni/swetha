------------------Client Table-------------
create table Clients  
(ClientID int Primary Key, 
CustomerName varchar(50) not null,
City varchar(30),
Email_id varchar(30) unique,
Phone varchar(10),
Business varchar(50) not null)


insert into Clients values 
(1001,'ACMEUtilities','Noida','contact@acmeutil.com',9567880032,'Manufacturing'),
(1002,'TrackonConsultant','Mumbai','consult@trackon.com',8734210090,'Consultant'),
(1003,'MoneySaverDistribution','Kolkata','save@moneysaver.com',7799886655,'Reseller'),
(1004,'LawfulCorp','Chennai','justice@lawful.com',9210342219,'Professional')

select* from Clients

-------DEPARTMENT TABLE--------------

create table Department
(DepartmentNo int primary key, 
DepartmentName varchar(50) not null,
City varchar(50))

insert into Department values
(10,'Design','Pune'),
(20,'Development','Pune'),
(30,'Testing','Mumbai'),
(40,'Document','Mumbai')

select* from Department


------EMPLOYEE TABLE-------
create table Employees
(EmployeeNo int primary key,
EmployeeName varchar(50) not null,
JobTitle varchar(50), 
Salary int, 
Deptno int foreign key references Department(DepartmentNo)
)

insert Employees values 
(7001,'Sandeep','Analyst',25000,10),
(7002,'Rajesh','Designer',30000,10),
(7003,'Madhav','Developer',40000,20),
(7004,'Manoj','Developer',40000,20),
(7005,'Abhay','Designer',35000,10),
(7006,'Uma','Tester',30000,30),
(7007,'Gita','Tech Wtiter',30000,40),
(7008,'Priya','Tester',35000,30),
(7009,'Nutan','Developer',45000,20),
(7010,'Smita','Analyst',20000,10),
(7011,'Anand','Project Manager',65000,10)

select* from Employees


-----------PROJECT----------

create table Projects
(ProjectID int Primary key,
ProjectDescription varchar(30) NOT NULL,
StartDate date, PlannedEndDate date,
ActualEndDate date, 
Budget int check (Budget>0),
ClientID int foreign key references Clients(ClientID) 
)

insert into Projects values
(401,'Inventory','2011-04-01','2011-10-01','2011-10-31',150000,1001),
(402,'Accounting','2011-04-01','2012-01-01',null,500000,1002),
(403,'Payroll','2011-10-01','2011-12-31',null,75000,1003),
(404,'Contact Management','2011-11-01','2011-12-31',null,50000,1004)

select* from Projects


----------EmployeeProjectTasks-------------------
create table EmployeeProjectTasks
(ProjectID int foreign key references Projects(ProjectID), 
EmployeeNo int foreign key references Employees(EmployeeNo), 
StartDate date,EndDate date,
Task varchar(25) not null,ProjectStatus varchar(15) not null,
primary key(ProjectID,EmployeeNo)
)


insert into EmployeeProjectTasks values
(401,7001,'2011-04-01','2011-05-11','System Analysis','Completed'),
(401,7002,'2011-04-21','2011-05-30','System Design','Completed'),
(401,7003,'2011-06-01','2011-07-15','Coding','Completed'),
(401,7004,'2011-07-18','2011-09-01','Coding','Completed'),
(401,7006,'2011-09-03','2011-09-15','Testing','Completed'),
(401,7009,'2011-09-18','2011-10-05','Code Change','Completed'),
(401,7008,'2011-10-06','2011-10-16','Testing','Completed'),
(401,7007,'2011-10-06','2011-10-22','Documentation','Completed'),
(401,7011,'2011-10-22','2011-10-31','Sign off','Completed'),
(402,7010,'2011-08-01','2011-08-20','System Analysis','Completed'),
(402,7002,'2011-08-22','2011-09-30','System Design','Completed'),
(402,7004,'2011-10-01',NULL,'Coding','In Progress')

select* from EmployeeProjectTasks


----------------------------------------------------------OBJECTIVE BEGINNER-------------------------------------------------------------

-----Display customer details with business as 'Consultant'-----
select* from Clients
where Business='Consultant'

-----Display employee details who are not 'Developers'---------
select* from Employees
where JobTitle!='Developer'

-------Display project details with budget>100000--------------
select* from Projects
where Budget>100000

--------Display details of project that are already finished-------
select* from EmployeeProjectTasks
where ProjectStatus='Completed'

--------Display employee names beginning with 'M'------------
select* from Employees
where EmployeeName like 'M%'

-------Display employee names ending with 'a'---------
select* from Employees
where EmployeeName like '%a'

--------Display the number of months project 'Inventory' took for completion-----
select DATEDIFF(month, StartDate,ActualEndDate) as CompletionPeriod
from Projects
where ProjectDescription='Inventory'


-------Display the task that is 'In Progress'---------
select* from EmployeeProjectTasks
where ProjectStatus='In Progress'


--------Display details of departments located in Pune-------
Select* from Department
where City='Pune'

-----Display employee name and salary in descending order of salary-------
select EmployeeName, Salary from Employees 
order by Salary DESC

-------Display tasks in ascending order of end date-------
select Task,EndDate from EmployeeProjectTasks
order by EndDate 

-------Display distinct jobs from Employees table--------
select distinct JobTitle
from Employees

------Display employee names in all uppercase----------
select upper(EmployeeName) as UppercaseEmployees
from Employees

------Display employee name, salary and bonus calculated ass 25% of salary----
select EmployeeName, Salary, Salary+(Salary*0.25) as Bonus
from Employees


-----Display day of week for each start date of the project----
select StartDate from Projects
select DATENAME(DD, GETDATE()) as StartingDay


--------Display first 3 characters of each client name--------
select left(CustomerName, 3) as First3Char
from Clients

------Display project budget values formatted as '$150,000'-----
select ProjectID, Budget,
FORMAT(Budget,'c','us-US') as usd_Budget
from Projects

-------Display planned end date and review date as 3 months after planned end date for each project-----
select PlannedEndDate, 
DATEADD(month,3,PlannedEndDate) as ReviewDate
from Projects

-----------------------------------------------------OBJECTIVE INTERMEDIATE------------------------------------

-----------Display COUNT of clients---------------
select count(CustomerName) 
from Clients

--------Display count of employees and sum of their salaries-------
select count(EmployeeName) as TotalEmployees,
sum(Salary) as TotalSalary
from Employees

----------Display min salary per job-----------
select JobTitle, MIN(Salary) as MinSalary
from Employees
group by JobTitle

---------Display avg salary------------------
select avg(Salary) as AvgSalary
from Employees

--------Display sum fo Budget-------------
select sum(Budget) as TotalBudget
from Projects

----------Display count of 'Coding' task-------
select count(Task) 
from EmployeeProjectTasks
where Task='Coding'

-------Display department wise count and sum of salary of employees-------
select COUNT(Deptno) as DeptwiseCount, 
sum(Salary) as totalSum
from Employees
group by Deptno

------Display client name and their project description, start date and budget---------
select Clients.CustomerName, Projects.ProjectDescription,
Projects.StartDate, Projects.Budget
from Projects
inner join Clients on
Projects.ClientID=Clients.ClientID

---------Display department name, employee name, and job----------
select Department.DepartmentName, Employees.EmployeeName,
Employees.JobTitle
from Employees
inner join Department on Employees.Deptno=Department.DepartmentNo

--------Display name of the employee doing 'System Analysis' along with project name-------
select EmployeeName, JobTitle
from Employees
where JobTitle='Analyst'

--------Display job wise count----------------
selecT JobTitle, count(JobTitle) as NoOfEmployees
from Employees
GROUP BY JobTitle

-------Display employee number not present in EmployeeProjectTeask table using necessary set operator------
select *from Employees
right join EmployeeProjectTasks on
Employees.EmployeeNo=EmployeeProjectTasks.EmployeeNo




-------Display all employee numbers present in both Employee and EmployeeProjectTasks table using necessary set operator--------
select* from Employees
full outer join 
EmployeeProjectTasks on 
Employees.EmployeeNo=EmployeeProjectTasks.EmployeeNo
order by Employees.EmployeeNo



-------------------------------------------------------------OBJECTIVE ADVANCED-----------------------------------------------------------

----------Display employee names who have same job as Madhav-------
select* from Employees
where JobTitle IN (select JobTitle from Employees
WHERE EmployeeName='Madhav')

---------Display employee's name and job who worked on 'Code Change' task project 401------
select EmployeeName, JobTitle
from Employees
select Task
from EmployeeProjectTasks
join EmployeeProjectTasks on 
Employees.EmployeeNo=EmployeeProjectTasks.EmployeeNo
group by JobTitle 
having Task='401'

------Display employee's name whose project's 'Coding' task is In Progress------
select Employees.EmployeeName, 
EmployeeProjectTasks.Task, 
EmployeeProjectTasks.ProjectStatus
from EmployeeProjectTasks
inner join Employees on 
EmployeeProjectTasks.EmployeeNo=Employees.EmployeeNo
where Task='Coding' and ProjectStatus='In Progress'

------Display department number, names and salaries of employees who are earning max salary in their departments-----
select distinct Deptno, EmployeeName, max(Salary)
from Employees
group by EmployeeName
order by max(Salary)

------Create a view named DEPT_EMP with DEPTNO,DNAME,LOC,ENAME,JOB and SALARY columns---------
create view DEPT_EMP as
select DepartmentNo, DepartmentName, City 
from Department
union 
select EmployeeName,Jobtitle,Salary 
from Employees

SELECT* FROM EmployeeProjectTasks

