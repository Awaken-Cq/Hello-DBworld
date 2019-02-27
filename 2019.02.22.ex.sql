--1. 이름이 bruce인 사람의 사번, 부서번호, 급여를 뽑아라. (구성이 대문자인지 소문자인지는 모른다.)
select employee_id, first_name, department_id, salary
from employees
where lower(first_name) = 'bruce';

--2. 이름이 Steven인 사람이 근무하는 도시이름을 구해라
select first_name, department_id
from employees
where upper(first_name) = 'STEVEN'; 

select department_id, location_id
from departments
where department_id = 90;

select location_id, city
from locations
where location_id = 1700;

--3. 커미션을 받는 사람중 10000이 넘는 사람의 사번 이름 부서번호, 커미션을 포함한 급여를 찾아라
select employee_id, first_name, department_id, salary, commission_pct, salary *(1+nvl(commission_pct,0))
from employees
where commission_pct is not null
and salary >= 10000;


--4. 근무부서가 null인 사람의 사번 이름 부서번호를 찾아라
select first_name, department_id
from employees
where department_id is null;


--5. 근무 부서가 Oxford인 지역번호 찾기 (대소문자 섞어서 찾기) (별칭: 지역 번호)
select location_id "지역 번호"
from locations
where city = 'Oxford';


--6. 근무자의 직업 종류 출력하기 (중복없이) (별칭: 직업)
 select distinct job_id 직업
 from employees;

--***7. 직무별 최소급여와 최대 급여의 차이가 무엇의? 2배 미만으로 차이나는 직무아이디, 최소급여, 최대급여, 급여차이( 별칭 급여차이 )
select job_id, min_salary, max_salary, max_salary-min_salary 급여차이
from jobs
where (max_salary-min_salary) > (max_salary/2);

--8. 직무가 programmer인 사람의 풀네임(별칭 : 이름), 급여(별칭 : 급여) 
select *
from jobs;

select first_name || last_name 이름, salary 급여
from employees
where job_id = 'IT_PROG';

--9. 커미션을 받는 사원의 사번 , 이름, 급여를 급여별 내림차순 정리를 하라.
--pass

--10. 사번, 이름, 커미션을 포함한 급여를 내림차순 정리를 하라.(커미션을 포함한 급여의 별칭은 cms)
select employee_id, first_name, salary *(1+nvl(commission_pct,0)) cms
from employees
order by cms desc;

--**1. 오늘을 기준으로 근로자의 근속년수를 나타내고 25년이하의 사람중에 직업등급레벨이 D인사람을을 나타내시오. 
   --(사번, 이름, 고용일, 근속년수)
   --(단, 월일은 신경쓰지않는다.귀찮으니깐 ㅎ) 
select 
from
;
--2. last_name에 a가 들어가는 사람의 사번, 풀네임, 급여를 급여가 높은 순서대로 나타내어라.
   --이름의 컬럼은 employee_name로 표시한다.
   --(단, a는 대소문자 포함한다.)
   select employee_id, first_name || last_name "employee_name", salary
   from employees
   where upper(last_name) like '%A%'
   order by salary desc;

--3. 매니저 번호가 100 이상 200 미만이고, 미국에 위치하고 있는 부서의 부서번호, 부서명
select country_id, location_id
from locations;

select department_id, department_name
from departments
where manager_id >= 100
and manager_id < 200
and location_id in (1400, 1500, 1700);

--4. 우편번호에 9가 들어가는 지역에 위치한 부서에서 일하며, 급여가 7000 이상인 사원의 이름 (부서별 이름순으로 정렬)

select state_province, postal_code, location_id
from locations
where postal_code like '%9%';

select department_id, department_name, location_id
from departments
where location_id in (1400, 1500, 1700, 2500);

select first_name, job_id
from employees
where department_id in(60, 50, 10, 90, 110, 190, 80)
and salary >= 7000
order by job_id;

--5. 급여가 3000이상이고 50번이상 부서에 근무하며 이름에 r이 들어가는 사원들의 사번과 이름, 급여를 검색하라
select employee_id, first_name, salary
from employees
where salary >= 3000
and department_id >= 50
and first_name like '%r%';

--6. 직업아이디가 AD로 시작하는 것을 검색하고 최고급여부터 내림차순으로 급여를 정렬하라
select job_id, max_salary
from jobs
where job_id like 'AD%'
order by max_salary desc;

--7. 근무국가가 미국인 사원의 풀네임과 근무시작 날짜를 적어서 'OOO은 OOO부터 미국에서 일한다.' 로 출력하라. 
   --별칭은 노동자 from USA로 저장(공백포함)
select country_id, location_id
from locations
where country_id = 'US';

select location_id, department_id
from departments
where location_id in (1400, 1500, 1700);

select first_name || last_name || '은 ' || hire_date || '부터 미국에서 일한다.' "노동자 from USA"
from employees
where department_id in ( 60, 50, 10, 90, 110, 190);

--8. 성이나 이름에 h가 들어간 사원에 대한 정보를 모두 출력하되 급여와 고용일을 내림차순으로 정렬하여라.
select *
from employees
where first_name like '%h%'
or last_name like '%h%'
order by salary desc, hire_date desc;

--31. 관리자 ID가 124번이며, 급여가 2500 이상 3500 미만인 사원의 (이름, 급여, 관리자 ID)를 출력하세요.
-- 단, 급여가 높은 순으로 정렬
select first_name, salary, manager_id
from employees
where manager_id = 124 
and salary >= 2500 
and salary < 3500
order by salary desc;

--32. 관리자 ID가 100이고 이름의 2번째가 'o'인 사원의 (이름, 커미션, 커미션 적용 후 급여)를 출력하세요.  *커미션이 null인 경우 0으로 대체하여 계산 및 출력
-- 단, 커미션 적용 후 급여가 높은 순으로 정렬
select first_name, commission_pct, salary *(1+nvl(commission_pct,0)) pay 
from employees
where manager_id = 100
and first_name like '_o%'
order by pay desc;


--33. 관리자가 지정되지 않은 사원의 (이름)을 출력하세요. *이름 형식 : [성 이름]
select last_name || ' ' || first_name 
from employees
where manager_id is NULL;

--34. 최대 급여와 최소 임금의 차가 5000 이상인 직급의 (이름, 최대 급여, 최소 급여, 급여의 차이)을 출력하세요.
-- 단, 급여의 차이가 큰 순으로 정렬하세요.
select job_title, max_salary, min_salary, max_salary-min_salary difference
from jobs
order by difference desc, max_salary desc;

--35. 현재 시간, 3일 후, 3시간 후, 3분 후, 3초 후를 출력하세요 *각각에 별칭 지정(현재 시간, 3일 후 ~)
-- 단, 출력 형식은 '년도-월-일 시:분:초'

select to_char(sysdate, 'yyyy. mm. dd hh:mi:ss') "현재 시간",
to_char(sysdate +3, 'yyyy. mm. dd hh:mi:ss')  "3일 후",
to_char(sysdate + 3/24/60, 'yyyy. mm.dd hh:mi:ss') "3분 후",
to_char(sysdate + 3/24/60/60, 'yyyy. mm. dd hh:mi:ss') "3초 후"
from dual;

형섭형
--90년 이전에 고용된 사원들의 최대 급여, 부서이름  
select employee_id, job_id, hire_date
from employees
where to_char(hire_date, 'yyyy') <= 1989;

select job_id, max_salary
from jobs
where employee_id in (100, 101, 200);


--직책이 President 인 사원의 고용날짜, 이름 , 급여
의연형
-- 2.부서번호가 50이상, 성에 끝에서 두번째에 'o'가 들어간 사원의 전체 풀네임과 급여을 나타내시오. 
-- 별칭 : 이름 / 급여 평균 (띄어쓰기하시오)
-- 급여평균 오름차순으로 정렬 하시오.

select first_name || last_name 이름, salary "급여 평균"
from employees
where department_id >= 50
and last_name like '%o_'
order by salary;