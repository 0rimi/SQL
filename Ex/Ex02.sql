--initcap 첫글자만 ! 대문자
select email, initcap(email)
from employees
where department_id = 100;

--lower, upper 모든값을 소문자, 대문자
select first_name, lower(first_name), upper(first_name) u_firstname
from employees
where department_id = 100;

--substr(컬럼명, 시작위치, 글자수) : n부터 n까지 출력
select first_name, substr(first_name, 1, 3), substr(first_name, -3,2)
from employees
where department_id  = 100;

--lpad, rpad(컬럼명, 자리수, '채울문자') : 자릿수 맞춰주고 빈칸은 문자로
select first_name,
       lpad(first_name, 10, '*'),
       rpad(first_name, 10, '*')
from employees;

--replace(컬령명, 문자1, 문자2) : 문자1을 문자2로 바꿔줌
select first_name,
       replace(first_name, 'a', '*'),
       replace(first_name, substr(first_name,2,3), '***')
from employees;

--숫자 ROUND (숫자, 출력을 원하는 자리수) : 반올림
select 123.456 ori,
       round(123.456, 0) r0,
       round(123.456, 2) r2,
       round(123.456, -1) "r-1"
from dual/*가상의 테이블*/;

--TRUNC(숫자, 출력을 원하는 자리수) : 내림
select trunc(123.456, 2) r2,
       trunc(123.456, 0) r0,
       trunc(123.456, -1) "r-1"
from dual;

--날짜함수
--sysdate()
select sysdate
from dual;

--month_between
select trunc(MONTHS_BETWEEN(SYSDATE,hire_date),0) || '일' "입사일차",
       first_name
from employees
where department_id = 100;

--변환함수
--To_char(n,fmt) 숫자 -> 문자형
SELECT first_name,
       salary,
       to_char(salary*12, '$999,999') "연봉",
       to_char(salary*12, '0999999') "연봉",
       to_char(salary*12, '999999.9999') "연봉"
FROM employees
WHERE department_id = 100;

--날짜 > 문자형으로 변환
select sysdate,
       to_char(sysdate, 'YYYY'),
       to_char(sysdate, 'YY'),
       to_char(sysdate, 'YYMMDD'),
       to_char(sysdate, 'MON'),
       to_char(sysdate, 'YYYY-mm-dd hh24:mi:ss')
from dual;

select hire_date,
       to_char(hire_date, 'yy'),
       to_char(hire_date, 'YYYY"년"mm"월"dd"일" day hh24:mi:ss')
from employees
where department_id = 100;

--일반함수 NVL(컬럼명, null일때값), NVL2
SELECT first_name, commission_pct, nvl(commission_pct, 00),
       nvl2(commission_pct, 100/*null아닌애*/, 0)
from employees;