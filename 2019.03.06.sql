select *
from tab;

purge recyclebin;  --�����뿡 �ִ� ���� �����

select *
from emp_blank;

insert into emp_blank
select *
from employees
where department_id = 80;

--100�� ����� ���, �̸�, ��å, �μ���ȣ
--emp_blank ����

insert into emp_blank (employee_id, first_name, job_id, department_id, last_name, hire_date, email)
select employee_id,last_name, job_id, department_id, first_name , hire_date, email
from employees
where employee_id = 100;


commit;
rollback;
-- update
--oracle2�� ����� 9876���� ����
update member
set pass = '9875'
where id = 'oracle2';

--oracle2�� ����� 1234, ���̸� 25�� ����
update member
set pass = '1234', age = 25
where id = 'oracle2';

--oracle2�� ����� 5678, ���̸� ���̵� oracle�� ����� ���� ����
update member
set pass = '5678', age = (select age from member where id = 'oracle')
where id = 'oracle2';

update member
set pass = '5678'
where id = (select id from member_detail where address like '%���빮��%');


commit;
rollback;

--delete
delete member_detail
where id = 'oracle2';

delete member
where id = 'oracle2';

select *
from member;
select *
from member_detail;

--merge 
--merge�� �̿��ϸ� ������

drop table product;

create table product
(
pid number,
pname varchar2(10),
cnt number,
price number,
constraint product_pid_pk primary key (pid)
);

insert into product(pid, pname, cnt, price)
values (100,'�����',100,1500);
insert into product(pid, pname, cnt, price)
values (200,'����Ĩ',80,2700);
insert into product(pid, pname, cnt, price)
values (300,'������',120,1000);

select *
from product;

--��ǰ�ڵ尡 400�� �ڰ�ġ(1200��) 150�� �԰�
merge into product
using dual
on (pid = 400)
when matched then
update set cnt = cnt + 150
when not matched then
insert (pid, pname, cnt, price) values (400,'�ڰ�ġ', 150, 1200);


--��ǰ�ڵ尡 100�� �����(1500��) 50�� �԰�
merge into product
using dual
on (pid = 100)
when matched then
update set cnt = cnt + 50
when not matched then
insert (pid, pname, cnt, price) values (100,'�����', 50, 1500);

commit;
-----------------------------------------------------------------------------------
select *
from product;

update product
set cnt = 800
where pid = 100;

rollback;
commit;

insert into product
values (101, '������', 150, 1500);

insert into product
values (102, '���ڱ�', 250, 1500);

insert into product
values (103, '������', 550, 1500);

savepoint a;

insert into product
values (104, '��ġ��', 58, 1500);

insert into product
values (105, '����', 120, 1500);

savepoint b;

insert into product
values (106, '¥������', 120, 1500);

insert into product
values (107, '�ϱ�����', 220, 1500);

select *
from product;

rollback to b;

-- sequence
create sequence product_seq
start with 1 increment by 1;

create sequence product_ppid_seq
start with 1 increment by 2;

delete product_seq.nextval

commit;
rollback;

insert into product (pid, pname, cnt, price)
values (product_ppid_seq.nextval, '�̸�', 10, 1000);

select product_seq.nextval
from dual;

select *
from product;

delete product;

------------------------------------------------------------------------------------
select *
from product_detail;
select *
from stock_management;


delete product_detail
where p_code != 101;
insert all 
into product_detail values (PD_P_CODE_SEQ.nextval,'��','white','����',to_date('2015.03.06','yyyy.mm.dd'));
into product_detail values (124,'������','blue','����',to_date('2015.03.06','yyyy.mm.dd'))
into product_detail values (121,'������','white','����',to_date('2015.03.06','yyyy.mm.dd'))
into product_detail values (122,'����','pink','����',to_date('2015.03.06','yyyy.mm.dd'))
into product_detail values (120,'�����','white','����',to_date('2015.03.06','yyyy.mm.dd'))
into product_detail values (125,'�޹���','red','����',to_date('2015.03.06','yyyy.mm.dd'))
into stock_management values(125,'�޹���','����',200,20,150,to_date('2019.01.01','yy.mm.dd'), sysdate)
select *
from dual;


select *
from stock_management;

delete stock_management;

insert all
into stock_management
values (101,'��','ani',100,20,500,sysdate,to_date('2015.03.06','yyyy.mm.dd'))
into stock_management
values (105,'����','ani',100,20,500,sysdate,to_date('2015.03.06','yyyy.mm.dd'))
into stock_management
values (104,'������','ani',100,20,500,sysdate,to_date('2015.03.06','yyyy.mm.dd'))
into stock_management
values (106,'�����','ani',100,20,500,sysdate,to_date('2015.03.06','yyyy.mm.dd'))
into stock_management
values (103,'������','ani',100,20,500,sysdate,to_date('2015.03.06','yyyy.mm.dd'))
into stock_management
values (107,'�޹���','ani',100,20,500,sysdate,to_date('2015.03.06','yyyy.mm.dd'))
select *
from dual;

create sequence pd_p_code_seq
start with 100 increment by 1;

savepoint a;

update stock_management
set ro_date = to_date('2019.02.01','yyyy.mm.dd')
where p_code = 101;

merge into product_detail
using dual
on (p_code = 108)
when matched then
update set d_date = sysdate
when not matched then
insert values (PD_P_CODE_SEQ.nextval,'��','brown','ani',sysdate);


pd_p_code_seq.nextval




------------------------------------����
--1 ����
�ΰ��� �۾��� �� �� ���°�?

merge into product_detail
using dual
on (p_code = 110)
when matched then
update set d_date = sysdate
when not matched then
insert values (PD_P_CODE_SEQ.nextval, '�ϸ�' , 'gray' , '����' , sysdate) 
and insert into stock_management values (110, '�ϸ�', 'ani', '100','0','0', sysdate, sysdate);

