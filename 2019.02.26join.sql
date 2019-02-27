--사번, 이름, 부서번호, 직원유형
--부서번호 60 개발자
--              90 임원진
--     나머지 비개발자

select employee_id, first_name, department_id,
    case when department_id = 60
            then '개발자'
            when department_id = 90
            then '임원진'
            else '비개발자'
        end 직원유형
from employees;

select *
from departments;

select employee_id, first_name, department_id,
        decode(department_id,
                        60, '개발자',
                        90, '임원진',
                        '비개발자') "직원유형"
from employees;

----그룹함수
--회사의 총사원수, 급여총합, 급여평균, 최고급여, 최저급여
select count(employee_id), sum(salary), avg(salary), max(salary), min(salary)
from employees;

--사번, 이름, 부서번호, 부서이름
select employee_id, first_name, department_id, department_name
from employees;

---cartesian join(cross join)
select *
from employees, departments
order by employee_id;

--equi join
select employees.employee_id, employees.first_name, departments.department_id, departments.department_name
from employees, departments
where employees.department_id = departments.department_id
order by employee_id;

select e.employee_id, e.first_name, d.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id
order by employee_id;


-- 'seattle'에 근무하는 사원의 사번, 이름, 부서이름, 도시이름

select e.employee_id, e.first_name, d.department_name, l.city
from employees e, departments d, locations l
where e.department_id = d.department_id and d.location_id = l.location_id and lower(city) = lower('seattle');

-- 'asia'에 근무하는 사원 이름 부서이름 도시이름
select employee_id, first_name, e.department_id, city
from employees e, departments d, locations l, countries c,regions r
where e.department_id = d.department_id 
and d.location_id = l.location_id
and l.country_id = c.country_id
and c.region_id = r.region_id
and lower(region_name) = lower('europe');


-- 10, 80, 90번 부서에 근무중인 사원의
-- 사번, 이름, 직책이름, 부서이름
select e.employee_id, e.first_name, e.job_id, d.department_name
from employees e, departments d, jobs j
where e.job_id = j.job_id 
and e.department_id = d.department_id
and e.department_id in(10, 80, 90);

--사번이 200인 사원의 근무 이력
--사번, 이름, 근무 당시 직책이름, 근무 당시 부서이름, 근무 개월수(소수점 둘째자리까지 표현)
select e.employee_id, e.first_name, d.department_name, js.job_title,
to_char(months_between(jh.end_date,jh.start_date),'99.99') "근무개월"
from employees e, job_history jh, departments d, jobs js
where e.employee_id = jh.employee_id
and d.department_id = jh.department_id
and jh.job_id = js.job_id
and jh.employee_id = 200;

select *
from job_history;

select (sysdate-to_date(20170226,'yyyy.mm.dd'))
from dual;

--모든 사원의 부서이름, 사번, 이름, 매니저사번,매니저이름
--힌트 self join
select d.department_name, e.employee_id, e.first_name, em.employee_id, em.first_name
from employees e, departments d, employees em
where e.department_id = d.department_id
and e.manager_id = em.employee_id;

select d.department_name, e.employee_id, e.first_name,e.manager_id,m.employee_id, m.first_name
from employees e, employees m, departments d
where m.employee_id =e.manager_id
and e.department_id = d.department_id;

select *
from employees;

select employee_id
from employees;
--decode를 이용하여 미국에서 일하는 사람은 미국, 영국에서 일하는 사람은 영국, 캐나다에서 일하는 사람은 캐나다라고 출력하시오
--사원의 사번, 이름, 부서이름, 근무국가

select  e.employee_id, e.first_name, department_name,
    decode(lower(l.country_id),'us','미국','uk','영국','캐나다') "근무국가" 
from employees e, departments d, locations l
where e.department_id = d.department_id and d.location_id = l.location_id;

--마케팅 부서 사원 중 가장 높은 연봉액과 가장 낮은 연봉액을 구하시오.
--테이블이름 : 부서이름, 최고연봉, 최저연봉
select max(salary) 최고연봉, min(salary) 최저연봉
from employees
where department_id = 20;




--직책 아이디가 'SA_REP'인 사원의
--사번, 이름 직책이름, 부서이름
--단, 부서가 없는 경우 '대기발령'으로 출력
select e.employee_id, e.first_name, e.job_id, 
    case when e.department_id = 0
        then d.department_name 
        else d.department_name  '대기발령'
        end "부서이름"
from employees e, departments d, jobs j
where nvl(e.department_id,0) = nvl(d.department_id,0)
and e.job_id = j.job_id
and lower(e.job_id) = lower('SA_REP');

select *
from departments;