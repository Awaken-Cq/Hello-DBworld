--3조.

--모든 사원들에게 설선물 세트를 배송하려한다.
--ansi join을 이용하여사원들의 지역에 따른 우편번호를 알아내시오.
--모든 사원들의 사번, 이름, 부서 이름, 우편번호

select e.employee_id, e.first_name, d.department_name, l.postal_code
from employees e left outer join departments d using(department_id)
 left outer join locations l using(location_id);
 
 
--위에서 사용한 것과 다른 종류의 ansi join을 이용하여
--모든 사원들의 사번, 이름, 부서 이름, 우편번호
--부서가 따로 없는 경우 '대기발령중', 우편번호가 없을경우 '자택수령' 으로 표시한다.
select e.employee_id, e.first_name,nvl(d.department_name,'대기발령중'), nvl(l.postal_code,'자택수령')
from employees e left outer join departments d
on e.department_id = d.department_id
left outer join locations l on d.location_id = l.location_id;

--inner join 사용할것, 매니저아이디가 100번인 사원의 사번, 이름, 부서이름
select  e.employee_id, e.first_name, d.department_name, e.manager_id
from employees e join departments d
using (department_id)
where e.manager_id = 100;

--inner join 사용할것, Washington 주에 위치한 부서의 부서번호와 부서이름
select d.department_id , d.department_name
from departments d join locations l
using(location_id)
where lower(l.state_province) = 'washington';

--ANSI 조인을 사용하여 'accounting' 부서 소속 사원의 이름과 입사일을 출력하세요.
--단, 입사일은 년도만 표기 하시오.    
select e.first_name, e.hire_date
from employees e join departments d
using (department_id)
where lower(d.department_name) = 'accounting';




--모든 부서에 근무하는 사원의 이름, 직책이름, 부서이름
-- 단, 부서가 미지정인 경우, 부서이름은 '미지정'으로 출력
-- 결과 : 20행
select e.employee_id, e.job_id, nvl(d.department_name,'미지정')
from employees e left outer join departments d
using(department_id);

--모든 사원의 사번, 이름, 경력 중 당시직책이름
-- 단, 경력이 없는 사원의 경우, 당시직책이름은 '경력 없음'으로 출력
-- 결과 : 23행





--모든 직원의 이름, 연봉, 직책이름, 연봉 수준
--단, 연봉이 높은 순으로 정렬하라


-- 이직 경험이 있는 사원의 이름(현재 없으면 '현재퇴사') "인사이동", 당시직업이름 "직업" (이름순정렬)