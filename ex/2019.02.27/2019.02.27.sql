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






