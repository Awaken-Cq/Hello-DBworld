-- ����� ���, �̸�, �޿�, Ŀ�̼����Ա޿�
-- Ŀ�̼� ���� �޿��� 100�� �ڸ����� ǥ��(�ݿø�)

select employee_id, first_name, salary, commission_pct, round(salary * (1 + nvl(commission_pct,0)),-2)
from employees;

--- �����Լ�

select 'kiTri', lower('nOH, jEongtAK'), upper('nOH, jEongtAK'), initcap('nOH, jEongtAK'), length('nOH, jEongtAK')
from dual;

-- full name
select employee_id, first_name, last_name, first_name || ' ' || last_name fullname,
concat(first_name, concat(' ', last_name))
from employees;

select employee_id, first_name, last_name, first_name || ' ' || last_name fullname,
concat('�ȳ��ϼ���', concat('����', first_name))
from employees;

select 'hello oracle !!!', substr('hello oracle !!!', 3, 5),'hello oracle !!!', substr('hello oracle !!!', 3,5)
from dual;

select instr('hello oracle!!!', 'o'), instr('hello oracle!!!o', 'o', 3, 4)
from dual;

select instr('010-2702-6429-','-', 10)
from dual;

--'123-456'
select '123-456' zipcode, substr('123-456', 1, 3) zip1, substr('123-456', 5, 3) zip2
from dual;
--'1234-56'
--'123-456'
--select '1234-56' zipcode, substr('1234-56', 1', instr('1234-56','-')-1) zip1, substr('1234-56', instr('1234-56','-')+1) zip2,
--'123-456' zipcode, substr('123-456', 1, instr('123-456','-')-1) zip1, substr('123-456', instr('123-456','-')+1) zip2
--from dual;

--��¥ �Լ�
select sysdate, sysdate +3, sysdate-3, to_char(sysdate+3/24,'yy/mm/dd hh24:mi:ss')
from dual;

select sysdate, months_between(sysdate, sysdate ), next_day(sysdate,1),
add_months(sysdate,2), last_day(sysdate)
from dual;

select sysdate, to_char(sysdate, 'yyyy-yy-mm-mon-month-w-ww-d-dd-ddd-dy-day')
from dual;

select sysdate, to_char(sysdate,  'pm-hh-hh24-mi-ss')
from dual;

--���� �������� �ÿ��� �ݿø�
select to_char(sysdate, 'yyyy.mm.dd. hh24:mi:ss'),
to_char(round(sysdate, 'dd'), 'yyyy.mm.dd. hh24:mi:ss') "����", 
to_char(round(sysdate, 'mm'), 'yyyy.mm.dd. hh24:mi:ss'),
to_char(round(sysdate, 'yy'), 'yyyy.mm.dd. hh24:mi:ss'),
to_char(round(sysdate, 'hh'), 'yyyy.mm.dd. hh24:mi:ss'),
to_char(round(sysdate, 'mi'), 'yyyy.mm.dd. hh24:mi:ss')
from dual
union
select to_char(sysdate, 'yyyy.mm.dd. hh24:mi:ss') ,
to_char(trunc(sysdate, 'dd'), 'yyyy.mm.dd. hh24:mi:ss'), 
to_char(trunc(sysdate, 'mm'), 'yyyy.mm.dd. hh24:mi:ss'),
to_char(trunc(sysdate, 'yy'), 'yyyy.mm.dd. hh24:mi:ss'),
to_char(trunc(sysdate, 'hh'), 'yyyy.mm.dd. hh24:mi:ss'),
to_char(trunc(sysdate, 'mi'), 'yyyy.mm.dd. hh24:mi:ss')
from dual
order by ���� desc;

--��ȯ �Լ�
select 'a', 3, '3', 3+5, '3' + 5
from dual;

select 1123456.789,
to_char(1123456.789, '000,000,000.00'),
to_char(1123456.789, '999,999,999.99'), --���� �ڸ��� ������ ������, �� ���������� '����'���� ä��������.(���°� �ƴ�)


'123,456.98', to_number('123,456.98', '000,000.00') + 3  --  ����ȯ ������ �ڸ����� ��ȣ�� �����ִ°� ����
from dual;

select sysdate, to_char(sysdate,'yy.mm.dd'),
to_char(sysdate,'am hh:mi:ss'),
to_char(sysdate,'hh24:mi:ss')
from dual;

--20190225142154 >> ��¥ >> 3�� ��
select to_char(to_date(to_char(20190225142154, '99999999999999'),'yyyy.mm.dd hh24:mi:ss')+3,'yyyy.mm.dd hh24:mi:ss'),
to_char(to_date(to_char(20190225142154, '99999999999999'),'yyyy.mmddhh24miss')+3,'yyyy.mm.dd hh24:mi:ss') 
from dual;

--�Ϲ��Լ�
select commission_pct, nvl(commission_pct,0), nvl2(commission_pct,5,2)
from employees;

--���� ���
--�޿��� 4000 �̸��� ����� ������
--          10000 �̸���          ��տ���
--          10000 �̻���          ����
--����� ���, �̸�, �޿�, �������
select employee_id, concat(first_name, last_name), salary,
    case when salary < 4000
    then '������'
    when salary < 10000
    then '��տ���'
    else '����'
    end �������
from employees
order by salary desc;

--���, �̸�, �Ի���, �������
--1980�⵵ �Ի� �ӿ�
--   90�⵵ �Ի� ����
--2000�⵵ �Ի� ���Ի��
select employee_id, concat(first_name,last_name), hire_date,
    case when hire_date < to_date('1990.01.01','yyyy.mm.dd')
        then '�ӿ�'
        when hire_date < to_date('2000.01.01','yyyy.mm.dd')
        then '����'
        else '���Ի��'
    end "�������"
from employees
order by hire_date asc;

select employee_id, concat(first_name,last_name), hire_date,
    case when to_number(to_char(hire_date, 'yyyy'), '0000') < 1990
        then '�ӿ�'
        when to_number(to_char(hire_date, 'yyyy'), '0000') < 2000
        then '����'
        else '���Ի��'
    end "�������"
from employees
order by hire_date asc;

select employee_id, concat(first_name,last_name), hire_date,
    case when to_char(trunc(hire_date, 'yyyy'),'yyyy') < 1990
        then '�ӿ�'
        when to_char(trunc(hire_date, 'yyyy'),'yyyy') < 2000
        then '����'
        else '���Ի��'
    end "�������"
from employees
order by hire_date asc;
--
select ascii('0'), ascii('A'), ascii('a')
from dual;