--1. �̸��� bruce�� ����� ���, �μ���ȣ, �޿��� �̾ƶ�. (������ �빮������ �ҹ��������� �𸥴�.)
select employee_id, first_name, department_id, salary
from employees
where lower(first_name) = 'bruce';

--2. �̸��� Steven�� ����� �ٹ��ϴ� �����̸��� ���ض�
select first_name, department_id
from employees
where upper(first_name) = 'STEVEN'; 

select department_id, location_id
from departments
where department_id = 90;

select location_id, city
from locations
where location_id = 1700;

--3. Ŀ�̼��� �޴� ����� 10000�� �Ѵ� ����� ��� �̸� �μ���ȣ, Ŀ�̼��� ������ �޿��� ã�ƶ�
select employee_id, first_name, department_id, salary, commission_pct, salary *(1+nvl(commission_pct,0))
from employees
where commission_pct is not null
and salary >= 10000;


--4. �ٹ��μ��� null�� ����� ��� �̸� �μ���ȣ�� ã�ƶ�
select first_name, department_id
from employees
where department_id is null;


--5. �ٹ� �μ��� Oxford�� ������ȣ ã�� (��ҹ��� ��� ã��) (��Ī: ���� ��ȣ)
select location_id "���� ��ȣ"
from locations
where city = 'Oxford';


--6. �ٹ����� ���� ���� ����ϱ� (�ߺ�����) (��Ī: ����)
 select distinct job_id ����
 from employees;

--***7. ������ �ּұ޿��� �ִ� �޿��� ���̰� ������? 2�� �̸����� ���̳��� �������̵�, �ּұ޿�, �ִ�޿�, �޿�����( ��Ī �޿����� )
select job_id, min_salary, max_salary, max_salary-min_salary �޿�����
from jobs
where (max_salary-min_salary) > (max_salary/2);

--8. ������ programmer�� ����� Ǯ����(��Ī : �̸�), �޿�(��Ī : �޿�) 
select *
from jobs;

select first_name || last_name �̸�, salary �޿�
from employees
where job_id = 'IT_PROG';

--9. Ŀ�̼��� �޴� ����� ��� , �̸�, �޿��� �޿��� �������� ������ �϶�.
--pass

--10. ���, �̸�, Ŀ�̼��� ������ �޿��� �������� ������ �϶�.(Ŀ�̼��� ������ �޿��� ��Ī�� cms)
select employee_id, first_name, salary *(1+nvl(commission_pct,0)) cms
from employees
order by cms desc;

--**1. ������ �������� �ٷ����� �ټӳ���� ��Ÿ���� 25�������� ����߿� ������޷����� D�λ������ ��Ÿ���ÿ�. 
   --(���, �̸�, �����, �ټӳ��)
   --(��, ������ �Ű澲���ʴ´�.�������ϱ� ��) 
select 
from
;
--2. last_name�� a�� ���� ����� ���, Ǯ����, �޿��� �޿��� ���� ������� ��Ÿ�����.
   --�̸��� �÷��� employee_name�� ǥ���Ѵ�.
   --(��, a�� ��ҹ��� �����Ѵ�.)
   select employee_id, first_name || last_name "employee_name", salary
   from employees
   where upper(last_name) like '%A%'
   order by salary desc;

--3. �Ŵ��� ��ȣ�� 100 �̻� 200 �̸��̰�, �̱��� ��ġ�ϰ� �ִ� �μ��� �μ���ȣ, �μ���
select country_id, location_id
from locations;

select department_id, department_name
from departments
where manager_id >= 100
and manager_id < 200
and location_id in (1400, 1500, 1700);

--4. �����ȣ�� 9�� ���� ������ ��ġ�� �μ����� ���ϸ�, �޿��� 7000 �̻��� ����� �̸� (�μ��� �̸������� ����)

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

--5. �޿��� 3000�̻��̰� 50���̻� �μ��� �ٹ��ϸ� �̸��� r�� ���� ������� ����� �̸�, �޿��� �˻��϶�
select employee_id, first_name, salary
from employees
where salary >= 3000
and department_id >= 50
and first_name like '%r%';

--6. �������̵� AD�� �����ϴ� ���� �˻��ϰ� �ְ�޿����� ������������ �޿��� �����϶�
select job_id, max_salary
from jobs
where job_id like 'AD%'
order by max_salary desc;

--7. �ٹ������� �̱��� ����� Ǯ���Ӱ� �ٹ����� ��¥�� ��� 'OOO�� OOO���� �̱����� ���Ѵ�.' �� ����϶�. 
   --��Ī�� �뵿�� from USA�� ����(��������)
select country_id, location_id
from locations
where country_id = 'US';

select location_id, department_id
from departments
where location_id in (1400, 1500, 1700);

select first_name || last_name || '�� ' || hire_date || '���� �̱����� ���Ѵ�.' "�뵿�� from USA"
from employees
where department_id in ( 60, 50, 10, 90, 110, 190);

--8. ���̳� �̸��� h�� �� ����� ���� ������ ��� ����ϵ� �޿��� ������� ������������ �����Ͽ���.
select *
from employees
where first_name like '%h%'
or last_name like '%h%'
order by salary desc, hire_date desc;

--31. ������ ID�� 124���̸�, �޿��� 2500 �̻� 3500 �̸��� ����� (�̸�, �޿�, ������ ID)�� ����ϼ���.
-- ��, �޿��� ���� ������ ����
select first_name, salary, manager_id
from employees
where manager_id = 124 
and salary >= 2500 
and salary < 3500
order by salary desc;

--32. ������ ID�� 100�̰� �̸��� 2��°�� 'o'�� ����� (�̸�, Ŀ�̼�, Ŀ�̼� ���� �� �޿�)�� ����ϼ���.  *Ŀ�̼��� null�� ��� 0���� ��ü�Ͽ� ��� �� ���
-- ��, Ŀ�̼� ���� �� �޿��� ���� ������ ����
select first_name, commission_pct, salary *(1+nvl(commission_pct,0)) pay 
from employees
where manager_id = 100
and first_name like '_o%'
order by pay desc;


--33. �����ڰ� �������� ���� ����� (�̸�)�� ����ϼ���. *�̸� ���� : [�� �̸�]
select last_name || ' ' || first_name 
from employees
where manager_id is NULL;

--34. �ִ� �޿��� �ּ� �ӱ��� ���� 5000 �̻��� ������ (�̸�, �ִ� �޿�, �ּ� �޿�, �޿��� ����)�� ����ϼ���.
-- ��, �޿��� ���̰� ū ������ �����ϼ���.
select job_title, max_salary, min_salary, max_salary-min_salary difference
from jobs
order by difference desc, max_salary desc;

--35. ���� �ð�, 3�� ��, 3�ð� ��, 3�� ��, 3�� �ĸ� ����ϼ��� *������ ��Ī ����(���� �ð�, 3�� �� ~)
-- ��, ��� ������ '�⵵-��-�� ��:��:��'

select to_char(sysdate, 'yyyy. mm. dd hh:mi:ss') "���� �ð�",
to_char(sysdate +3, 'yyyy. mm. dd hh:mi:ss')  "3�� ��",
to_char(sysdate + 3/24/60, 'yyyy. mm.dd hh:mi:ss') "3�� ��",
to_char(sysdate + 3/24/60/60, 'yyyy. mm. dd hh:mi:ss') "3�� ��"
from dual;

������
--90�� ������ ���� ������� �ִ� �޿�, �μ��̸�  
select employee_id, job_id, hire_date
from employees
where to_char(hire_date, 'yyyy') <= 1989;

select job_id, max_salary
from jobs
where employee_id in (100, 101, 200);


--��å�� President �� ����� ��볯¥, �̸� , �޿�
�ǿ���
-- 2.�μ���ȣ�� 50�̻�, ���� ������ �ι�°�� 'o'�� �� ����� ��ü Ǯ���Ӱ� �޿��� ��Ÿ���ÿ�. 
-- ��Ī : �̸� / �޿� ��� (�����Ͻÿ�)
-- �޿���� ������������ ���� �Ͻÿ�.

select first_name || last_name �̸�, salary "�޿� ���"
from employees
where department_id >= 50
and last_name like '%o_'
order by salary;