
select s_id,s_fname from student_datasets
where age>=16 and s_lname='kumar';

select* from marksheet_datasets
where score between 800 and 1000;

select score,year,class,ranking,s_id,score+5 as new_score
from marksheet_datasets

select* from marksheet_datasets
order by score desc 

select* from student_datasets
where s_fname like 'a%'

