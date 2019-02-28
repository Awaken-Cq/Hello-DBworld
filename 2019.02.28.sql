--부서이름이 'IT"에 근무하는 사원의 사번, 이름, 급여
select e.employee_id, e.first_name, e.salary
from employees e, departments d
where e.department_id = d.department_id
and lower(d.department_name) = 'it';
--// 이 코딩의 흐름 - employees 테이블과 departments 테이블을 카타시안 프로덕트하여
--부서가 같고 부서이름이 'IT''인 행 반환. 카타시안 프로덕트로 인해 매우 비효율적임.


select employee_id, first_name, salary
from employees
where department_id = 60;

select *
from departments
where department_name = 'IT';

select *
from employees
where department_id = 60;

select *
from employees
where manager_id = 103;
--sub query(부질의, 하위질의)
--where 조건은 '='을 기준으로 왼쪽엔 col_name(department_id), 오른쪽엔 값이 나와야한다.
--고로 값을 먼저 연산하기위해 () 속에 값을 도출하는 쿼리문을 작성해야한다.
select employee_id, first_name, salary
from employees
where department_id = (select department_id
                                  from departments
                                  where department_name = 'IT');
                            
--'Seattle'에 근무하는 사원의 사번, 이름, 급여
select employee_id,  first_name, salary, department_id
from employees 
where department_id in (select department_id
                                  from departments
                                  where location_id = (select location_id
                                                                from locations
                                                                where city = 'Seattle'));
                                                                
                                                                select employee_id,  first_name, salary
from employees 
where department_id in (select department_id
                                  from departments
                                  where location_id = (select location_id
                                                                from locations
                                                                where city = 'Seattle'));
                                                                
--지역번호가 1700인 부서에서 일하는 사원의
--사번, 이름, 부서번호, 부서이름
select e.employee_id, e.first_name, e.department_id, d.department_name
from employees e, departments d
where e. department_id = d.department_id and d.location_id = 1700;

select e.employee_id, e.first_name, e.department_id, d.department_name
from employees e join departments d on e. department_id = d.department_id
where d.location_id = 1700;

////////////////

select e.employee_id, e.first_name, e.department_id, d.department_name
from employees e, (select department_id, department_name
                            from departments
                            where location_id = 1700) d
where e. department_id = d.department_id;
-- 8건중 4건, 4건으로 조인해서 80개 중 6개
select department_id, department_name
from departments
where location_id = 1700;

--'kevin'보다 급여를 많이 받는 사원의 사번, 이름, 급여
select e.employee_id, e.first_name, e.salary
from employees e, (select salary
                            from employees
                            where lower(first_name) = 'kevin') em
where e.salary > em.salary;

--50번 부서에 있는 사원들보다 급여를 많이 받는 사원의 사번, 이름, 급여
select e.employee_id, e.first_name, e.salary
from employees e
where e.salary > (select max(salary)
                            from employees
                            where department_id = 50);
                            
select e.employee_id, e.first_name, e.salary
from employees e
where e.salary > all(select salary
                            from employees
                            where department_id = 50);

--부서에 근무하는 사원들의 평균 급여보다 많이 받는 사원의 사번, 이름, 급여
select e.employee_id, e.first_name, e.salary
from employees e
where e.salary > (select avg(salary)
                            from employees
                            where department_id is not null);
                            
                           
    이건 왜 안될까요?!??? =================                  ===================
select e.employee_id, e.first_name, e.salary
from employees e, (select max(salary)
                            from employees
                            where department_id = 50) ms
where e.salary > ms.salary;



////////////////////////////////////////////////////////////////////////      
--1.부서번호가 20번인 사원들의 평균 급여보다 크고
--2.매니저인 사원으로 부서 번호가 20이 아닌 부서장
--사번, 이름, 급여, 부서번호
select distinct em.employee_id, em.first_name, em.salary, em.department_id
from employees em, departments d
where em.department_id != 20 and em.employee_id = d.manager_id  and
em.salary > (select avg(salary)
                    from employees
                    where department_id = 20);
                    
                    
                    
--@@@@@@@@@@@@@@@@@@@@

--1.부서번호가 20번인 사원들의 평균 급여보다 크고
--2.매니저인 사원으로 부서 번호가 20이 아닌 매니저의
--사번, 이름, 급여, 부서번호
select e.employee_id, e.first_name, e.salary, e.department_id
from employees e, (select manager_id
                            from departments) d
where department_id != 20 and e.employee_id = d.manager_id and
salary >  (select avg(salary)
                    from employees
          where department_id = 20);
                    
select distinct em.employee_id, em.first_name, em.salary, em.department_id
from employees e, employees em
where em.department_id != 20 and em.employee_id = e.manager_id  and
em.salary > (select avg(salary)
                    from employees
                    where department_id = 20);
                    
                    
--1.부서번호가 20번인 사원들의 평균 급여보다 크고
--2.매니저인 사원으로 부서 번호가 20이 아닌 매니저의
--사번, 이름, 급여, 부서번호
--select e.employee_id, e.first_name, e.salary, e.department_id
--from employees e, (select manager_id
select m.emloyee_id, m.first_name, m.salary, m.department_id
from employees e, employees m
where e.manager_id = m.employee_id and m.department_id != 20 
,m.salary > (select avg(salary)
                        from employees
                       where department_id = 20);
                       

--select employee_id, first_name, salary, department_id
--from (select employee_id
         from employees
         where department_id != 20)
---where salary >  (select avg(salary)
                        from employees
                       where department_id = 20;
and 
////////////////////////////////////////////////////////////////////////////

--20번 부서의 평균급여
--50번 부서의 급여총합
--80번 부서의 인원수
select (select avg(salary)
               from employees
               where department_id = 20) aa,
         (select sum(salary)
                from employees
                where department_id = 50) ss,
         (select count(employee_id)
                 from employees
                 where department_id = 80) cc
from dual;
///select절에 나오는 서브커리는 단일행 단일쿼리일때만 쓸 수 있다(행도 1개, 열도 1개)

--모든 사원의 사번, 이름,급여, 등급, 부서이름
--단 A는 1등, B는 2등급,... F는 6등급
--select 서브쿼리



--1
select e.employee_id, e.first_name, e.salary,
    case
        when (select grade_level from job_grades where e.salary between lowest_sal and highest_sal) = 'A'
        then '1등급'
        when (select grade_level from job_grades where e.salary between lowest_sal and highest_sal) = 'B'
        then '2등급'
        when (select grade_level from job_grades where e.salary between lowest_sal and highest_sal) = 'C'
        then '3등급'
        when (select grade_level from job_grades where e.salary between lowest_sal and highest_sal) = 'D'
        then '4등급'
        when (select grade_level from job_grades where e.salary between lowest_sal and highest_sal) = 'E'
        then '5등급'
        else 'F'
     end 등급,
     d.department_name
from employees e, departments d
where e.department_id = d.department_id;
--2
select e.employee_id, e.first_name, e.salary,
    decode((select grade_level from job_grades where e.salary between lowest_sal and highest_sal),
    'A','1등급',
    'B','2등급',
    'C','3등급',
    'D','4등급',
    'E','5등급',
    '6등급') 등급,
     d.department_name
from employees e, departments d
where e.department_id = d.department_id;