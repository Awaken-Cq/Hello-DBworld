--��� ����� ���, �̸�, �޿�, �޿����
select e.employee_id, e.first_name, e.salary, jg.grade_level
from employees e, job_grades jg
where e.salary between jg.lowest_sal and jg.highest_sal;

--��� ����� ���, �̸�, �μ���ȣ, �μ��̸�
select e.employee_id, e.first_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id; 

--e department_id �� ����Ű �׷��� ������ null�� ���� �� ������ d.department �� �ִ� ���� ������ �� �ִ�.
--d.department_id �� ����Ű �׷��� ������ null�� ���� �� ����.

--outter join
--��� ����� ���, �̸�, �μ���ȣ, �μ��̸�
--��, �μ��� �������� ��� �μ��̸��� '���߷���'
select e.employee_id, e.first_name, e.department_id, nvl(d.department_name,'���߷���')
from employees e, departments d
where e.department_id = d.department_id(+);

--��� ����� ���, �̸�, ������, ����̸�.
--��, ����� ���� ��� ����̸��� '����' ���� ���.
select e.employee_id, e.first_name, em.employee_id, nvl(em.first_name,'����')
from employees e, employees em
where e.manager_id = em.employee_id(+);

--��� ����� ���, �̸�, ������, ����̸�, �μ��̸�
--��, ����� ���� ��� ����̸��� '����' ���� ���.
--��, �μ��� �������� ��� �μ��̸��� '���߷���'���� ���
select e.employee_id, e.first_name, em.employee_id, nvl(em.first_name,'����'),nvl(d.department_name,'���߷���')
from employees e, departments d, employees em
where e.manager_id = em.employee_id(+) and e.department_id = d.department_id(+);

select *
from employees;


---------------------------------------------------------------------------------------------------------
--ansi join(ǥ��) ��� �����ͺ��̽����� ���� �ִ�.
equi, non-equi, self, outer join ���� ����Ŭ������ �� �� �ִ�.

--īŸ�þ� ���δ�Ʈ = cross join
select * from employees cross join departments;
= select * from employees, departments;

--���, �̸�, �μ��̸� 
select e.employee_id, e.first_name, d.department_name
from employees e, departments d
where e.department_id = d.department_id;
--inner join
--50�� �μ��� ���, �̸�, �μ��̸� join on
select e.employee_id, e.first_name, d.department_name
from employees e inner join departments d
on e.department_id = d.department_id
where e.department_id = 50;
--50�� �μ��� ���, �̸�, �μ��̸� join using
select e.employee_id, e.first_name, d.department_name
from employees e  join departments d
using (department_id)
where department_id = 50;

select e.employee_id, e.first_name, d.department_name
from employees e natural join departments d
where department_id = 50;

-- 'Seattle' �� �ٹ��ϴ� ���, �̸�, �μ��̸�, ����
select e.employee_id, e.first_name, d.department_name, l.city
from employees e, departments d, locations l
where e.department_id = d.department_id
and d.location_id = l.location_id
and city = 'Seattle';

select e.employee_id, e.first_name, d.department_name, l.city
from employees e join departments d on e.department_id = d.department_id
                          join locations l on d.location_id = l.location_id
where city = 'Seattle';

---outer join
--��� ����� ���, �̸�, �μ���ȣ, �μ��̸�('���߷���')
select e.employee_id, e.first_name, e.department_id, nvl(d.department_name,'���߷���')
from employees e, departments d
where e.department_id = d.department_id(+);

--��� �μ��� �ٹ��ϴ�, ����� ���, �̸�(�������), �μ���ȣ. �μ��̸�
select e.employee_id, nvl(e.first_name,'�������'), d.department_id, d.department_name
from employees e, departments d
where e.department_id(+) = d.department_id;

--outer -> ansi (���� ���̺��� � ������ ���, ���ǿ� ���������ʴ� ���̺��� �ִ� ���� ��� ���̺��ΰ�?)
--��� ����� ���, �̸�, �μ���ȣ, �μ��̸�('���߷���')
select e.employee_id, e.first_name, e.department_id, nvl(d.department_name,'���߷���')
from employees e left outer join departments d
on e.department_id = d.department_id;

--��� �μ��� �ٹ��ϴ�, ����� ���, �̸�(�������), �μ���ȣ. �μ��̸�
select e.employee_id, nvl(e.first_name,'�������'), d.department_id, d.department_name
from employees e right outer join departments d
on e.department_id = d.department_id;

--��� �μ��� ����� ���, �̸�(�̸�����), �μ���ȣ, �μ��̸�('���߷���')
select e.employee_id, nvl(e.first_name,'�������'), d.department_id, nvl(d.department_name,'���߷���')
from employees e full outer join departments d
on e.department_id = d.department_id;
