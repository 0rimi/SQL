/************************
*Sub Query
*************************/

1) 급여 조건                
select first_name, salary
from employees
where salary > 'Den의 급여';

2) Den 의 급여 
select salary
from employees
where first_name = 'Den';

3)sub Query 사용(들여쓰기중요)
select first_name, salary
from employees
where salary > (select salary
                from employees
                where first_name = 'Den');
                

--평균 급여보다 적게 받는 사람의 이름, 급여
select first_name, salary
from employees
where salary < (select avg(salary)
                from employees)
order by salary asc;