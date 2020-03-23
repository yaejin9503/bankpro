create table accountlog(
 	logid number primary key, 
 	custid varchar2(20) references customer(custid),
 	accounntno varchar2(20) references account(accountno),
 	transferno varchar2(20),
 	eventdate date default sysdate, 
 	eventtype varchar2(10), 
 	eventrecord varchar2(20),
 	amount number default 0, 
 	balance number 
)

 create table account(
     accountno varchar2(20) primary key,
     custid varchar2(20) references customer(custid),
     accounttype varchar2(10),
     balance number default 0,
     payment number default 0,
     interest number(3,2) default 0,
     startdeposit date,
     enddeposit date,
     approval varchar2(2)
  )
 
 create table customer(
     custid varchar2(20) primary key,
     password varchar2(20) not null,
     email varchar2(30) not null,
     division varchar2(20) not null,
     name varchar2(30) not null,
     idno varchar2(20) unique,
     address varchar2(100)
   )
   
   create sequence accountlog_seq
   
   
   create table qanboard (
	boarddno number primary key, 
	custid varchar2(20) references customer(custid),
	title varchar2(200) not null,
	content varchar2(4000) not null,
	regdate date default sysdate,
	originalfile varchar2(200),
	savedfile varchar2(50),
	hitcount number default 0,
	replytext varchar2(2000),
	repdate date 
)

create sequence QNABOARD_SEQ

create sequence ACCOUNTLOG_SEQ

insert into qanboard values(
	QNABOARD_SEQ.nextval,
	'abc',
	'인간적이다',
	'내용이다',
	'20180330',
	'flower.jpg',
	'flowerdfdfdfd.jpg',
	0,
	'잘하고 있어용',
	'20190101'
)