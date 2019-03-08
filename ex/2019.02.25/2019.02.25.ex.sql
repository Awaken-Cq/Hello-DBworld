--ex)))))))))))))))))))))))))))))))))))))
--�Ʒ��� ���� ��µǰ� �ڵ带 �ۼ��Ͻÿ�.
--'Ǯ����'�� �μ���ȣ�� �μ��ڵ�� '90''AD'�̴�. 
--�μ��� ����Ҷ��� job_id�� �� �α���(ex)sST,IT,AD)�� ���. ��Ī �μ���ȣ�� �ڵ�

select concat(first_name,last_name) || '�� �μ��ѹ��� �μ��ڵ�� ' || department_id || substr(job_id,1,2) "�μ���ȣ�� �ڵ�"
from employees;


--���,�̸�, job_id, �ٹ���Ȳ(��Ī)
--�̱����� ���ϴ� �μ��� ��� "����ٹ�"
--ĳ���ٿ��� ���ϴ� �μ��� ��� "�İ߱ٹ�" 20
--�������� ���ϴ� �μ��� ��� "�ؿ�����"80
--����, �İ�, �ؿ� ������ ����
select employee_id, first_name, job_id,
    case when department_id = 20
            then '�İ߱ٹ�'
            when department_id = 80
            then '�ؿ�����'
            else '����ٹ�'
        end "�ٹ���Ȳ"
from employees
order by "�ٹ���Ȳ" asc;


-- ���ǿ�


-- �μ���(department_name)�� ������ ���ڸ� �����ϰ� ����϶�.
-- �μ���, ���������ڸ� ������ �μ��� ��� �� ����
select department_name, substr(department_name, 1, length(department_name)-1)
from departments
order by department_name asc;

-- emp���̺��� sal�� 3000�̸� �̸� c���, 3000���� 3900���� B���
-- 4000 �̻��̸� A������� ����� ��Ÿ�����
-- ���, �̸�(Ǯ����), �޿�, ��޺��� ����
select employee_id, concat(first_name,last_name), salary,
 case when salary < 3000
            then 'C���'
            when salary <= 3900
            then 'B���'
            when salary >= 4000
            then 'A���'
            else null
        end "���"
from employees
order by "���" asc;



--�ڱ���


--������� '�̸� ��'(concat�Լ� ���), ����, ����*Ŀ�̼� ��
--(��, Ŀ�̼��� ���� ��� �ϰ������� 5%����, ���� ��� 0���� �ϰ� ������ ��)
select concat(last_name, first_name), salary, nvl(commission_pct,0),
    case when commission_pct is not null
            then salary*1.05
            else salary
        end "����*Ŀ�̼� ��"
from employees;

--Q2. ������� ��ȭ��ȣ�� '.'�� '.'���̿� �ִ� 4�ڸ� ���� ����϶�.
select substr(phone_number, instr(phone_number,'.',1)+1,instr(phone_number,'.',1,2)-instr(phone_number,'.')-1)
from employees;

select *
from employees;

-- ������
--  Q1. �� ����� �̸�, �μ���ȣ, �޿�, �޿��� ������ ����ϱ�
-- ��, ������ ������ ������ Job_Grades ���̺��� �����Ѵ�.
-- ��, ������ �������� �������� �����Ѵ�.
-- ��, ������ ��Ī�� �ش�(�޿��� ����).

select first_name, department_id, salary,
    case when salary between 25000 and 40000
            then 'F'
            when salary between 15000 and 24999
            then 'E'
            when salary between 10000 and 14999
            then 'D'
            when salary between 6000 and 9999
            then 'C'
            when salary between 3000 and 5999
            then 'B'
            else 'A'
        end "�޿��� ����"
from employees
order by "�޿��� ����" asc, salary desc;





--  Q2. ���� A�� 2019��02��20�Ϻ��� 2019��07��16�ϱ��� ����� ��, �� �Ⱓ�� ��ĥ���� ���Ͻÿ�
-- ��, ��¥�� 20190220, 20190716 ������ ���ڷκ��� �����Ѵ�.
-- ��, �ָ��� �����Ѵ�
-- ��, ��Ī�� �����Ⱓ

select to_char(trunc(to_date(to_char(20190716,'00000000'),'yyyy.mm.dd'),'hh'),'ddd')
       - to_char(trunc(to_date(to_char(20190220, '00000000'),'yyyy.mm.dd'),'hh'),'ddd') +1 "�����Ⱓ"
from dual;



--������ 


1. 
--��å�̸�, �ִ�޿�, ������ �ҵ�з��� ����Ͻÿ�.-
--�̶� �ִ�޿��� 10000������ ������ ���ҵ�, 10000�� �ʰ�������20000������ ������ �߰��ҵ�, 20000�� �ʰ��ϴ� ������ ��ҵ����� ���Ͽ� ��å�з��� �����, ��å�̸��� �������� �����Ͻÿ�. �̶�, ��å�̸��� ��� �빮�ڷ� ǥ���Ͻÿ�.

select upper(job_title), max_salary,
    case when max_salary <= 10000
            then '���ҵ�'
            when max_salary <= 20000
            then '�߰��ҵ�'
            else '��ҵ�'
        end "������ �ҵ�з�"
from jobs
order by Job_title asc;


2. 
--���ó�¥�� yymmdd�������� ���ڷ� �ٲ��� ���ڷ� �ٽùٲ� 123456�� ���Ѱ��� ����϶�.

select to_number(to_char(sysdate,'yymmdd'),'999999')+123456
from dual;

--������
1.
--�ý��۽ð����� 144���ĸ� yyyy mm dd day ���·� ��Ÿ���ּ���. ��Ī�� "������"
select to_char(sysdate+144,'yyyy mm dd day') "������"
from dual;
2.
--2019/07/21 �� 2019�⵵�κ��� �� ��° ���ϱ�?
select to_char(to_date('2019.07.21', 'yy.mm.dd'),'ddd')
from dual;

--1��
--1. �Ŵ��� ��ȣ�� 130�̸��� �ʺ�  130�̻� 150���ϴ� �߱� �׿ܴ� ����̴�. ��� �̸� �Ŵ�����ȣ�� ������������ �����϶�.
select employee_id, first_name, manager_id,
    case when manager_id < 130
        then '�ʺ�'
        when manager_id between 130 and 150
        then '�߱�'
        else '���'
    end "�Ŵ������"
from employees;



--2. 48,456,231.20451 + 30000�� ��ȯ�Լ��� �̿��Ͽ� Ǫ�ÿ�

select to_number('48,456,231.20451','99,999,999.99999') +30000
from dual;

--3. ��������
-- �ý��� ���糯¥ ���� �ټӳ� 30�̻� ������, �׿� ����
-- ���, �̸�, ��ȭ��ȣ, �μ�
-- �������� ���� ����
select employee_id, first_name, phone_number, department_id,
    case when to_char(sysdate,'yyyy') - to_char(hire_date,'yyyy') >= 30
    then '������'
    else '����'
    end ��������
from employees;



-- ���� 2 ) Ŀ�̼����Ա޿��� 4000 �̸� �󿩱� 10%
-- Ŀ�̼����Ա޿��� 10000 �̸� �󿩱� 7%
-- Ŀ�̼����Ա޿��� 20000 �̸� �󿩱� 5%
-- Ŀ�̼����Ա޿��� 20000 �̻� �󿩱� 2%
-- ���, �̸�, ��ȭ��ȣ, �μ�, Ŀ�̼����Ա޿�(��Ī : �޿�), �󿩱����Ա޿�(��Ī : �󿩱�)




-- ������ �������� �ٹ������ ���ض� 
--"(����̸�)�� �ٹ������ (00)�� �Դϴ�."�� �������� ����϶� 
--concat�Լ� �̿�



--6. �ٹ����߷�   
--job_id�� IT�� �����ϸ� '�Ǳ����߷�'
--         S           '�������߷�'
-- �� ��                'ȫ�����߷�'

--�����ȣ, �̸�, job_id �ٹ����߷��� ����϶�


--'hello oracle !!!'��  hello HELLO ,oracle ORACLE �� �и����Ѷ�.
SELECT 'hello oracle !!!'
            ,SUBSTR('hello oracle !!!',1,INSTR('hello oracle !!!', ' ')-1)"HELLO"
            ,SUBSTR('hello oracle !!!',INSTR('hello oracle !!!', ' ')+1)"ORACLE"
FROM DUAL;

--����� 140�̸��� �ٺ�
--����� 180�̸��� ��û��
--����� 180�̻��� �˰�
--���, �̸�, ����, �˸�û�̷� ���


--�ӱ��� 3�ڸ�(1000���ڸ�) ���� �ݿø��Ͽ� ǥ���Ͻÿ�
select round(salary,-3)
from employees;
4, 8
------------------------------��� ��ȭ ��ȣ�� .�� -���� �ٲ� ǥ���Ͻÿ�.
select case when length(phone_number) < 16
then
substr(phone_number,1,instr(phone_number,'.')-1) || '-' || 
substr(phone_number,instr(phone_number,'.')+1,instr(phone_number,'.',1,2)-(instr(phone_number,'.')+1)) || '-' ||
substr(phone_number,instr(phone_number,'.',1,2)+1) 

else
substr(phone_number,1,instr(phone_number,'.')-1) || '-' || 
substr(phone_number,instr(phone_number,'.')+1,instr(phone_number,'.',1,2)-(instr(phone_number,'.')+1)) || '-' ||
substr(phone_number,instr(phone_number,'.',1,3))-substr(phone_number,instr(phone_number,'.',1,2)+1) || '-' || substr(phone_number,instr(phone_number,'.',1,3)+1)
end "����"
from employees;


 instr(phone_number, )-(instr(phone_number,'.',1,2)+1))
--���ǹ� 
--case when instr(phone_number,'.',1,3) is null then

--�� ������ ��ġ�� ���ؼ� 0��°�� �����°�
-- instr(phone_number,'.',1,2)+1
select instr(phone_number,'.',1,2)- instr(phone_number,'.',1,3)
from employees;
------------------------------------------------
select case when length(phone_number) > 16
        then 
        
        
        
