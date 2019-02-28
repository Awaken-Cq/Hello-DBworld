--�μ��̸��� 'IT"�� �ٹ��ϴ� ����� ���, �̸�, �޿�
select e.employee_id, e.first_name, e.salary
from employees e, departments d
where e.department_id = d.department_id
and lower(d.department_name) = 'it';
--// �� �ڵ��� �帧 - employees ���̺�� departments ���̺��� īŸ�þ� ���δ�Ʈ�Ͽ�
--�μ��� ���� �μ��̸��� 'IT''�� �� ��ȯ. īŸ�þ� ���δ�Ʈ�� ���� �ſ� ��ȿ������.


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
--sub query(������, ��������)
--where ������ '='�� �������� ���ʿ� col_name(department_id), �����ʿ� ���� ���;��Ѵ�.
--��� ���� ���� �����ϱ����� () �ӿ� ���� �����ϴ� �������� �ۼ��ؾ��Ѵ�.
select employee_id, first_name, salary
from employees
where department_id = (select department_id
                                  from departments
                                  where department_name = 'IT');
                            
--'Seattle'�� �ٹ��ϴ� ����� ���, �̸�, �޿�
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
                                                                
--������ȣ�� 1700�� �μ����� ���ϴ� �����
--���, �̸�, �μ���ȣ, �μ��̸�
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
-- 8���� 4��, 4������ �����ؼ� 80�� �� 6��
select department_id, department_name
from departments
where location_id = 1700;

--'kevin'���� �޿��� ���� �޴� ����� ���, �̸�, �޿�
select e.employee_id, e.first_name, e.salary
from employees e, (select salary
                            from employees
                            where lower(first_name) = 'kevin') em
where e.salary > em.salary;

--50�� �μ��� �ִ� ����麸�� �޿��� ���� �޴� ����� ���, �̸�, �޿�
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

--�μ��� �ٹ��ϴ� ������� ��� �޿����� ���� �޴� ����� ���, �̸�, �޿�
select e.employee_id, e.first_name, e.salary
from employees e
where e.salary > (select avg(salary)
                            from employees
                            where department_id is not null);
                            
                           
    �̰� �� �ȵɱ��?!??? =================                  ===================
select e.employee_id, e.first_name, e.salary
from employees e, (select max(salary)
                            from employees
                            where department_id = 50) ms
where e.salary > ms.salary;



////////////////////////////////////////////////////////////////////////      
--1.�μ���ȣ�� 20���� ������� ��� �޿����� ũ��
--2.�Ŵ����� ������� �μ� ��ȣ�� 20�� �ƴ� �μ���
--���, �̸�, �޿�, �μ���ȣ
select distinct em.employee_id, em.first_name, em.salary, em.department_id
from employees em, departments d
where em.department_id != 20 and em.employee_id = d.manager_id  and
em.salary > (select avg(salary)
                    from employees
                    where department_id = 20);
                    
                    
                    
--@@@@@@@@@@@@@@@@@@@@

--1.�μ���ȣ�� 20���� ������� ��� �޿����� ũ��
--2.�Ŵ����� ������� �μ� ��ȣ�� 20�� �ƴ� �Ŵ�����
--���, �̸�, �޿�, �μ���ȣ
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
                    
                    
--1.�μ���ȣ�� 20���� ������� ��� �޿����� ũ��
--2.�Ŵ����� ������� �μ� ��ȣ�� 20�� �ƴ� �Ŵ�����
--���, �̸�, �޿�, �μ���ȣ
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

--20�� �μ��� ��ձ޿�
--50�� �μ��� �޿�����
--80�� �μ��� �ο���
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
///select���� ������ ����Ŀ���� ������ ���������϶��� �� �� �ִ�(�൵ 1��, ���� 1��)

--��� ����� ���, �̸�,�޿�, ���, �μ��̸�
--�� A�� 1��, B�� 2���,... F�� 6���
--select ��������



--1
select e.employee_id, e.first_name, e.salary,
    case
        when (select grade_level from job_grades where e.salary between lowest_sal and highest_sal) = 'A'
        then '1���'
        when (select grade_level from job_grades where e.salary between lowest_sal and highest_sal) = 'B'
        then '2���'
        when (select grade_level from job_grades where e.salary between lowest_sal and highest_sal) = 'C'
        then '3���'
        when (select grade_level from job_grades where e.salary between lowest_sal and highest_sal) = 'D'
        then '4���'
        when (select grade_level from job_grades where e.salary between lowest_sal and highest_sal) = 'E'
        then '5���'
        else 'F'
     end ���,
     d.department_name
from employees e, departments d
where e.department_id = d.department_id;
--2
select e.employee_id, e.first_name, e.salary,
    decode((select grade_level from job_grades where e.salary between lowest_sal and highest_sal),
    'A','1���',
    'B','2���',
    'C','3���',
    'D','4���',
    'E','5���',
    '6���') ���,
     d.department_name
from employees e, departments d
where e.department_id = d.department_id;