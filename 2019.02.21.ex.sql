--11
select  job_title, (min_salary + max_salary) / 2 "��ձ޿�"
from jobs;

--12 
select email || ' / ' || phone_number "ȸ��"
from employees;

--13

select *
from ;

--14 
select employee_id ,first_name, last_name, salary, nvl(commission_pct,0)
from employees;

--15
select first_name || last_name || '�� ��ȭ��ȣ�� ' || phone_number || '�Դϴ�.'
from employees;

--16
select job_title || '�� ��� �Ա��� ' || (min_salary + max_salary) /2 || '�Դϴ�.' "������ ��� �޿�"
from jobs;

--17
select '������Ʈ ���� �Ⱓ�� ' || start_date || ' ~ ' || end_date || '�Դϴ�.'
from job_history;

--18
select department_name || '�� ������ ��ȣ�� ' || manager_id || '�Դϴ�.'
from departments;

--19
select '�μ���ȣ�� ' || department_id || '�� �μ��� �̸��� ' || department_name || '�Դϴ�.'
from departments;

--20
select '��� ��ȣ ' || employee_id || '�� ' || start_date || '������ ������Ʈ�� �����߽��ϴ�.'
from job_history;


--21
select employee_id "���ο� ������ ��¥", nvl(department_id,80) "department_id"
from employees;

--22
--��ġ�ϰ� �� ���� ? 174 Ellen Abel

--23
select job_title, min_salary, max_salary, (min_salary+max_salary)/2 " ��� �޿�"
from jobs;

--24
select street_address || ', ' || city || ', ' || country_id "�ּ�"
from locations;

--25
select '�μ���ȣ�� ' || department_id || '�� ����� Ŀ�̼����Ա޿��� ' || salary * (1+nvl(commission_pct,0)) || '�̴�.'
from employees;

--26
select first_name || ' ' || last_name || '�� ����ȣ��  ' || phone_number || '�̰� �̸�����' || email || '�̴�.'
from employees;

--27
select job_title || '�� ���� �� �ִ� ���� �ݾ��� ' || min_salary || '���̸�, �ְ�ݾ��� ' || max_salary || '���Դϴ�. �׸��� �� �ݾ��� ���̴� ' || (max_salary-min_salary) || '�� �Դϴ�.'
from jobs;

--28 pass

--29 pass

--30 pass

--31 ���� "�ͽ��� �þ�Ʋ�� ��ġ�� ������ �����ȣ�� 98199�̴�." (post code)
select state_province || ' ' || city || '�� ��ġ�� ������ �����ȣ�� ' || postal_code || '�̴�.' "post code"
from locations;

--32 �̸�(Ǯ����)�� �޿��� 10% �λ�Ǿ� ??�̴�.(�޿��λ�)
select first_name || ' ' || last_name || '�� �޿��� 10% �λ�Ǿ� ' || salary * 1.1 || '�̴�.' "�޿��λ�"
from employees;
--33  **(�̸�)�� �����ּҴ�**�̰� �ڵ�����ȣ��**�̴�.  ������ ���� ����ϱ� column�̸��� ����ó
select first_name || ' ' || last_name || '�� �����ּҴ� ' || email || '�̰� �ڵ�����ȣ�� ' || phone_number || '�̴�.'
from employees;
--34 **(����) **(����)�� **(����)�� **(�ּ�)�� �����ȣ�� **�̴�. ������ ���� ����ϱ� column�̸��� �����ȣ
select country_id || ' ' || state_province || ' ' || city || ' ' || street_address || '�� �����ȣ�� ' || postal_code || '�̴�.'
from locations;
--35  ** ������� �޿��� ** �Դϴ�.  ��Ī = �޿� ����
select first_name || ' ' || last_name || '������� �޿��� ' || salary || '�Դϴ�.' "�޿� ����"
from employees;
--36 �����ȣ�� ??�� ����� ��å�� ??�̸� �Ի����� ??, ������� ??�Դϴ�. ��Ī = ������� ����
select '�����ȣ�� ' || employee_id || '�� ����� ��å�� ' || job_id || '�̸� �Ի����� ' || start_date || ', ������� ' || end_date || '�Դϴ�.' "������� ����"
from job_history;
--37 "000 ��� - �̸��� : 000@gamil.com / ��ȭ��ȣ : ***.***.****" �������� ����ϼ��� (�̸��� '�̸� ��' ����)
select first_name || ' ' || last_name || '��� - �̸��� : ' || email || ' / ��ȭ��ȣ : ' || phone_number
from employees;
--38  "���� �ּ�, ���ø�, ���̸�, ����ID" �������� ����ϼ��� (Column���� '�ּ�')
select street_address || ', ' || city || ', ' || state_province || ', ' || country_id "�ּ�"
from locations;

--41
select first_name || last_name, hire_date, nvl(manager_id,-1)
from employees;

--42 pass

--43~52 pass




select *
from job_history;