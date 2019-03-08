--1조
--1
--20번 부서의 최대급여
--80번 부서의 최소급여

select (select max(mine.salary)
            from employees mine
            where mine.department_id = 20) 최대,
                (select min(maxe.salary)
                from employees maxe
                where maxe.department_id = 80) 최소
from dual;

--2
--'Toronto'에 근무하는 사원의 사번 이름 부서번호 직업번호

select e.employee_id, e.first_name, e.department_id, e.job_id
from employees e, departments d, locations l
where e.department_id = d.department_id 
and d.location_id = l.location_id 
and l.city = 'Toronto';

select e.employee_id, e.first_name, e.department_id, e.job_id
from employees e
where e.department_id in (select department_id
                                    from departments
                                    where location_id = (select location_id
                                                                    from locations
                                                                    where lower(city) = 'toronto'));
                                                                    
--3
--모든 사원의 사번 이름 급여 급여등급 부서이름
--단 A는 1등급,B는 2등급 ---- F는 6등급   (decode 를 이용해라)

select e.employee_id, e.first_name, e.salary, (select decode( grade_level,'A','1','B','2','C','3','D','4','E','5','6')
                                                                from job_grades
                                                                where e.salary between lowest_sal and highest_sal) 등급
from employees e, departments d
where e.department_id = d.department_id;

select e.employee_id, e.first_name, e.salary, decode ((select grade_level 
                                                                        from job_grades
                                                                        where e.salary between lowest_sal and highest_sal),
                                                                        'A',1
                                                                       ,'B',2
                                                                       ,'C',3
                                                                       ,'D',4
                                                                       ,'E',5
                                                                       ,'F',6) "등급"                            
from employees e, departments d
where e.department_id = d.department_id;

--4 pass
--20번 부서의 최고급여 별칭 부서 20 최고급여
--50번 부서의 최저급여 별칭 부서 50 최저급여
--60번 부서의 평균급여 별칭 부서 60 평균급여
--80번 부서의 급여총합 별칭 부서 80 급여총합
--90번 부서의 인원수   별칭 부서 90 인원수

--5. 'sales'에서 일하는 사원의 사번, 이름, 급여를 서브쿼리를 이용하여 나타내시오
-- 급여에 원을 붙이시요 (ex. 15000원)
select e.employee_id, e.first_name, e.department_id, e.salary
from employees e
where e.department_id in (select department_id
                                    from departments
                                    where lower(department_name) = lower('sales'));

--10.부서이름이 'Sales'이거나, 대륙 'Europe' 인 사원의 사원번호와 사원의 이름을 검색하라 (질문)
select employee_id, first_name
from employees
where department_id = (select department_id
                                    from departments
                                    where lower(department_name) = lower('sales'))
or department_id in (select department_id
                                    from departments
                                    where location_id = (select location_id
                                                                    from locations
                                                                    where country_id in(select country_id
                                                                                                    from countries
                                                                                                    where region_id = (select region_id
                                                                                                                                from regions
                                                                                                                                where lower(region_name) = lower('Europe'))))); 

--3조
--1.모두 한번에 표시하시오.
--60번부서의 사원들 인원수
--110번 부서의 가장작은 급여
--80번 부서의 가장 높은 커미션비율

select (select count(employee_id)
            from employees
            where department_id = 60) a,
            (select min(salary)
            from employees
            where department_id = 110) b,
            (select max(commission_pct)
            from employees
            where department_id = 80) c
from dual;            



--2.
--10번 부서에 있는 사원들과 같은 지역에 위치한 부서들에 근무하는
--사원들의 사번,이름,부서번호
select e.employee_id, e.first_name, e.department_id
from employees e
where e.department_id in (select department_id
                                    from departments
                                    where location_id = (select location_id
                                                                    from departments
                                                                    where department_id = 10) and department_id != 10));
-- 문제의 이중적 의미를 물어볼것!



--3. 'Jonathon'보다 늦게 고용된 사원의 사번, 급여, 커미션 포함한 급여(커미션이 없을 경우 0으로 간주)
select e.employee_id, e.salary, e.salary *(1+ nvl(e.commission_pct,0)) "커미션포함급여"
from employees e
where hire_date > (select hire_date
                            from employees
                            where lower(first_name) = 'jonathon');
                            
select e.employee_id, e.salary, e.salary *(1+ nvl(e.commission_pct,0)) "커미션포함급여"
from employees e, (select hire_date h
                            from employees
                            where lower(first_name) = 'jonathon') eh
where hire_date > eh.h;

select e.employee_id, e.salary, e.salary *(1+ nvl(e.commission_pct,0)) "커미션포함급여"
from employees e, (select hire_date h
                            from employees
                            where lower(first_name) = 'jonathon') eh
where hire_date > eh.h;
                            
                     
--4. 'Seattle'에서 일하는 부서의
--사번, 급여, 이름
select employee_id, salary, first_name
from employees
where department_id in (select department_id
                                    from departments
                                    where location_id = (select location_id
                                                                    from locations
                                                                    where lower(city) = lower('Seattle')));
                                                                    
                                                                    
------------4조
--2. 근무지역이 영국인 사원들의 평균 급여보다 크고,
-- 누군가의 상급자인 사원으로서 부서 번호가 (10, 20, 90)이 아닌 사원의
-- 사번, 이름, 급여, 부서번호   

select distinct e.employee_id, e.first_name, e.salary, e.department_id
from employees e, (select manager_id m
                                from employees )em
                               
                               
where e.salary >  (select avg(ee.salary)
                            from employees ee
                            where department_id in (select department_id
                                                                from departments
                                                                where location_id = (select location_id
                                                                                                from locations
                                                                                                where lower(country_id) = 'uk')))
and e.employee_id = em.m and not department_id in (10,20,90) ;








--3. 각 부서에서 최고급여를 받는 사람의 사번, 이름, 봉급
select e.employee_id, e.first_name, e.salary, e.department_id
from employees e, (select department_id d, max(salary) ms
                            from employees
                            group by department_id) ge
where e.department_id = ge.d and e.salary = ge.ms;


--만약 다른 부의 같은 급여를 받는 사람이 있다면?
select *
from employees emp
where emp.salary = (select max(salary)
                        from employees deptEmp
                        where nvl(emp.department_id, 0) = nvl(deptEmp.department_id, 0));


--4. 다음 사람들의 정보를 출력해라
-- 사원table에 manage_id 로 등록된 사원들의 사번 이름 급여 를 출력
-- 사번, 이름, 부서명
select distinct m.employee_id, m.first_name, m.salary, d.department_name
from employees e, employees m, departments d
where m.department_id = d.department_id and e.manager_id = m.employee_id;


--5. 직책이 바뀐 적이 있던 사원(job_history)의 사번, 이름, 급여, 그 사원이 속한 부서에서 최고급여

select e.employee_id, e.first_name, dee.ms


from employees e, (select ee.employee_id jheid
                            from employees ee, (select distinct employee_id je
                                                            from job_history) j 
                            where ee.employee_id = j.je)jee, (select max(eee.salary) ms, eee.department_id de
                                                                                            from employees eee
                                                                                            group by eee.department_id) dee
where e.employee_id = jee.jheid and  e.department_id = dee.de;


select emp.employee_id as 사번  , emp.first_name as 이름   , emp.salary as 급여  , 
            (select  max(salary)
             from   employees depEmp  
             where  emp.department_id = depEmp.department_id   ) as 부서내최고급여
from employees emp
where emp.employee_id in (select jh.employee_id
                                       from  job_history jh );

--8. 20번 부서의 평균급여
-- 부서이름 총 수
-- 매니저인 사원 총 인원수

select (select count(eee.employee_id)
            from (select distinct e.employee_id
                    from employees e, employees em
                    where e.employee_id = em.manager_id)eee), (select avg(salary)
                                                                                    from employees
                                                                                    where department_id = 20),(select count(department_name)
                                                                                                                            from departments)
from dual;                                                                                          





--9. 부서평균 급여가 20번 부서의 평균 급여보다 크고,
-- 부서장 사원으로, 부서번호가 80,90 아닌 사원의
-- 사번, 이름, 급여, 부서번호



select e.employee_id, e.first_name, e.salary, d.department_id, d.department_name
from employees e, (select department_id,avg(salary)
                            from employees
                            group by department_id
                            having avg(salary) > (select avg(salary)
                                                            from employees
                                                            where department_id = 20))ad, departments d
where e.department_id = ad.department_id 
and e.employee_id = d.manager_id
and not e.department_id in (80,90) ;              


                            
--10.10번 부서를 제외한 부서별로 가장 급여를 많이 받는 사원을 구하라.
select e.employee_id, e.first_name, e.salary
from employees e, (select max(salary) s, department_id d
                            from employees
                            group by department_id
                            having department_id != 10) a
where e.department_id = a.d and e.salary = a.s;

select *
from employees emp
where emp.salary = (select max(salary)
                        from employees deptEmp
                        where emp.department_id = deptemp.department_id);
                        
                        
                        where nvl(emp.department_id, 0) = nvl(deptEmp.department_id, 0));