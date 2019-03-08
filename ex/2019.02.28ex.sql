--1��
--1
--20�� �μ��� �ִ�޿�
--80�� �μ��� �ּұ޿�

select (select max(mine.salary)
            from employees mine
            where mine.department_id = 20) �ִ�,
                (select min(maxe.salary)
                from employees maxe
                where maxe.department_id = 80) �ּ�
from dual;

--2
--'Toronto'�� �ٹ��ϴ� ����� ��� �̸� �μ���ȣ ������ȣ

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
--��� ����� ��� �̸� �޿� �޿���� �μ��̸�
--�� A�� 1���,B�� 2��� ---- F�� 6���   (decode �� �̿��ض�)

select e.employee_id, e.first_name, e.salary, (select decode( grade_level,'A','1','B','2','C','3','D','4','E','5','6')
                                                                from job_grades
                                                                where e.salary between lowest_sal and highest_sal) ���
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
                                                                       ,'F',6) "���"                            
from employees e, departments d
where e.department_id = d.department_id;

--4 pass
--20�� �μ��� �ְ�޿� ��Ī �μ� 20 �ְ�޿�
--50�� �μ��� �����޿� ��Ī �μ� 50 �����޿�
--60�� �μ��� ��ձ޿� ��Ī �μ� 60 ��ձ޿�
--80�� �μ��� �޿����� ��Ī �μ� 80 �޿�����
--90�� �μ��� �ο���   ��Ī �μ� 90 �ο���

--5. 'sales'���� ���ϴ� ����� ���, �̸�, �޿��� ���������� �̿��Ͽ� ��Ÿ���ÿ�
-- �޿��� ���� ���̽ÿ� (ex. 15000��)
select e.employee_id, e.first_name, e.department_id, e.salary
from employees e
where e.department_id in (select department_id
                                    from departments
                                    where lower(department_name) = lower('sales'));

--10.�μ��̸��� 'Sales'�̰ų�, ��� 'Europe' �� ����� �����ȣ�� ����� �̸��� �˻��϶� (����)
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

--3��
--1.��� �ѹ��� ǥ���Ͻÿ�.
--60���μ��� ����� �ο���
--110�� �μ��� �������� �޿�
--80�� �μ��� ���� ���� Ŀ�̼Ǻ���

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
--10�� �μ��� �ִ� ������ ���� ������ ��ġ�� �μ��鿡 �ٹ��ϴ�
--������� ���,�̸�,�μ���ȣ
select e.employee_id, e.first_name, e.department_id
from employees e
where e.department_id in (select department_id
                                    from departments
                                    where location_id = (select location_id
                                                                    from departments
                                                                    where department_id = 10) and department_id != 10));
-- ������ ������ �ǹ̸� �����!



--3. 'Jonathon'���� �ʰ� ���� ����� ���, �޿�, Ŀ�̼� ������ �޿�(Ŀ�̼��� ���� ��� 0���� ����)
select e.employee_id, e.salary, e.salary *(1+ nvl(e.commission_pct,0)) "Ŀ�̼����Ա޿�"
from employees e
where hire_date > (select hire_date
                            from employees
                            where lower(first_name) = 'jonathon');
                            
select e.employee_id, e.salary, e.salary *(1+ nvl(e.commission_pct,0)) "Ŀ�̼����Ա޿�"
from employees e, (select hire_date h
                            from employees
                            where lower(first_name) = 'jonathon') eh
where hire_date > eh.h;

select e.employee_id, e.salary, e.salary *(1+ nvl(e.commission_pct,0)) "Ŀ�̼����Ա޿�"
from employees e, (select hire_date h
                            from employees
                            where lower(first_name) = 'jonathon') eh
where hire_date > eh.h;
                            
                     
--4. 'Seattle'���� ���ϴ� �μ���
--���, �޿�, �̸�
select employee_id, salary, first_name
from employees
where department_id in (select department_id
                                    from departments
                                    where location_id = (select location_id
                                                                    from locations
                                                                    where lower(city) = lower('Seattle')));
                                                                    
                                                                    
------------4��
--2. �ٹ������� ������ ������� ��� �޿����� ũ��,
-- �������� ������� ������μ� �μ� ��ȣ�� (10, 20, 90)�� �ƴ� �����
-- ���, �̸�, �޿�, �μ���ȣ   

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








--3. �� �μ����� �ְ�޿��� �޴� ����� ���, �̸�, ����
select e.employee_id, e.first_name, e.salary, e.department_id
from employees e, (select department_id d, max(salary) ms
                            from employees
                            group by department_id) ge
where e.department_id = ge.d and e.salary = ge.ms;


--���� �ٸ� ���� ���� �޿��� �޴� ����� �ִٸ�?
select *
from employees emp
where emp.salary = (select max(salary)
                        from employees deptEmp
                        where nvl(emp.department_id, 0) = nvl(deptEmp.department_id, 0));


--4. ���� ������� ������ ����ض�
-- ���table�� manage_id �� ��ϵ� ������� ��� �̸� �޿� �� ���
-- ���, �̸�, �μ���
select distinct m.employee_id, m.first_name, m.salary, d.department_name
from employees e, employees m, departments d
where m.department_id = d.department_id and e.manager_id = m.employee_id;


--5. ��å�� �ٲ� ���� �ִ� ���(job_history)�� ���, �̸�, �޿�, �� ����� ���� �μ����� �ְ�޿�

select e.employee_id, e.first_name, dee.ms


from employees e, (select ee.employee_id jheid
                            from employees ee, (select distinct employee_id je
                                                            from job_history) j 
                            where ee.employee_id = j.je)jee, (select max(eee.salary) ms, eee.department_id de
                                                                                            from employees eee
                                                                                            group by eee.department_id) dee
where e.employee_id = jee.jheid and  e.department_id = dee.de;


select emp.employee_id as ���  , emp.first_name as �̸�   , emp.salary as �޿�  , 
            (select  max(salary)
             from   employees depEmp  
             where  emp.department_id = depEmp.department_id   ) as �μ����ְ�޿�
from employees emp
where emp.employee_id in (select jh.employee_id
                                       from  job_history jh );

--8. 20�� �μ��� ��ձ޿�
-- �μ��̸� �� ��
-- �Ŵ����� ��� �� �ο���

select (select count(eee.employee_id)
            from (select distinct e.employee_id
                    from employees e, employees em
                    where e.employee_id = em.manager_id)eee), (select avg(salary)
                                                                                    from employees
                                                                                    where department_id = 20),(select count(department_name)
                                                                                                                            from departments)
from dual;                                                                                          





--9. �μ���� �޿��� 20�� �μ��� ��� �޿����� ũ��,
-- �μ��� �������, �μ���ȣ�� 80,90 �ƴ� �����
-- ���, �̸�, �޿�, �μ���ȣ



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


                            
--10.10�� �μ��� ������ �μ����� ���� �޿��� ���� �޴� ����� ���϶�.
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