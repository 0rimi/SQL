/******************
******그룹함수*******
*******************/

--오류발생 > 1개의 row에 avg표십 ㅜㄹ가.
select first_name, avg(salary)
from employees;

--그룹함수 avg
select avg(salary)
from employees;

select round(avg(salary),0)
from employees;

--그룹함수 count()
select count(*)
from employees;

select count(*), sum(salary), avg(nvl(salary,0)),
       min(salary), max(salary)
from employees;

/******************
****Group by절******
*******************/
select avg(salary), department_id, min(salary)
from employees
group by department_id;
