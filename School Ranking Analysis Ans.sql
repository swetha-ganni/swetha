-------Write a query to display student id and first name from the student table if the age is greater than or equal to 16 and the student last name is kumar---
select s_id,s_fname from student_datasets
where age>=16 and s_lname='kumar';

-------Wrute a query to display all the details from the marksheet table if the score is between 800 to 1000
select* from marksheet_datasets
where score between 800 and 1000;

-----Write a query to display the marksheet details from the marksheet table by adding 5 to the score and by naming the column as new score-----
select score,year,class,ranking,s_id,score+5 as new_score
from marksheet_datasets

----Write a query to display yhe marksheet details in the descending order of the score-----
select* from marksheet_datasets
order by score desc 

-------Write a query to display details of the students whose first name starts with a------
select* from student_datasets
where s_fname like 'a%'

