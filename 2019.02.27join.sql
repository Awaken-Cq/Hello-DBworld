--모든 사원의 사번, 이름, 급여, 급여등급
select e.employee_id, e.first_name, e.salary, jg.grade_level
from employees e, job_grades jg
where e.salary between jg.lowest_sal and jg.highest_sal;

--모든 사원의 사번, 이름, 부서번호, 부서이름
select e.employee_id, e.first_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id; 

--e department_id 는 참조키 그렇기 때문에 null이 있을 수 있지만 d.department 에 있는 값만 가져올 수 있다.
--d.department_id 는 고유키 그렇기 때문에 null이 있을 수 없음.

--outter join
--모든 사원의 사번, 이름, 부서번호, 부서이름
--단, 부서가 미지정일 경우 부서이름을 '대기발령중'
select e.employee_id, e.first_name, e.department_id, nvl(d.department_name,'대기발령중')
from employees e, departments d
where e.department_id = d.department_id(+);

--모든 사원의 사번, 이름, 상관사번, 상관이름.
--단, 상관이 없을 경우 상관이름에 '사장' 으로 출력.
select e.employee_id, e.first_name, em.employee_id, nvl(em.first_name,'사장')
from employees e, employees em
where e.manager_id = em.employee_id(+);

--모든 사원의 사번, 이름, 상관사번, 상관이름, 부서이름
--단, 상관이 없을 경우 상관이름에 '사장' 으로 출력.
--단, 부서가 미지정일 경우 부서이름을 '대기발령중'으로 출력
select e.employee_id, e.first_name, em.employee_id, nvl(em.first_name,'사장'),nvl(d.department_name,'대기발령중')
from employees e, departments d, employees em
where e.manager_id = em.employee_id(+) and e.department_id = d.department_id(+);

select *
from employees;


---------------------------------------------------------------------------------------------------------
--ansi join(표준) 모든 데이터베이스에서 쓸수 있다.
equi, non-equi, self, outer join 등은 오라클에서만 쓸 수 있다.

--카타시안 프로덕트 = cross join
select * from employees cross join departments;
= select * from employees, departments;

--사번, 이름, 부서이름 
select e.employee_id, e.first_name, d.department_name
from employees e, departments d
where e.department_id = d.department_id;
--inner join
--50번 부서의 사번, 이름, 부서이름 join on
select e.employee_id, e.first_name, d.department_name
from employees e inner join departments d
on e.department_id = d.department_id
where e.department_id = 50;
--50번 부서의 사번, 이름, 부서이름 join using
select e.employee_id, e.first_name, d.department_name
from employees e  join departments d
using (department_id)
where department_id = 50;

select e.employee_id, e.first_name, d.department_name
from employees e natural join departments d
where department_id = 50;

-- 'Seattle' 에 근무하는 사번, 이름, 부서이름, 도시
select e.employee_id, e.first_name, d.department_name, l.city
from employees e, departments d, locations l
where e.department_id = d.department_id
and d.location_id = l.location_id
and city = 'Seattle';

select e.employee_id, e.first_name, d.department_name, l.city
from employees e join departments d on e.department_id = d.department_id
                          join locations l on d.location_id = l.location_id
where city = 'Seattle';

---outer join
--모든 사원의 사번, 이름, 부서번호, 부서이름('대기발령중')
select e.employee_id, e.first_name, e.department_id, nvl(d.department_name,'대기발령중')
from employees e, departments d
where e.department_id = d.department_id(+);

--모든 부서에 근무하는, 사원의 사번, 이름(사원없음), 부서번호. 부서이름
select e.employee_id, nvl(e.first_name,'사원없음'), d.department_id, d.department_name
from employees e, departments d
where e.department_id(+) = d.department_id;

--outer -> ansi (기준 테이블이 어떤 것인지 명시, 조건에 만족하지않는 테이블이 있는 쪽이 어느 테이블인가?)
--모든 사원의 사번, 이름, 부서번호, 부서이름('대기발령중')
select e.employee_id, e.first_name, e.department_id, nvl(d.department_name,'대기발령중')
from employees e left outer join departments d
on e.department_id = d.department_id;

--모든 부서에 근무하는, 사원의 사번, 이름(사원없음), 부서번호. 부서이름
select e.employee_id, nvl(e.first_name,'사원없음'), d.department_id, d.department_name
from employees e right outer join departments d
on e.department_id = d.department_id;

--모든 부서와 사원의 사번, 이름(이름없음), 부서번호, 부서이름('대기발령중')
select e.employee_id, nvl(e.first_name,'사원없음'), d.department_id, nvl(d.department_name,'대기발령중')
from employees e full outer join departments d
on e.department_id = d.department_id;
