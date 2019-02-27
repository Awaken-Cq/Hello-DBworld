--where ������

--�޿��� 5000�̻� �޴� ����� ���, �̸�, �޿�, �μ���ȣ
select employee_id, first_name, salary, department_id
from employees
where salary >= 5000;

--����� 100�� ����� ���, �̸�, �μ���ȣ
select employee_id, first_name, department_id
from employees
where employee_id = 100;

--�ٹ����ð� seatle�� ������ ������ȣ, �����ȣ, ����
Select Location_Id, Postal_Code, City
From Locations
Where City = 'Seattle';

--�޿��� 5000�̻� 10000�̸��� �޴� ����� ���, �̸�, �޿�, �μ���ȣ
select employee_id,first_name,salary,department_id
from employees
where salary >= 5000 and salary < 12000;

--�޿��� 5000�̻� 12000���ϸ� �޴� ����� ���, �̸�, �޿�, �μ���ȣ
select employee_id,first_name,salary,department_id
from employees
where salary >= 5000 and salary < 12000;

select employee_id,first_name,salary,department_id
from employees
where salary not between 5000 and  12000;

--�μ���ȣ�� 50�� ��� �� �޿��� 10000�̻� �޴� ����� ���, �̸�, �޿�, �μ���ȣ
select employee_id, first_name, salary, department_id
from employees
where department_id = 50 
and salary >= 5000;

--Ŀ�̼��� �޴� ����� ���, �̸�, �޿�, Ŀ�̼����Ա޿�
select employee_id,first_name,salary, commission_pct, salary * (1+commission_pct)
from employees
where commission_pct is not null;

--�ٹ��μ��� 50, 60, 80�� ����� ���, �̸�, �μ���ȣ
select employee_id, first_name, department_id
from employees
where department_id = 50
or department_id = 60
or department_id = 80;

select employee_id, first_name, department_id
from employees
where department_id in (50, 60, 80);

--�޿��� 3000�̻� �̰ų� 8000�̻��̰ų� 5000�̻��� ����� ���, �̸�, �޿�
select employee_id, first_name, salary
from employees
where salary >= 3000
or salary >= 8000 
or salary >= 5000;

select employee_id, first_name, salary
from employees
where salary >= any(3000, 8000, 5000);

--�޿��� 3000�̻��̰� 8000�̻��̰� 5000�̻���, ����� ���, �̸�, �޿�
select employee_id, first_name, salary
from employees
where salary >= 3000
and salary >= 8000
and salary >= 5000;

select employee_id, first_name, salary
from employees
where salary >= all(3000, 8000, 5000);



--���� �ð�, 3�� �� , 3�ð� ��, 3
select sysdate, to_char(sysdate, 'yy.mm.dd hh24:mi:ss') "���� �ð�",
to_char(sysdate + 3, 'yy.mm.dd hh24:mi:ss') "3�� ��",
to_char(sysdate + 3 / 24, 'yy.mm.dd hh24:mi:ss') "3�ð� ��",
to_char(sysdate - 3, 'yy.mm.dd hh24:mi:ss') "3�� ��"
from dual;

--�̸��� steven�� ����� ���, �̸�
select employee_id, first_name
from employees
where first_name = 'Steven';

--�̸��� 'S'�� �����ϴ� ����� ���, �̸�
select employee_id, first_name
from employees
where first_name like 'S%';

select employee_id, first_name
from employees
where first_name like '%e%';

--�̸��� 'y'�� ������ ����� ���, �̸�
select employee_id, first_name
from employees
where first_name like '%y';

--�̸� ������ �ι�°�� 'e'�� ����� ����� �̸�
select employee_id, first_name
from employees
where first_name like '%e_';

--�μ���ȣ�� 50�� �ƴ� ����� ���, �̸�, �μ���ȣ
select employee_id, first_name, department_id
from employees
where department_id != 50;

select employee_id, first_name, department_id
from employees
where department_id^ = 50;

select employee_id, first_name, department_id
from employees
where department_id <> 50;

--��� ����� ���, �̸�, �޿� ��������
--��, �޿��� ����
select employee_id, first_name, salary
from employees
order by salary asc;
--��������
select employee_id, first_name, salary
from employees
order by salary desc;


--�μ���ȣ, ���, �̸�, �޿�
--�μ��� �޿������� ����
select department_id "did", employee_id, first_name, salary sal
from employees
order by "did", sal desc;

--�ٹ����ð� 'Seattle'�� ����� ���, �̸�, �μ���ȣ

select location_id
from locations;

select department_id
from departments;

select employee_id, first_name, department_id
from employees
where department_id in(10, 90, 110, 190);


--4���̻� �ٹ��ϰ� ����� ����� ��ȣ�� JOB_ID ����Ͻÿ�.
select employee_id, job_id, start_date, end_date, (end_date - start_date)/365
from job_history
where end_date - start_date >= (365*4);


--�ٹ����ð� seatle�� ������ ������ȣ, �����ȣ, ����
Select first_name
From employees
Where lower(first_name) like '%t%';

select *
from locations
where upper(city) = 'SEATTLE';

select to_char(sysdate, 'mm!dd!hh!hh24!mi!mi!ss')
from dual;
