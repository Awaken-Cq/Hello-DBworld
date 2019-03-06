--ddl �ڷ� ���� ��� [Data Definition Language]

-- ȸ��(�ʼ��Է»���) member
-- �̸�                      name             varchar2(30)
-- ���̵�                   id                  varchar2(16)
-- ��й�ȣ                pass               varchar2(16)
-- ����                      age                number(3)
-- �̸��Ͼ��̵�          email_id          varchar2(30)
-- �̸��ϵ�����(@~)   email_domain  varchar2(30)
-- ������                   join_date          date



-- ȸ�� ������(�����Է»���) member_detail
-- ���̵�(for join)       id                   varchar2(30)
-- �����ȣ                zipcode           varchar2(5)
-- �Ϲ��ּ�                address           varchar2(100)
-- ���ּ�                address_detail   varchar2(100)
-- ��ȭ��ȣ1(010)        tel1                 varchar2(3)
-- ��ȭ��ȣ2(2702)       tel2                varchar2(4)
-- ��ȭ��ȣ3(6429)       tel3                varchar2(4)

drop table member;

drop table member_detail;

create table member
(
    name varchar2(30) not null, 
    id varchar2(16), 
    pass varchar2(16) not null, 
    age number(3) check (age < 150), 
    email_id varchar2(30),
    email_domain varchar2(30),
    join_date date default sysdate,
    constraint member_id_pk primary key(id)
);

create table member_detail
(
    id varchar2(30), 
    zipcode varchar2(5), 
    address varchar2(100),
    address_detail varchar2(100),
    tel1 varchar2(3),
    tel2 varchar2(4),
    tel3 varchar2(4),
    constraint member_detail_id_fk foreign key(id) references member (id)
);

create table emp_all
as
select * from employees;

create table emp_blank
as
select * from employees
where 1 = 0;

drop table emp_blank;

select *
from emp_all;

select *
from emp_blank;

create table emp_50
as
select e.employee_id eid, e.first_name name, e.salary sal, d.department_name dname
from employees e, departments d
where e.department_id = d.department_id and e.department_id = 50;

select *
from emp_50;


-----------------------------------------------DML ������ ���� ���(Data manipulation language)
-- insert
insert into member
values ('����Ź', 'njtak2514', '1234', '28', 'njtak2514', 'gmail.com' , sysdate);

--�ۼ������� ����� ���� ������ �����͸� ����Ͽ� �ۼ�
insert into member(name, id, pass, age, email_id, email_domain, join_date)  
values ('�ں���', 'boyoung', '1234', '30', 'boyoung90', 'gmail.com' , sysdate);

insert into member_detail(tel1, tel2, tel3, address, address_detail, zipcode, id)
values('010', '2702', '6429', '���� ���빮�� õȣ��� 47�� 62 �Ŵ�泲����Ʈ', '1007ȣ', '02534', 'njtak2514');

insert into member
values ('�ں���', 'boyoung', '1234', '30', 'boyoung90', 'gmail.com' , sysdate);

--�ۼ����� ���� �κ��� null�� ä����
insert into member(name, id, pass, join_date) 
values ('����', 'gongyu', '1234', sysdate);

--not enough values : �߰��� �÷��� �����Ͱ� 1:1��Ī�� �ȵȴ�.
insert into member(name, id, pass, age, email_id, email_domain, join_date)  
values ('�ں���', 'boyoung', '1234', sysdate);

--KITRI.MEMBER_ID_PK : PK�� �� �����κ��� ���Ἲ ��������(�ߺ�����)�� ���� ���̴�.��� ����
insert into member(name, id, pass, join_date) 
values ('�ں���', 'boyoung', '1234', sysdate);

--KITRI.MEMBER_DETAIL_ID_FK : FK�� �� ������ ���� ������ �����Ͱ� ����(id)
insert into member_detail(tel1, tel2, tel3, address, address_detail, zipcode, id)
values('010', '2702', '6429', '���� ���빮�� õȣ��� 47�� 62 �Ŵ�泲����Ʈ', '1007ȣ', '02534', 'njtak'); 


--insert all
--�ϳ��� insert������ ���� ���̺� insert�� �� �� �ִ�.
insert into member(id, name, pass, age, email_id, email_domain, join_date)  
values ('oracle', '����Ŭ', 'a12345678', '30', 'oracle', 'oracle.com' , sysdate);

insert into member_detail(id, tel1, tel2, tel3, address, address_detail, zipcode )
values('oracle', '010', '1234', '5678', '���� ���빮�� õȣ��� 47�� 70 ���ƾ���Ʈ', '105ȣ', '02534');

--error : missing SELECT keyword
insert all
    into member(id, name, pass, age, email_id, email_domain, join_date)  
    values ('oracle', '����Ŭ', 'a12345678', '30', 'oracle', 'oracle.com' , sysdate)
   into member_detail(id, tel1, tel2, tel3, address, address_detail, zipcode )
    values('oracle', '010', '1234', '5678', '���� ���빮�� õȣ��� 47�� 70 ���ƾ���Ʈ', '105ȣ', '02534');
    
--right query
insert all
    into member(id, name, pass, age, email_id, email_domain, join_date)  
    values ('oracle', '����Ŭ', 'a12345678', '30', 'oracle', 'oracle.com' , sysdate)
   into member_detail(id, tel1, tel2, tel3, address, address_detail, zipcode )
    values('oracle', '010', '1234', '5678', '���� ���빮�� õȣ��� 47�� 70 ���ƾ���Ʈ', '105ȣ', '02534')
select * from dual;


select *
from member m, member_detail ed
where m.id = ed.id; 




-- update


-- delete


-- merge


------------------------------------------------------------------------------------
-------��ǰ���� goods_detail
--
--��ǰ�ڵ� p_code varchar2(10) not null
--��ǰ�̸� p_name varchar2(10) not null
--��ǰ���� p_color varchar2(10)
--��ǰ�԰� p_type varchar2(6)
--������    d_date date

-------��� stock management
--��ǰ�ڵ� p_code varchar2(10) not null
--��ǰ�̸� p_name varchar2(10) not null
--��ǰ�԰� p_typel varchar2(6) not null
--��ǰ���� p_quantity number(4)
--�ҷ�ǰ ���� dp_quantity number(4)
--�Ǹż��� q_sold   number(4)
--�ֱ� ������ ro_date    date sysdate
--���� ������ order_date date sysdate

drop table stock_management;
create table stock_management
(
p_code varchar2(10) not null,
p_name varchar2(10) not null,
p_typel varchar2(6),
p_quantity number(4),
dp_quantity number(4),
q_sold   number(4),
ro_date    date default sysdate,
order_date date default sysdate,
constraint sm_p_code_fk foreign key(p_code) references product_detail(p_code)
);

drop table product_detail;
create table product_detail
(
p_code varchar2(10) not null,
p_name varchar2(10) not null,
p_color varchar2(10),
p_type varchar2(6),
d_date date default sysdate,
constraint pd_p_code_pk primary key (p_code)
);




insert all
into product ;
