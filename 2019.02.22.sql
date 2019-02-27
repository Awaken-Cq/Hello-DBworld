--where 조건절

--급여를 5000이상 받는 사원의 사번, 이름, 급여, 부서번호
select employee_id, first_name, salary, department_id
from employees
where salary >= 5000;

--사번이 100인 사번의 사번, 이름, 부서번호
select employee_id, first_name, department_id
from employees
where employee_id = 100;

--근무도시가 seatle인 지역의 지역번호, 우편번호, 도시
Select Location_Id, Postal_Code, City
From Locations
Where City = 'Seattle';

--급여를 5000이상 10000미만를 받는 사원의 사번, 이름, 급여, 부서번호
select employee_id,first_name,salary,department_id
from employees
where salary >= 5000 and salary < 12000;

--급여를 5000이상 12000이하를 받는 사원의 사번, 이름, 급여, 부서번호
select employee_id,first_name,salary,department_id
from employees
where salary >= 5000 and salary < 12000;

select employee_id,first_name,salary,department_id
from employees
where salary not between 5000 and  12000;

--부서번호가 50인 사원 중 급여를 10000이상 받는 사원의 사번, 이름, 급여, 부서번호
select employee_id, first_name, salary, department_id
from employees
where department_id = 50 
and salary >= 5000;

--커미션을 받는 사원의 사번, 이름, 급여, 커미션포함급여
select employee_id,first_name,salary, commission_pct, salary * (1+commission_pct)
from employees
where commission_pct is not null;

--근무부서가 50, 60, 80인 사원의 사번, 이름, 부서번호
select employee_id, first_name, department_id
from employees
where department_id = 50
or department_id = 60
or department_id = 80;

select employee_id, first_name, department_id
from employees
where department_id in (50, 60, 80);

--급여가 3000이상 이거나 8000이상이거나 5000이상인 사원의 사번, 이름, 급여
select employee_id, first_name, salary
from employees
where salary >= 3000
or salary >= 8000 
or salary >= 5000;

select employee_id, first_name, salary
from employees
where salary >= any(3000, 8000, 5000);

--급여가 3000이상이고 8000이상이고 5000이상인, 사원의 사번, 이름, 급여
select employee_id, first_name, salary
from employees
where salary >= 3000
and salary >= 8000
and salary >= 5000;

select employee_id, first_name, salary
from employees
where salary >= all(3000, 8000, 5000);



--현재 시간, 3일 후 , 3시간 후, 3
select sysdate, to_char(sysdate, 'yy.mm.dd hh24:mi:ss') "현재 시간",
to_char(sysdate + 3, 'yy.mm.dd hh24:mi:ss') "3일 후",
to_char(sysdate + 3 / 24, 'yy.mm.dd hh24:mi:ss') "3시간 후",
to_char(sysdate - 3, 'yy.mm.dd hh24:mi:ss') "3일 전"
from dual;

--이름이 steven인 사원의 사번, 이름
select employee_id, first_name
from employees
where first_name = 'Steven';

--이름이 'S'로 시작하는 사원의 사번, 이름
select employee_id, first_name
from employees
where first_name like 'S%';

select employee_id, first_name
from employees
where first_name like '%e%';

--이름이 'y'로 끝나는 사원의 사번, 이름
select employee_id, first_name
from employees
where first_name like '%y';

--이름 끝에서 두번째가 'e'인 사원의 사번과 이름
select employee_id, first_name
from employees
where first_name like '%e_';

--부서번호가 50이 아닌 사원의 사번, 이름, 부서번호
select employee_id, first_name, department_id
from employees
where department_id != 50;

select employee_id, first_name, department_id
from employees
where department_id^ = 50;

select employee_id, first_name, department_id
from employees
where department_id <> 50;

--모든 사원의 사번, 이름, 급여 오름차순
--단, 급여순 정렬
select employee_id, first_name, salary
from employees
order by salary asc;
--내림차순
select employee_id, first_name, salary
from employees
order by salary desc;


--부서번호, 사번, 이름, 급여
--부서별 급여순으로 정렬
select department_id "did", employee_id, first_name, salary sal
from employees
order by "did", sal desc;

--근무도시가 'Seattle'인 사원의 사번, 이름, 부서번호

select location_id
from locations;

select department_id
from departments;

select employee_id, first_name, department_id
from employees
where department_id in(10, 90, 110, 190);


--4년이상 근무하고 퇴사한 사원의 번호과 JOB_ID 출력하시오.
select employee_id, job_id, start_date, end_date, (end_date - start_date)/365
from job_history
where end_date - start_date >= (365*4);


--근무도시가 seatle인 지역의 지역번호, 우편번호, 도시
Select first_name
From employees
Where lower(first_name) like '%t%';

select *
from locations
where upper(city) = 'SEATTLE';

select to_char(sysdate, 'mm!dd!hh!hh24!mi!mi!ss')
from dual;
