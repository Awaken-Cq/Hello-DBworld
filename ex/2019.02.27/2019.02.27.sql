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






