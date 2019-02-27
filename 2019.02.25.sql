-- 사원의 사번, 이름, 급여, 커미션포함급여
-- 커미션 포함 급여는 100의 자리수로 표현(반올림)

select employee_id, first_name, salary, commission_pct, round(salary * (1 + nvl(commission_pct,0)),-2)
from employees;

--- 문자함수

select 'kiTri', lower('nOH, jEongtAK'), upper('nOH, jEongtAK'), initcap('nOH, jEongtAK'), length('nOH, jEongtAK')
from dual;

-- full name
select employee_id, first_name, last_name, first_name || ' ' || last_name fullname,
concat(first_name, concat(' ', last_name))
from employees;

select employee_id, first_name, last_name, first_name || ' ' || last_name fullname,
concat('안녕하세요', concat('저는', first_name))
from employees;

select 'hello oracle !!!', substr('hello oracle !!!', 3, 5),'hello oracle !!!', substr('hello oracle !!!', 3,5)
from dual;

select instr('hello oracle!!!', 'o'), instr('hello oracle!!!o', 'o', 3, 4)
from dual;

select instr('010-2702-6429-','-', 10)
from dual;

--'123-456'
select '123-456' zipcode, substr('123-456', 1, 3) zip1, substr('123-456', 5, 3) zip2
from dual;
--'1234-56'
--'123-456'
--select '1234-56' zipcode, substr('1234-56', 1', instr('1234-56','-')-1) zip1, substr('1234-56', instr('1234-56','-')+1) zip2,
--'123-456' zipcode, substr('123-456', 1, instr('123-456','-')-1) zip1, substr('123-456', instr('123-456','-')+1) zip2
--from dual;

--날짜 함수
select sysdate, sysdate +3, sysdate-3, to_char(sysdate+3/24,'yy/mm/dd hh24:mi:ss')
from dual;

select sysdate, months_between(sysdate, sysdate ), next_day(sysdate,1),
add_months(sysdate,2), last_day(sysdate)
from dual;

select sysdate, to_char(sysdate, 'yyyy-yy-mm-mon-month-w-ww-d-dd-ddd-dy-day')
from dual;

select sysdate, to_char(sysdate,  'pm-hh-hh24-mi-ss')
from dual;

--일을 기준으로 시에서 반올림
select to_char(sysdate, 'yyyy.mm.dd. hh24:mi:ss'),
to_char(round(sysdate, 'dd'), 'yyyy.mm.dd. hh24:mi:ss') "라운드", 
to_char(round(sysdate, 'mm'), 'yyyy.mm.dd. hh24:mi:ss'),
to_char(round(sysdate, 'yy'), 'yyyy.mm.dd. hh24:mi:ss'),
to_char(round(sysdate, 'hh'), 'yyyy.mm.dd. hh24:mi:ss'),
to_char(round(sysdate, 'mi'), 'yyyy.mm.dd. hh24:mi:ss')
from dual
union
select to_char(sysdate, 'yyyy.mm.dd. hh24:mi:ss') ,
to_char(trunc(sysdate, 'dd'), 'yyyy.mm.dd. hh24:mi:ss'), 
to_char(trunc(sysdate, 'mm'), 'yyyy.mm.dd. hh24:mi:ss'),
to_char(trunc(sysdate, 'yy'), 'yyyy.mm.dd. hh24:mi:ss'),
to_char(trunc(sysdate, 'hh'), 'yyyy.mm.dd. hh24:mi:ss'),
to_char(trunc(sysdate, 'mi'), 'yyyy.mm.dd. hh24:mi:ss')
from dual
order by 라운드 desc;

--변환 함수
select 'a', 3, '3', 3+5, '3' + 5
from dual;

select 1123456.789,
to_char(1123456.789, '000,000,000.00'),
to_char(1123456.789, '999,999,999.99'), --앞의 자리가 여유가 있을때, 그 여유공간은 '공백'으로 채워져있음.(없는게 아님)


'123,456.98', to_number('123,456.98', '000,000.00') + 3  --  형변환 형식의 자릿수와 부호를 맞춰주는게 좋음
from dual;

select sysdate, to_char(sysdate,'yy.mm.dd'),
to_char(sysdate,'am hh:mi:ss'),
to_char(sysdate,'hh24:mi:ss')
from dual;

--20190225142154 >> 날짜 >> 3일 후
select to_char(to_date(to_char(20190225142154, '99999999999999'),'yyyy.mm.dd hh24:mi:ss')+3,'yyyy.mm.dd hh24:mi:ss'),
to_char(to_date(to_char(20190225142154, '99999999999999'),'yyyy.mmddhh24miss')+3,'yyyy.mm.dd hh24:mi:ss') 
from dual;

--일반함수
select commission_pct, nvl(commission_pct,0), nvl2(commission_pct,5,2)
from employees;

--연봉 등급
--급여가 4000 미만인 사원은 저연봉
--          10000 미만은          평균연봉
--          10000 이상은          고연봉
--사원의 사번, 이름, 급여, 연봉등급
select employee_id, concat(first_name, last_name), salary,
    case when salary < 4000
    then '저연봉'
    when salary < 10000
    then '평균연봉'
    else '고연봉'
    end 연봉등급
from employees
order by salary desc;

--사번, 이름, 입사일, 사원구분
--1980년도 입사 임원
--   90년도 입사 평사원
--2000년도 입사 신입사원
select employee_id, concat(first_name,last_name), hire_date,
    case when hire_date < to_date('1990.01.01','yyyy.mm.dd')
        then '임원'
        when hire_date < to_date('2000.01.01','yyyy.mm.dd')
        then '평사원'
        else '신입사원'
    end "사원구분"
from employees
order by hire_date asc;

select employee_id, concat(first_name,last_name), hire_date,
    case when to_number(to_char(hire_date, 'yyyy'), '0000') < 1990
        then '임원'
        when to_number(to_char(hire_date, 'yyyy'), '0000') < 2000
        then '평사원'
        else '신입사원'
    end "사원구분"
from employees
order by hire_date asc;

select employee_id, concat(first_name,last_name), hire_date,
    case when to_char(trunc(hire_date, 'yyyy'),'yyyy') < 1990
        then '임원'
        when to_char(trunc(hire_date, 'yyyy'),'yyyy') < 2000
        then '평사원'
        else '신입사원'
    end "사원구분"
from employees
order by hire_date asc;
--
select ascii('0'), ascii('A'), ascii('a')
from dual;