1조
1. 모든사원의 사번, 직책,  급여, 최고급여, 최저급여를 구하시오 

select e.employee_id, j.job_title, e.salary, j.max_salary, j.min_salary
from employees e, jobs j
where j.job_id = e.job_id;

2. US에 거주하는 사원의 사번 직책을 뽑으시오

select e.employee_id, j.job_title
from employees e, jobs j, departments d, locations l
where e.job_id = j.job_id and e.department_id = d.department_id and d.location_id = l.location_id and lower(country_id) = 'us';

3. 모든 사원의 부서이름, 사번, 이름, 매니저사번, 매니저이름 (case 문 사용)

select d.department_name, e.employee_id, e.first_name,  e.manager_id,
    case when e.manager_id = m.employee_id
        then m.first_name
        end "매니저이름"
from departments d, employees e, employees m
where e.department_id = d.department_id and e.manager_id = m.employee_id;

4. 모든 직원의 사번, 이름, 부서이름, 직책이름, 부서장 (본인이 부서장일 경우 null 표시는 무시)
select e.employee_id, e.first_name, d.department_name, j.job_title,
     case when d.manager_id = e.manager_id
            then m.first_name
            else e.First_name
            end "부서장"
from employees e, departments d, jobs j, employees m
where e.department_id = d.department_id and e.job_id = j.job_id and e.manager_id =m.employee_id;

5. 사번, 이름, 부서번호, 부서이름, 분류를 뽑아라.
--분류(decode이용)
--부서번호가 110이면 경영
--          60이면 개발
--          50이면 운송
--          그외 기타
select e.employee_id, e.first_name, e.department_id, d.department_name,
decode(e.department_id,110,'경영',60,'개발', 50, '운송','기타')
from employees e, departments d
where e.department_id = d.department_id;

6. 직업 번호, 직업이름, 사번, 이름, 급여, 최대급여, 최소급여를 구해라
--pass
select
from 
where;

9.-- 문제
-- Marketing 부서, Shipping 에서 일하는 사원의 
--  부서 이름, 사원 아이디, 사원이름,을 출력하세요.

select d.department_name, e.employee_id, e.first_name
from employees e, departments d
where e.department_id = d.department_id and lower(d.department_name) in('marketing', 'shipping');

10. --'southlake'에 근무하고 있는 사원 이름, 부서이름, 포스탈코드
select e.first_name, d.department_name, l.postal_code
from employees e, departments d, locations l
where e.department_id = d.department_id and d.location_id = l.location_id and lower(city) = 'southlake';

11.--'EUROPE' 에 근무하고 있는 사원이름, 부서이름,도시이름
select e.first_name, d.department_name, l.city
from employees e, departments d, locations l, countries c, regions r
where e.department_id = d.department_id 
and d.location_id = l.location_id 
and l.country_id = c.country_id 
and c.region_id = r.region_id
and upper(r.region_name) = 'EUROPE';

4조
1. 사원들의 grade_level 를 구하시오.
   사번, 이름, 급여, grade_level (정렬은 사번)
   select e.employee_id, e.first_name, e.salary, jg.grade_level
   from employees e, job_grades jg
   where e.salary between jg.lowest_sal and jg.highest_sal;


2. 직책이 변경된 적이 있는 사람들(job_historys 에 이력이 있는 사람)의 
   사번, 이름, 이전직책코드, 이전직책명, 현재직책코드, 현재직책명을 표시
   (정렬기준은 사번)
select jh.employee_id, e.first_name, jh_job_id, j_job_title, e.job_id, j_job_title
from employees e, job_history jh, jobs j
where e.employee_id = jh.employee_id, j.job_id = jh.job_id;