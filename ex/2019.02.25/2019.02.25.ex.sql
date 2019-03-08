--ex)))))))))))))))))))))))))))))))))))))
--아래와 같이 출력되게 코드를 작성하시오.
--'풀네임'의 부서번호와 부서코드는 '90''AD'이다. 
--부서를 명시할때는 job_id의 앞 두글자(ex)sST,IT,AD)로 명시. 별칭 부서번호와 코드

select concat(first_name,last_name) || '의 부서넘버와 부서코드는 ' || department_id || substr(job_id,1,2) "부서번호와 코드"
from employees;


--사번,이름, job_id, 근무상황(별칭)
--미국에서 일하는 부서일 경우 "본사근무"
--캐나다에서 일하는 부서일 경우 "파견근무" 20
--영국에서 일하는 부서일 경우 "해외출장"80
--본사, 파견, 해외 순으로 정렬
select employee_id, first_name, job_id,
    case when department_id = 20
            then '파견근무'
            when department_id = 80
            then '해외출장'
            else '본사근무'
        end "근무상황"
from employees
order by "근무상황" asc;


-- 김의연


-- 부서명(department_name)의 마지막 글자를 제외하고 출력하라.
-- 부서명, 마지막글자를 제외한 부서명 출력 및 정렬
select department_name, substr(department_name, 1, length(department_name)-1)
from departments
order by department_name asc;

-- emp테이블에서 sal이 3000미만 이면 c등급, 3000에서 3900이하 B등급
-- 4000 이상이면 A등급으로 등급을 나타내어라
-- 사번, 이름(풀네임), 급여, 등급별로 정렬
select employee_id, concat(first_name,last_name), salary,
 case when salary < 3000
            then 'C등급'
            when salary <= 3900
            then 'B등급'
            when salary >= 4000
            then 'A등급'
            else null
        end "등급"
from employees
order by "등급" asc;



--박광규


--사원들의 '이름 성'(concat함수 사용), 연봉, 연봉*커미션 값
--(단, 커미션이 있을 경우 일괄적으로 5%적용, 없을 경우 0으로 일괄 적용할 것)
select concat(last_name, first_name), salary, nvl(commission_pct,0),
    case when commission_pct is not null
            then salary*1.05
            else salary
        end "연봉*커미션 값"
from employees;

--Q2. 사원들의 전화번호에 '.'과 '.'사이에 있는 4자리 수를 출력하라.
select substr(phone_number, instr(phone_number,'.',1)+1,instr(phone_number,'.',1,2)-instr(phone_number,'.')-1)
from employees;

select *
from employees;

-- 신지영
--  Q1. 각 사원의 이름, 부서번호, 급여, 급여별 레벨을 출력하기
-- 단, 레벨의 종류와 기준은 Job_Grades 테이블을 참고한다.
-- 단, 레벨을 기준으로 오름차순 정렬한다.
-- 단, 레벨에 별칭을 준다(급여별 레벨).

select first_name, department_id, salary,
    case when salary between 25000 and 40000
            then 'F'
            when salary between 15000 and 24999
            then 'E'
            when salary between 10000 and 14999
            then 'D'
            when salary between 6000 and 9999
            then 'C'
            when salary between 3000 and 5999
            then 'B'
            else 'A'
        end "급여별 레벨"
from employees
order by "급여별 레벨" asc, salary desc;





--  Q2. 강의 A가 2019년02월20일부터 2019년07월16일까지 실행될 때, 총 기간이 며칠인지 구하시오
-- 단, 날짜는 20190220, 20190716 형태의 숫자로부터 시작한다.
-- 단, 주말도 포함한다
-- 단, 별칭은 수강기간

select to_char(trunc(to_date(to_char(20190716,'00000000'),'yyyy.mm.dd'),'hh'),'ddd')
       - to_char(trunc(to_date(to_char(20190220, '00000000'),'yyyy.mm.dd'),'hh'),'ddd') +1 "수강기간"
from dual;



--이종영 


1. 
--직책이름, 최대급여, 직무별 소득분류를 출력하시오.-
--이때 최대급여가 10000이하인 직무는 저소득, 10000은 초과하지만20000이하인 직무는 중간소득, 20000을 초과하는 직무는 고소득으로 정하여 직책분류를 만들고, 직책이름을 기준으로 정렬하시오. 이때, 직책이름은 모두 대문자로 표기하시오.

select upper(job_title), max_salary,
    case when max_salary <= 10000
            then '저소득'
            when max_salary <= 20000
            then '중간소득'
            else '고소득'
        end "직무별 소득분류"
from jobs
order by Job_title asc;


2. 
--오늘날짜를 yymmdd형식으로 문자로 바꾼후 숫자로 다시바꿔 123456을 더한값을 출력하라.

select to_number(to_char(sysdate,'yymmdd'),'999999')+123456
from dual;

--김형섭
1.
--시스템시간기준 144일후를 yyyy mm dd day 형태로 나타내주세요. 별칭은 "수료일"
select to_char(sysdate+144,'yyyy mm dd day') "수료일"
from dual;
2.
--2019/07/21 은 2019년도로부터 몇 번째 날일까?
select to_char(to_date('2019.07.21', 'yy.mm.dd'),'ddd')
from dual;

--1조
--1. 매니저 번호가 130미만은 초보  130이상 150이하는 중급 그외는 고급이다. 사번 이름 매니저번호를 오름차순으로 정리하라.
select employee_id, first_name, manager_id,
    case when manager_id < 130
        then '초보'
        when manager_id between 130 and 150
        then '중급'
        else '고급'
    end "매니저등급"
from employees;



--2. 48,456,231.20451 + 30000을 변환함수를 이용하여 푸시오

select to_number('48,456,231.20451','99,999,999.99999') +30000
from dual;

--3. 명예퇴직자
-- 시스템 현재날짜 기준 근속년 30이상 명예퇴직, 그외 보류
-- 사번, 이름, 전화번호, 부서
-- 명예퇴직자 기준 정렬
select employee_id, first_name, phone_number, department_id,
    case when to_char(sysdate,'yyyy') - to_char(hire_date,'yyyy') >= 30
    then '명예퇴직'
    else '보류'
    end 명예퇴직자
from employees;



-- 문제 2 ) 커미션포함급여가 4000 미만 상여금 10%
-- 커미션포함급여가 10000 미만 상여금 7%
-- 커미션포함급여가 20000 미만 상여금 5%
-- 커미션포함급여가 20000 이상 상여금 2%
-- 사번, 이름, 전화번호, 부서, 커미션포함급여(별칭 : 급여), 상여금포함급여(별칭 : 상여금)




-- 오늘을 기준으로 근무년수를 구해라 
--"(사원이름)의 근무년수는 (00)년 입니다."의 형식으로 출력하라 
--concat함수 이용



--6. 근무지발령   
--job_id가 IT로 시작하면 '판교점발령'
--         S           '강남점발령'
-- 그 외                '홍대점발령'

--사원번호, 이름, job_id 근무지발령을 출력하라


--'hello oracle !!!'을  hello HELLO ,oracle ORACLE 로 분리시켜라.
SELECT 'hello oracle !!!'
            ,SUBSTR('hello oracle !!!',1,INSTR('hello oracle !!!', ' ')-1)"HELLO"
            ,SUBSTR('hello oracle !!!',INSTR('hello oracle !!!', ' ')+1)"ORACLE"
FROM DUAL;

--사번이 140미만은 바보
--사번이 180미만은 멍청이
--사번이 180이상은 똥개
--사번, 이름, 연봉, 똥멍청이로 출력


--임금을 3자리(1000의자리) 에서 반올림하여 표현하시오
select round(salary,-3)
from employees;
4, 8
------------------------------사원 전화 번호의 .을 -으로 바꿔 표시하시오.
select case when length(phone_number) < 16
then
substr(phone_number,1,instr(phone_number,'.')-1) || '-' || 
substr(phone_number,instr(phone_number,'.')+1,instr(phone_number,'.',1,2)-(instr(phone_number,'.')+1)) || '-' ||
substr(phone_number,instr(phone_number,'.',1,2)+1) 

else
substr(phone_number,1,instr(phone_number,'.')-1) || '-' || 
substr(phone_number,instr(phone_number,'.')+1,instr(phone_number,'.',1,2)-(instr(phone_number,'.')+1)) || '-' ||
substr(phone_number,instr(phone_number,'.',1,3))-substr(phone_number,instr(phone_number,'.',1,2)+1) || '-' || substr(phone_number,instr(phone_number,'.',1,3)+1)
end "전번"
from employees;


 instr(phone_number, )-(instr(phone_number,'.',1,2)+1))
--조건문 
--case when instr(phone_number,'.',1,3) is null then

--왜 공백의 위치에 대해서 0번째로 나오는가
-- instr(phone_number,'.',1,2)+1
select instr(phone_number,'.',1,2)- instr(phone_number,'.',1,3)
from employees;
------------------------------------------------
select case when length(phone_number) > 16
        then 
        
        
        
