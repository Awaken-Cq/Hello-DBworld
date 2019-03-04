union 합집합(중복되는 값은 제거)
union all 합집합(중복되는 값도 포함)

---

select *
from employees;

--부서번호가 50이거나 90인 사원과
--급여가 5000 이상인 사원의 사번, 이름, 부서번호
--사번, 이름, 급여, 부서번호
select employee_id, first_name, salary, department_id
from employees
where department_id in (50, 90)
union
select employee_id, first_name, salary, department_id
from employees
where salary >= 10000;

select employee_id, first_name, salary, department_id
from employees
where department_id in (50, 90)
union all
select employee_id, first_name, salary, department_id
from employees
where salary >= 10000;

select employee_id, first_name, salary, department_id
from employees
where department_id in (50, 90)
intersect
select employee_id, first_name, salary, department_id
from employees
where salary >= 10000;

select employee_id, first_name, salary, department_id
from employees
where department_id in (50, 90)
minus
select employee_id, first_name, salary, department_id
from employees
where salary >= 10000;


select employee_id, first_name, salary, department_id
from employees
where salary >= 10000
minus
select employee_id, first_name, salary, department_id
from employees
where department_id in (50, 90);


--group by
--부서별 총합, 평균급여, 사원수, 최대급여, 최소급여

select department_id, sum(salary), avg(salary), count(employee_id), max(salary), min(salary)
from employees
group by department_id;

--부서별 총합, 평균급여, 사원수, 최대급여, 최소급여
--평균 급여가 5000이하인 부서
select department_id, sum(salary), avg(salary) , count(employee_id), max(salary), min(salary)
from employees
group by department_id
having avg(salary) <= 5000;

select department_id, employee_id, sum(salary), avg(salary), count(employee_id), max(salary), min(salary)
from employees
group by department_id;

--각 부서별의 평균 급여보다 많이 받는 사원의
--사번, 이름, 급여
select employee_id, first_name, salary
from employees
where salary > all(select avg(salary)
                         from employees
                         group by department_id);

--부서별 최고급여를 받는 사원의
--부서이름, 사번, 이름, 급여
--부서별로 나누고 그 부서중 최고 급여를 받는 사원을 구하라.
select d.department_name, e.employee_id, e.first_name, e.salary 
from employees e, departments d
where e.department_id = d.department_id and 
salary in (select max(salary)
            from employees
            group by department_id);


select d.department_name, e.employee_id, e.salary
from employees e, (select department_id, max(salary) msal
                            from employees
                            group by department_id) m,
                        departments d
where e.department_id = m.department_id and e.salary = m.msal
and e.department_id = d.department_id;

select rownum, employee_id, salary
from employees
where rownum <= 10
order by rownum desc;

-- TOP N Query
--사번, 이름, 급여, 입사년대, 부서이름
--급여순 순위
-- 한 페이지당 5명씩 출력.
--2pages 출력. (&page)
--1980년대, 1990년대, 2000년대.
select e.employee_id, e.first_name, e.salary,
        case when to_char(hire_date,'yyyy') like '198%'
                then '1980년대'
                when to_char(hire_date,'yyyy') like '199%'
                then '1990년대'
                else '2000년대'
                end 입사년대
                , d.department_name
from employees e, departments d
where e.department_id = d.department_id(+) and 
rownum between  and (&page*5) p
order by salary desc;

--해답!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
select rownum,employee_id, first_name, salary
from employees
order by salary desc;   --  오더바이가 셀렉트보다 나중에 실행되기때문에 급여정렬을 하면 rownum이 뒤죽박죽이됨.

--선 테이블 만든다.
--로우를 붙여서 테이블을 만든다. 조건 <= 10
--그후 로우가 아니게 된것에 >5 조건을 붙임

--rownum은 공동순위를 표현할 수 없다.

select rownum, a.*
from (select employee_id, first_name, salary
from employees
order by salary desc) a;


select rownum, a.*
from (select employee_id, first_name, salary
from employees
order by salary desc) a
where rownum <= 10;

select b.m ranking, b.employee_id, b.first_name, b.salary,
                case when to_char(hire_date,'yyyy') like '198%'
                                then '1980년대'
                                when to_char(hire_date,'yyyy') like '199%'
                                then '1990년대'
                                else '2000년대'
                                end 입사년대
                                , d.department_name
from (select rownum m, a.*
         from (select employee_id, first_name, hire_date, salary, department_id
                    from employees
                    order by salary desc) a
where rownum <= &page *5 ) b, departments d
where b.department_id = d.department_id(+) 
and b.m > &page * 5 - 5
order by ranking;

--rank() over()

--rownum을 일반 컬럼으로 바꾸다?
--select 실행 순서를 바꾸기위해 정렬을 하고 순위를 매겨라;
