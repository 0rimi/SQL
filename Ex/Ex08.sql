select first_name, salary
from employees
where salary > (select salary
                from employees
                where first_name = 'Den');
                
--부서번호가 110인 직원의 급여와 같은 모든 직원의 사번 이름, 급여 출력
--1. 부서번호가 110인 직원 리스트
select employee_id, first_name, salary, department_id
from employees
where department_id = 110;
--얘네 급여가 8300 윌리엄, 12008 쉘리 임

--2. 급여를  12008 받는 직원 리스트
select employee_id, first_name, salary, department_id
from employees
where salary = 12008;
--낸시, 쉘리

--3. 급여를 8300 받는 직원리스트
select employee_id, first_name, salary, department_id
from employees
where salary = 8300;
--윌리엄

--4. 부서가 110인 녀석들의 급여와 같은 직원 리스트
select employee_id, first_name, salary, department_id
from employees
where salary in (select salary
                 from employees
                 where department_id = 110);
                 
                 
--각 부서별로 최고 급여를 받는 사원을 출력하세요
select employee_id, first_name, salary, department_id
from employees
where (department_id, salary) in (select department_id, max(salary)
                 from employees
                 group by department_id)
order by department_id asc;


--ANY연산자
--부서번호가 110인 직원의 급여 보다 큰 모든 직원의
--사번, 이름, 급여를 출력하세요.(or연산 -->8300보다 큰)
--1. 부서번호가 110인 직원의 급여
select salary
from employees
where department_id = 110;

--2.부서번호가 110인 직원의 급여(12008,8300)보다 큰 직원리스트
select employee_id, first_name, salary
from employees
where salary > 12008
or salary > 8300;

--3.조합
select first_name, salary, department_id
from employees
where salary >any (select salary
                 from employees
                 where department_id = 110 );
                 

--all 연산자(and 연산자)

                 --부서별 최고급여 받는 사원 출력
select department_id, employee_id, first_name, salary
from employees
where (department_id, salary) in (select department_id, max(salary)
                                  from employees
                                  group by department_id);
                                    
--테이블 조인으로 부서별 최고급여 받는 사원출력
select em.department_id,
       em.first_name,
       em.salary,
       ms.department_id
from employees em, (select department_id, max(salary) salary
                    from employees
                    group by department_id) ms
where em.department_id = ms.department_id
and em.salary = ms.salary;
