--11
select  job_title, (min_salary + max_salary) / 2 "평균급여"
from jobs;

--12 
select email || ' / ' || phone_number "회신"
from employees;

--13

select *
from ;

--14 
select employee_id ,first_name, last_name, salary, nvl(commission_pct,0)
from employees;

--15
select first_name || last_name || '의 전화번호는 ' || phone_number || '입니다.'
from employees;

--16
select job_title || '의 평균 입금은 ' || (min_salary + max_salary) /2 || '입니다.' "직무별 평균 급여"
from jobs;

--17
select '프로젝트 진행 기간은 ' || start_date || ' ~ ' || end_date || '입니다.'
from job_history;

--18
select department_name || '의 관리자 번호는 ' || manager_id || '입니다.'
from departments;

--19
select '부서번호가 ' || department_id || '인 부서의 이름은 ' || department_name || '입니다.'
from departments;

--20
select '사원 번호 ' || employee_id || '는 ' || start_date || '날부터 프로젝트를 시작했습니다.'
from job_history;


--21
select employee_id "새로운 오늘의 날짜", nvl(department_id,80) "department_id"
from employees;

--22
--서치하고 답 도출 ? 174 Ellen Abel

--23
select job_title, min_salary, max_salary, (min_salary+max_salary)/2 " 평균 급여"
from jobs;

--24
select street_address || ', ' || city || ', ' || country_id "주소"
from locations;

--25
select '부서번호가 ' || department_id || '인 사원의 커미션포함급여는 ' || salary * (1+nvl(commission_pct,0)) || '이다.'
from employees;

--26
select first_name || ' ' || last_name || '의 폰번호는  ' || phone_number || '이고 이메일은' || email || '이다.'
from employees;

--27
select job_title || '가 받을 수 있는 최저 금액은 ' || min_salary || '원이며, 최고금액은 ' || max_salary || '원입니다. 그리고 그 금액의 차이는 ' || (max_salary-min_salary) || '원 입니다.'
from jobs;

--28 pass

--29 pass

--30 pass

--31 예제 "와싱턴 시애틀에 위치한 지사의 우편번호는 98199이다." (post code)
select state_province || ' ' || city || '에 위치한 지사의 우편번호는 ' || postal_code || '이다.' "post code"
from locations;

--32 이름(풀네임)의 급여는 10% 인상되어 ??이다.(급여인상)
select first_name || ' ' || last_name || '의 급여는 10% 인상되어 ' || salary * 1.1 || '이다.' "급여인상"
from employees;
--33  **(이름)의 메일주소는**이고 핸드폰번호는**이다.  다음과 같이 출력하기 column이름은 연락처
select first_name || ' ' || last_name || '의 메일주소는 ' || email || '이고 핸드폰번호는 ' || phone_number || '이다.'
from employees;
--34 **(국가) **(지역)주 **(도시)시 **(주소)의 우편번호는 **이다. 다음과 같이 출력하기 column이름은 우편번호
select country_id || ' ' || state_province || ' ' || city || ' ' || street_address || '의 우편번호는 ' || postal_code || '이다.'
from locations;
--35  ** 사원님의 급여는 ** 입니다.  별칭 = 급여 내역
select first_name || ' ' || last_name || '사원님의 급여는 ' || salary || '입니다.' "급여 내역"
from employees;
--36 사원번호가 ??인 사람의 직책은 ??이며 입사일은 ??, 퇴사일은 ??입니다. 별칭 = 입퇴사자 정보
select '사원번호가 ' || employee_id || '인 사람의 직책은 ' || job_id || '이며 입사일은 ' || start_date || ', 퇴사일은 ' || end_date || '입니다.' "입퇴사자 정보"
from job_history;
--37 "000 사원 - 이메일 : 000@gamil.com / 전화번호 : ***.***.****" 형식으로 출력하세요 (이름은 '이름 성' 형식)
select first_name || ' ' || last_name || '사원 - 이메일 : ' || email || ' / 전화번호 : ' || phone_number
from employees;
--38  "도로 주소, 도시명, 주이름, 국가ID" 형식으로 출력하세요 (Column명은 '주소')
select street_address || ', ' || city || ', ' || state_province || ', ' || country_id "주소"
from locations;

--41
select first_name || last_name, hire_date, nvl(manager_id,-1)
from employees;

--42 pass

--43~52 pass




select *
from job_history;