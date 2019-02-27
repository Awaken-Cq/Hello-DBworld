--���, �̸�, �μ���ȣ, ��������
--�μ���ȣ 60 ������
--              90 �ӿ���
--     ������ �񰳹���

select employee_id, first_name, department_id,
    case when department_id = 60
            then '������'
            when department_id = 90
            then '�ӿ���'
            else '�񰳹���'
        end ��������
from employees;

select *
from departments;

select employee_id, first_name, department_id,
        decode(department_id,
                        60, '������',
                        90, '�ӿ���',
                        '�񰳹���') "��������"
from employees;

----�׷��Լ�
--ȸ���� �ѻ����, �޿�����, �޿����, �ְ�޿�, �����޿�
select count(employee_id), sum(salary), avg(salary), max(salary), min(salary)
from employees;

--���, �̸�, �μ���ȣ, �μ��̸�
select employee_id, first_name, department_id, department_name
from employees;

---cartesian join(cross join)
select *
from employees, departments
order by employee_id;

--equi join
select employees.employee_id, employees.first_name, departments.department_id, departments.department_name
from employees, departments
where employees.department_id = departments.department_id
order by employee_id;

select e.employee_id, e.first_name, d.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id
order by employee_id;


-- 'seattle'�� �ٹ��ϴ� ����� ���, �̸�, �μ��̸�, �����̸�

select e.employee_id, e.first_name, d.department_name, l.city
from employees e, departments d, locations l
where e.department_id = d.department_id and d.location_id = l.location_id and lower(city) = lower('seattle');

-- 'asia'�� �ٹ��ϴ� ��� �̸� �μ��̸� �����̸�
select employee_id, first_name, e.department_id, city
from employees e, departments d, locations l, countries c,regions r
where e.department_id = d.department_id 
and d.location_id = l.location_id
and l.country_id = c.country_id
and c.region_id = r.region_id
and lower(region_name) = lower('europe');


-- 10, 80, 90�� �μ��� �ٹ����� �����
-- ���, �̸�, ��å�̸�, �μ��̸�
select e.employee_id, e.first_name, e.job_id, d.department_name
from employees e, departments d, jobs j
where e.job_id = j.job_id 
and e.department_id = d.department_id
and e.department_id in(10, 80, 90);

--����� 200�� ����� �ٹ� �̷�
--���, �̸�, �ٹ� ��� ��å�̸�, �ٹ� ��� �μ��̸�, �ٹ� ������(�Ҽ��� ��°�ڸ����� ǥ��)
select e.employee_id, e.first_name, d.department_name, js.job_title,
to_char(months_between(jh.end_date,jh.start_date),'99.99') "�ٹ�����"
from employees e, job_history jh, departments d, jobs js
where e.employee_id = jh.employee_id
and d.department_id = jh.department_id
and jh.job_id = js.job_id
and jh.employee_id = 200;

select *
from job_history;

select (sysdate-to_date(20170226,'yyyy.mm.dd'))
from dual;

--��� ����� �μ��̸�, ���, �̸�, �Ŵ������,�Ŵ����̸�
--��Ʈ self join
select d.department_name, e.employee_id, e.first_name, em.employee_id, em.first_name
from employees e, departments d, employees em
where e.department_id = d.department_id
and e.manager_id = em.employee_id;

select d.department_name, e.employee_id, e.first_name,e.manager_id,m.employee_id, m.first_name
from employees e, employees m, departments d
where m.employee_id =e.manager_id
and e.department_id = d.department_id;

select *
from employees;

select employee_id
from employees;
--decode�� �̿��Ͽ� �̱����� ���ϴ� ����� �̱�, �������� ���ϴ� ����� ����, ĳ���ٿ��� ���ϴ� ����� ĳ���ٶ�� ����Ͻÿ�
--����� ���, �̸�, �μ��̸�, �ٹ�����

select  e.employee_id, e.first_name, department_name,
    decode(lower(l.country_id),'us','�̱�','uk','����','ĳ����') "�ٹ�����" 
from employees e, departments d, locations l
where e.department_id = d.department_id and d.location_id = l.location_id;

--������ �μ� ��� �� ���� ���� �����װ� ���� ���� �������� ���Ͻÿ�.
--���̺��̸� : �μ��̸�, �ְ���, ��������
select max(salary) �ְ���, min(salary) ��������
from employees
where department_id = 20;




--��å ���̵� 'SA_REP'�� �����
--���, �̸� ��å�̸�, �μ��̸�
--��, �μ��� ���� ��� '���߷�'���� ���
select e.employee_id, e.first_name, e.job_id, 
    case when e.department_id = 0
        then d.department_name 
        else d.department_name  '���߷�'
        end "�μ��̸�"
from employees e, departments d, jobs j
where nvl(e.department_id,0) = nvl(d.department_id,0)
and e.job_id = j.job_id
and lower(e.job_id) = lower('SA_REP');

select *
from departments;