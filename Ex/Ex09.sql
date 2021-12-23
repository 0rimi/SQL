--읽는 순서 유의
--프롬 > 로우부여 > 웨얼 > 셀렉트 > 오덜바이 순서로 읽음
select  rn,
        first_name,
        salary
from (select rownum rn,   --웨어를 실행시키기전 로우를 부여하는 테이블
             first_name,
             salary
      from (select first_name,
                   salary
            from employees
            order by salary desc) --제일 마지막인 정렬 먼저 해결하는 테이블
      )
where rn >= 11 and rn <= 20; --최종실행하려는 조건


--rownum 예제
select rn, first_name, salary, hire_date
from (select rownum rn,
             first_name,
             salary,
             hire_date
      from (select first_name,
                   salary,
                   hire_date
            from employees
            where hire_date between '07/01/01' and '07/12/31' 
            order by salary desc)
     )
where rn between 3 and 7;

--예제2
select rn, first_name, salary, hire_date, department_name
from (select rownum rn,
             first_name,
             salary,
             hire_date,
             department_name
      from (select em.first_name, em.salary, em.hire_date, de.department_name
            from employees em, departments de
            where em.department_id = de.department_id(+)
            and hire_date between '07/01/01' and '07/12/31' 
            order by salary desc)
     )
where rn between 3 and 7;



