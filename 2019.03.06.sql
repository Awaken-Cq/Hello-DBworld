select *
from tab;

purge recyclebin;  --휴지통에 있는 파일 지우기

select *
from emp_blank;

insert into emp_blank
select *
from employees
where department_id = 80;

--100번 사원의 사번, 이름, 직책, 부서번호
--emp_blank 삽입

insert into emp_blank (employee_id, first_name, job_id, department_id, last_name, hire_date, email)
select employee_id,last_name, job_id, department_id, first_name , hire_date, email
from employees
where employee_id = 100;


commit;
rollback;
-- update
--oracle2의 비번을 9876으로 변경
update member
set pass = '9875'
where id = 'oracle2';

--oracle2의 비번을 1234, 나이를 25로 변경
update member
set pass = '1234', age = 25
where id = 'oracle2';

--oracle2의 비번을 5678, 나이를 아이디가 oracle인 사람과 같게 변경
update member
set pass = '5678', age = (select age from member where id = 'oracle')
where id = 'oracle2';

update member
set pass = '5678'
where id = (select id from member_detail where address like '%동대문구%');


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
--merge를 이용하면 좋은점

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
values (100,'새우깡',100,1500);
insert into product(pid, pname, cnt, price)
values (200,'꼬북칩',80,2700);
insert into product(pid, pname, cnt, price)
values (300,'빼빼로',120,1000);

select *
from product;

--상품코드가 400인 자갈치(1200원) 150개 입고
merge into product
using dual
on (pid = 400)
when matched then
update set cnt = cnt + 150
when not matched then
insert (pid, pname, cnt, price) values (400,'자갈치', 150, 1200);


--상품코드가 100인 새우깡(1500원) 50개 입고
merge into product
using dual
on (pid = 100)
when matched then
update set cnt = cnt + 50
when not matched then
insert (pid, pname, cnt, price) values (100,'새우깡', 50, 1500);

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
values (101, '고구마깡', 150, 1500);

insert into product
values (102, '감자깡', 250, 1500);

insert into product
values (103, '보리깡', 550, 1500);

savepoint a;

insert into product
values (104, '멸치깡', 58, 1500);

insert into product
values (105, '땡깡', 120, 1500);

savepoint b;

insert into product
values (106, '짜리몽깡', 120, 1500);

insert into product
values (107, '니깡내깡', 220, 1500);

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
values (product_ppid_seq.nextval, '이름', 10, 1000);

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
into product_detail values (PD_P_CODE_SEQ.nextval,'닭','white','동물',to_date('2015.03.06','yyyy.mm.dd'));
into product_detail values (124,'강아지','blue','동물',to_date('2015.03.06','yyyy.mm.dd'))
into product_detail values (121,'원숭이','white','동물',to_date('2015.03.06','yyyy.mm.dd'))
into product_detail values (122,'돼지','pink','동물',to_date('2015.03.06','yyyy.mm.dd'))
into product_detail values (120,'고양이','white','동물',to_date('2015.03.06','yyyy.mm.dd'))
into product_detail values (125,'앵무새','red','동물',to_date('2015.03.06','yyyy.mm.dd'))
into stock_management values(125,'앵무새','동물',200,20,150,to_date('2019.01.01','yy.mm.dd'), sysdate)
select *
from dual;


select *
from stock_management;

delete stock_management;

insert all
into stock_management
values (101,'닭','ani',100,20,500,sysdate,to_date('2015.03.06','yyyy.mm.dd'))
into stock_management
values (105,'돼지','ani',100,20,500,sysdate,to_date('2015.03.06','yyyy.mm.dd'))
into stock_management
values (104,'원숭이','ani',100,20,500,sysdate,to_date('2015.03.06','yyyy.mm.dd'))
into stock_management
values (106,'고양이','ani',100,20,500,sysdate,to_date('2015.03.06','yyyy.mm.dd'))
into stock_management
values (103,'강아지','ani',100,20,500,sysdate,to_date('2015.03.06','yyyy.mm.dd'))
into stock_management
values (107,'앵무세','ani',100,20,500,sysdate,to_date('2015.03.06','yyyy.mm.dd'))
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
insert values (PD_P_CODE_SEQ.nextval,'소','brown','ani',sysdate);


pd_p_code_seq.nextval




------------------------------------질문
--1 병합
두가지 작업은 할 수 없는가?

merge into product_detail
using dual
on (p_code = 110)
when matched then
update set d_date = sysdate
when not matched then
insert values (PD_P_CODE_SEQ.nextval, '하마' , 'gray' , '동물' , sysdate) 
and insert into stock_management values (110, '하마', 'ani', '100','0','0', sysdate, sysdate);

