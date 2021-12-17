/********************
*group by 절
********************/
select avg(salary)
from employees
group by department_id;

select department_id, COUNT(*), avg(salary)
from employees
group by department_id
;

select department_id, trunc(avg(salary),0), count(*), job_id
from employees
group by department_id, job_id
order by department_id asc, avg(salary) asc;

--예제 : 연봉합계 20000이상, 부서번호, 인원수, 급여합계 출력
--그룹함수가 잇을땐..!
select department_id, count(*), sum(salary)
from employees
group by department_id
order by department_id asc;

--having절 : 그룹함수과 group by절에 참여한 컬럼만 사용가능.
select department_id, count(*), sum(salary)
from employees
group by department_id
having sum(salary) >= 20000
order by department_id;

--Case ~ END 문
select employee_id, first_name, job_id,
       salary,
       case when job_id = 'AC_ACCOUNT' then salary*1.1
            when job_id = 'SA_REP' then salary*1.2
            when job_id = 'ST_CLEK' then salary*1.3
            else salary
       end realSalary
from employees;

--DECODE()문
select employee_id,
       salary,
       DECODE(job_id, 'ac_account', salary * 1.1,
                      'sa_rep', salary * 1.2,
                      'st_clerk', salary * 1.3,
              salary) as realSalary
from employees;

--예제
select first_name, department_id,
       case when department_id between 10 and 50 then 'A-TEAM'
            when department_id between 60 and 100 then 'B-TEAM'
            when department_id between 110 and 150 then 'C-TEAM'
            else '팀없음'
       end as team
from employees
order by department_id;