select *
from employees; 

select *
from departments;

select employee_id, first_name, last_name
from employees;

--예)
select first_name, phone_number, hire_date, salary
from EMPLOYEES;

--출력할 컬럼명 별명적용하기
select employee_id as empNo,
       first_name as "f-name",
       salary as "연 봉"
from employees;


--예2)
select employee_id as 사원번호,
       first_name as 이름,
       last_name as "성",
       salary as "급여",
       phone_number as "전화번호",
       email as "이메일",
       hire_date "입사일"
from employees;


--연결 연산자(Concatenation)로 컬럼 합치기
select first_name || ' ' || last_name
       as name
from employees;

select first_name || ' 입사일은 '  || hire_date
from employees;

--산술 연산자 사용하기
select first_name,
       salary,
       salary*12 as 연봉
from employees;


--예제3
select first_name || '-' || last_name as 성명,
       salary as 급여,
       salary*12 as 연봉,
       salary*12+5000 as 연봉2,
       phone_number as 전화번호
from employees;


--where 절
--비교연산자
--부서번호가 10인 사원의 이름을 구하시오
select first_name, last_name, salary, department_id
from employees
where department_id = 50;

--예제
--연봉이 15000이상인 사원들의 이름과 월급을 출력하세요
select first_name, last_name, salary
from employees
where salary >= 15000;

--07/01/01 일 이후에 입사한 사원들의 이름을 구하시오
select first_name, last_name, hire_date
from employees
where hire_date >= '07/01/01';

--이름이 lex인 직원의 연봉을 출력하세요
select first_name, last_name, salary
from employees
where first_name = 'lex';

--조건이 2개 이상
--연봉이 14000이상 17000이하인 사원 이름, 연봉
select first_name, last_name, salary
from employees
where 14000 <= salary
and salary <=17000;

--입사일이 04/01/01 에서 05/12/31 사원, 이름, 입사일
select first_name, last_name, hire_date
from employees
where hire_date >= '04/01/01'
and hire_date <= '05/12/31';

--between(단, 경계값 포함임)
select first_name, last_name, hire_date
from employees
where hire_date between '04/01/01' and '05/12/31';

--비슷한거 다찾기
select first_name, last_name
from employees
where first_name like 'L%';

--이름에 am을 포함한 사원의 이름과 연봉
select first_name, last_name
from employees
where first_name like '%am%';

--이름의 네번째 글자가 a인 사원의 이름을 출력하세요
select first_name, last_name
from employees
where first_name like '___a%';

--IN 연산자로 여러 조건을 검사하기
select first_name, last_name, salary
from employees
where first_name = 'Neena'
or first_name = 'Lex'
or first_name = 'John';

select first_name, last_name, salary
from employees
where first_name in ('Neena', 'Lex', 'John');

--예제: 연봉이 2100, 3100, 4100, 5100 인 사원의 이름과 연봉 구하기
select first_name, last_name, salary
from employees
where salary in (2100, 3100, 4100, 5100);

--NULL
select first_name, salary, commission_pct, salary*commission_pct
from employees
where salary between 13000 and 15000;

--커미션 비율있는 사원의 이름과 연봉 커미션 비율을 출력하세요
select first_name, last_name, salary, commission_pct
from employees
where commission_pct is not null;

--커미션 비율이 있는 사원의 이름과 연봉 커미션 비율을 출력하세요
select first_name, last_name, salary*commission_pct
from employees
where commission_pct is not null;

--담당매니저가 없고 커미션 비율이 없는 직원의 이름을 출력하세요
select first_name, last_name
from employees
where commission_pct is null
and manager_id is null;

--order by 절
select *
from employees
order by salary asc, first_name asc;

--부서번호 오름차순, 부서번호 급여 이름 출력
select department_id, salary, first_name
from employees
order by department_id asc;

--급여가 10000 이상인 직원 이름 급여를 급여가 큰 직원부터 출력
select first_name, salary
from employees
where salary >= 10000
order by salary desc;

--부서번호 오름차순, 부서번호 급여 이름 출력
--부서번호가 같으면 급여 높은 사람부터
select department_id, salary, first_name
from employees
order by department_id asc, salary desc;