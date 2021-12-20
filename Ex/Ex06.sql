select em.first_name,
        de.department_name,
        em.department_id,
        em.salary
from employees em left outer join departments de
on em.department_id = de.department_id;

select em.first_name,
        de.department_name,
        em.department_id,
        em.salary
from employees em, departments de
WHERE em.department_id = de.department_id(+);

--full outer join
select em.first_name,
        de.department_name,
        em.department_id,
        em.salary
from employees em full outer join departments de
on em.department_id = de.department_id;

--이거 에러남 ㅎㅎ
select em.first_name,
        de.department_name,
        em.department_id,
        em.salary
from employees em, departments de
where em.department_id(+) = de.department_id(+);

--self join
select em.employee_id,
        em.first_name,
        em.salary,
        em.phone_number,
        ma.employee_id "manager id",
        ma.first_name "manager name",
        ma.phone_number "manager hp"
from employees em, employees ma
where em.manager_id = ma.employee_id;
