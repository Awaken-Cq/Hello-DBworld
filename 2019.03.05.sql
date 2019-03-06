--ddl 자료 정의 언어 [Data Definition Language]

-- 회원(필수입력사항) member
-- 이름                      name             varchar2(30)
-- 아이디                   id                  varchar2(16)
-- 비밀번호                pass               varchar2(16)
-- 나이                      age                number(3)
-- 이메일아이디          email_id          varchar2(30)
-- 이메일도메인(@~)   email_domain  varchar2(30)
-- 가입일                   join_date          date



-- 회원 상세정보(선택입력사항) member_detail
-- 아이디(for join)       id                   varchar2(30)
-- 우편번호                zipcode           varchar2(5)
-- 일반주소                address           varchar2(100)
-- 상세주소                address_detail   varchar2(100)
-- 전화번호1(010)        tel1                 varchar2(3)
-- 전화번호2(2702)       tel2                varchar2(4)
-- 전화번호3(6429)       tel3                varchar2(4)

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


-----------------------------------------------DML 데이터 조작 언어(Data manipulation language)
-- insert
insert into member
values ('노정탁', 'njtak2514', '1234', '28', 'njtak2514', 'gmail.com' , sysdate);

--작성순서가 기억이 나지 않을때 데이터를 명시하여 작성
insert into member(name, id, pass, age, email_id, email_domain, join_date)  
values ('박보영', 'boyoung', '1234', '30', 'boyoung90', 'gmail.com' , sysdate);

insert into member_detail(tel1, tel2, tel3, address, address_detail, zipcode, id)
values('010', '2702', '6429', '서울 동대문구 천호대로 47길 62 신답경남아파트', '1007호', '02534', 'njtak2514');

insert into member
values ('박보영', 'boyoung', '1234', '30', 'boyoung90', 'gmail.com' , sysdate);

--작성되지 않은 부분은 null로 채워짐
insert into member(name, id, pass, join_date) 
values ('공유', 'gongyu', '1234', sysdate);

--not enough values : 추가할 컬럼과 데이터가 1:1매칭이 안된다.
insert into member(name, id, pass, age, email_id, email_domain, join_date)  
values ('박보영', 'boyoung', '1234', sysdate);

--KITRI.MEMBER_ID_PK : PK가 들어간 것으로보아 무결성 제약조건(중복금지)에 속할 것이다.라고 추측
insert into member(name, id, pass, join_date) 
values ('박보영', 'boyoung', '1234', sysdate);

--KITRI.MEMBER_DETAIL_ID_FK : FK가 들어간 것으로 보아 참조할 데이터가 없음(id)
insert into member_detail(tel1, tel2, tel3, address, address_detail, zipcode, id)
values('010', '2702', '6429', '서울 동대문구 천호대로 47길 62 신답경남아파트', '1007호', '02534', 'njtak'); 


--insert all
--하나의 insert문으로 여러 테이블에 insert를 할 수 있다.
insert into member(id, name, pass, age, email_id, email_domain, join_date)  
values ('oracle', '오라클', 'a12345678', '30', 'oracle', 'oracle.com' , sysdate);

insert into member_detail(id, tel1, tel2, tel3, address, address_detail, zipcode )
values('oracle', '010', '1234', '5678', '서울 동대문구 천호대로 47길 70 동아아파트', '105호', '02534');

--error : missing SELECT keyword
insert all
    into member(id, name, pass, age, email_id, email_domain, join_date)  
    values ('oracle', '오라클', 'a12345678', '30', 'oracle', 'oracle.com' , sysdate)
   into member_detail(id, tel1, tel2, tel3, address, address_detail, zipcode )
    values('oracle', '010', '1234', '5678', '서울 동대문구 천호대로 47길 70 동아아파트', '105호', '02534');
    
--right query
insert all
    into member(id, name, pass, age, email_id, email_domain, join_date)  
    values ('oracle', '오라클', 'a12345678', '30', 'oracle', 'oracle.com' , sysdate)
   into member_detail(id, tel1, tel2, tel3, address, address_detail, zipcode )
    values('oracle', '010', '1234', '5678', '서울 동대문구 천호대로 47길 70 동아아파트', '105호', '02534')
select * from dual;


select *
from member m, member_detail ed
where m.id = ed.id; 




-- update


-- delete


-- merge


------------------------------------------------------------------------------------
-------제품정보 goods_detail
--
--제품코드 p_code varchar2(10) not null
--제품이름 p_name varchar2(10) not null
--제품색상 p_color varchar2(10)
--제품규격 p_type varchar2(6)
--개발일    d_date date

-------재고 stock management
--제품코드 p_code varchar2(10) not null
--제품이름 p_name varchar2(10) not null
--제품규격 p_typel varchar2(6) not null
--제품수량 p_quantity number(4)
--불량품 수량 dp_quantity number(4)
--판매수량 q_sold   number(4)
--최근 발주일 ro_date    date sysdate
--발주 예정일 order_date date sysdate

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
