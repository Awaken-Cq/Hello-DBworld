1��
1. ������� ���, ��å,  �޿�, �ְ�޿�, �����޿��� ���Ͻÿ� 

select e.employee_id, j.job_title, e.salary, j.max_salary, j.min_salary
from employees e, jobs j
where j.job_id = e.job_id;

2. US�� �����ϴ� ����� ��� ��å�� �����ÿ�

select e.employee_id, j.job_title
from employees e, jobs j, departments d, locations l
where e.job_id = j.job_id and e.department_id = d.department_id and d.location_id = l.location_id and lower(country_id) = 'us';

3. ��� ����� �μ��̸�, ���, �̸�, �Ŵ������, �Ŵ����̸� (case �� ���)

select d.department_name, e.employee_id, e.first_name,  e.manager_id,
    case when e.manager_id = m.employee_id
        then m.first_name
        end "�Ŵ����̸�"
from departments d, employees e, employees m
where e.department_id = d.department_id and e.manager_id = m.employee_id;

4. ��� ������ ���, �̸�, �μ��̸�, ��å�̸�, �μ��� (������ �μ����� ��� null ǥ�ô� ����)
select e.employee_id, e.first_name, d.department_name, j.job_title,
     case when d.manager_id = e.manager_id
            then m.first_name
            else e.First_name
            end "�μ���"
from employees e, departments d, jobs j, employees m
where e.department_id = d.department_id and e.job_id = j.job_id and e.manager_id =m.employee_id;

5. ���, �̸�, �μ���ȣ, �μ��̸�, �з��� �̾ƶ�.
--�з�(decode�̿�)
--�μ���ȣ�� 110�̸� �濵
--          60�̸� ����
--          50�̸� ���
--          �׿� ��Ÿ
select e.employee_id, e.first_name, e.department_id, d.department_name,
decode(e.department_id,110,'�濵',60,'����', 50, '���','��Ÿ')
from employees e, departments d
where e.department_id = d.department_id;

6. ���� ��ȣ, �����̸�, ���, �̸�, �޿�, �ִ�޿�, �ּұ޿��� ���ض�
--pass
select
from 
where;

9.-- ����
-- Marketing �μ�, Shipping ���� ���ϴ� ����� 
--  �μ� �̸�, ��� ���̵�, ����̸�,�� ����ϼ���.

select d.department_name, e.employee_id, e.first_name
from employees e, departments d
where e.department_id = d.department_id and lower(d.department_name) in('marketing', 'shipping');

10. --'southlake'�� �ٹ��ϰ� �ִ� ��� �̸�, �μ��̸�, ����Ż�ڵ�
select e.first_name, d.department_name, l.postal_code
from employees e, departments d, locations l
where e.department_id = d.department_id and d.location_id = l.location_id and lower(city) = 'southlake';

11.--'EUROPE' �� �ٹ��ϰ� �ִ� ����̸�, �μ��̸�,�����̸�
select e.first_name, d.department_name, l.city
from employees e, departments d, locations l, countries c, regions r
where e.department_id = d.department_id 
and d.location_id = l.location_id 
and l.country_id = c.country_id 
and c.region_id = r.region_id
and upper(r.region_name) = 'EUROPE';

4��
1. ������� grade_level �� ���Ͻÿ�.
   ���, �̸�, �޿�, grade_level (������ ���)
   select e.employee_id, e.first_name, e.salary, jg.grade_level
   from employees e, job_grades jg
   where e.salary between jg.lowest_sal and jg.highest_sal;


2. ��å�� ����� ���� �ִ� �����(job_historys �� �̷��� �ִ� ���)�� 
   ���, �̸�, ������å�ڵ�, ������å��, ������å�ڵ�, ������å���� ǥ��
   (���ı����� ���)
select jh.employee_id, e.first_name, jh_job_id, j_job_title, e.job_id, j_job_title
from employees e, job_history jh, jobs j
where e.employee_id = jh.employee_id, j.job_id = jh.job_id;