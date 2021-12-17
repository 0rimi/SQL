/**********************
*join
**********************/

--사원이름
select *
from employees, departments;

select em.employee_id as 직원ID,
       em.first_name as 이름,
       em.salary as 월급,
       de.department_name,
       em.department_id
from employees em, departments de
where em.department_id = de.department_id;

select em.first_name, de.department_name, jb.job_title, em.salary
from employees em, departments de, jobs jb
where em.department_id = de.department_id
and em.job_id = jb.job_id
and salary >3000;