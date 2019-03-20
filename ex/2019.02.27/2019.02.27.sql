--3��.

--��� ����鿡�� ������ ��Ʈ�� ����Ϸ��Ѵ�.
--ansi join�� �̿��Ͽ�������� ������ ���� �����ȣ�� �˾Ƴ��ÿ�.
--��� ������� ���, �̸�, �μ� �̸�, �����ȣ

select e.employee_id, e.first_name, d.department_name, l.postal_code
from employees e left outer join departments d using(department_id)
 left outer join locations l using(location_id);
 
 
--������ ����� �Ͱ� �ٸ� ������ ansi join�� �̿��Ͽ�
--��� ������� ���, �̸�, �μ� �̸�, �����ȣ
--�μ��� ���� ���� ��� '���߷���', �����ȣ�� ������� '���ü���' ���� ǥ���Ѵ�.
select e.employee_id, e.first_name,nvl(d.department_name,'���߷���'), nvl(l.postal_code,'���ü���')
from employees e left outer join departments d
on e.department_id = d.department_id
left outer join locations l on d.location_id = l.location_id;

--inner join ����Ұ�, �Ŵ������̵� 100���� ����� ���, �̸�, �μ��̸�
select  e.employee_id, e.first_name, d.department_name, e.manager_id
from employees e join departments d
using (department_id)
where e.manager_id = 100;

--inner join ����Ұ�, Washington �ֿ� ��ġ�� �μ��� �μ���ȣ�� �μ��̸�
select d.department_id , d.department_name
from departments d join locations l
using(location_id)
where lower(l.state_province) = 'washington';

--ANSI ������ ����Ͽ� 'accounting' �μ� �Ҽ� ����� �̸��� �Ի����� ����ϼ���.
--��, �Ի����� �⵵�� ǥ�� �Ͻÿ�.    
select e.first_name, e.hire_date
from employees e join departments d
using (department_id)
where lower(d.department_name) = 'accounting';




--��� �μ��� �ٹ��ϴ� ����� �̸�, ��å�̸�, �μ��̸�
-- ��, �μ��� �������� ���, �μ��̸��� '������'���� ���
-- ��� : 20��
select e.employee_id, e.job_id, nvl(d.department_name,'������')
from employees e left outer join departments d
using(department_id);

--��� ����� ���, �̸�, ��� �� �����å�̸�
-- ��, ����� ���� ����� ���, �����å�̸��� '��� ����'���� ���
-- ��� : 23��





--��� ������ �̸�, ����, ��å�̸�, ���� ����
--��, ������ ���� ������ �����϶�


-- ���� ������ �ִ� ����� �̸�(���� ������ '�������') "�λ��̵�", ��������̸� "����" (�̸�������)