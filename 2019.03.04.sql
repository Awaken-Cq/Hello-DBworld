union ������(�ߺ��Ǵ� ���� ����)
union all ������(�ߺ��Ǵ� ���� ����)

---

select *
from employees;

--�μ���ȣ�� 50�̰ų� 90�� �����
--�޿��� 5000 �̻��� ����� ���, �̸�, �μ���ȣ
--���, �̸�, �޿�, �μ���ȣ
select employee_id, first_name, salary, department_id
from employees
where department_id in (50, 90)
union
select employee_id, first_name, salary, department_id
from employees
where salary >= 10000;

select employee_id, first_name, salary, department_id
from employees
where department_id in (50, 90)
union all
select employee_id, first_name, salary, department_id
from employees
where salary >= 10000;

select employee_id, first_name, salary, department_id
from employees
where department_id in (50, 90)
intersect
select employee_id, first_name, salary, department_id
from employees
where salary >= 10000;

select employee_id, first_name, salary, department_id
from employees
where department_id in (50, 90)
minus
select employee_id, first_name, salary, department_id
from employees
where salary >= 10000;


select employee_id, first_name, salary, department_id
from employees
where salary >= 10000
minus
select employee_id, first_name, salary, department_id
from employees
where department_id in (50, 90);


--group by
--�μ��� ����, ��ձ޿�, �����, �ִ�޿�, �ּұ޿�

select department_id, sum(salary), avg(salary), count(employee_id), max(salary), min(salary)
from employees
group by department_id;

--�μ��� ����, ��ձ޿�, �����, �ִ�޿�, �ּұ޿�
--��� �޿��� 5000������ �μ�
select department_id, sum(salary), avg(salary) , count(employee_id), max(salary), min(salary)
from employees
group by department_id
having avg(salary) <= 5000;

select department_id, employee_id, sum(salary), avg(salary), count(employee_id), max(salary), min(salary)
from employees
group by department_id;

--�� �μ����� ��� �޿����� ���� �޴� �����
--���, �̸�, �޿�
select employee_id, first_name, salary
from employees
where salary > all(select avg(salary)
                         from employees
                         group by department_id);

--�μ��� �ְ�޿��� �޴� �����
--�μ��̸�, ���, �̸�, �޿�
--�μ����� ������ �� �μ��� �ְ� �޿��� �޴� ����� ���϶�.
select d.department_name, e.employee_id, e.first_name, e.salary 
from employees e, departments d
where e.department_id = d.department_id and 
salary in (select max(salary)
            from employees
            group by department_id);


select d.department_name, e.employee_id, e.salary
from employees e, (select department_id, max(salary) msal
                            from employees
                            group by department_id) m,
                        departments d
where e.department_id = m.department_id and e.salary = m.msal
and e.department_id = d.department_id;

select rownum, employee_id, salary
from employees
where rownum <= 10
order by rownum desc;

-- TOP N Query
--���, �̸�, �޿�, �Ի���, �μ��̸�
--�޿��� ����
-- �� �������� 5�� ���.
--2pages ���. (&page)
--1980���, 1990���, 2000���.
select e.employee_id, e.first_name, e.salary,
        case when to_char(hire_date,'yyyy') like '198%'
                then '1980���'
                when to_char(hire_date,'yyyy') like '199%'
                then '1990���'
                else '2000���'
                end �Ի���
                , d.department_name
from employees e, departments d
where e.department_id = d.department_id(+) and 
rownum between  and (&page*5) p
order by salary desc;

--�ش�!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
select rownum,employee_id, first_name, salary
from employees
order by salary desc;   --  �������̰� ����Ʈ���� ���߿� ����Ǳ⶧���� �޿������� �ϸ� rownum�� ���׹����̵�.

--�� ���̺� �����.
--�ο츦 �ٿ��� ���̺��� �����. ���� <= 10
--���� �ο찡 �ƴϰ� �ȰͿ� >5 ������ ����

--rownum�� ���������� ǥ���� �� ����.

select rownum, a.*
from (select employee_id, first_name, salary
from employees
order by salary desc) a;


select rownum, a.*
from (select employee_id, first_name, salary
from employees
order by salary desc) a
where rownum <= 10;

select b.m ranking, b.employee_id, b.first_name, b.salary,
                case when to_char(hire_date,'yyyy') like '198%'
                                then '1980���'
                                when to_char(hire_date,'yyyy') like '199%'
                                then '1990���'
                                else '2000���'
                                end �Ի���
                                , d.department_name
from (select rownum m, a.*
         from (select employee_id, first_name, hire_date, salary, department_id
                    from employees
                    order by salary desc) a
where rownum <= &page *5 ) b, departments d
where b.department_id = d.department_id(+) 
and b.m > &page * 5 - 5
order by ranking;

--rank() over()

--rownum�� �Ϲ� �÷����� �ٲٴ�?
--select ���� ������ �ٲٱ����� ������ �ϰ� ������ �Űܶ�;
