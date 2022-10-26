create table board(


  board_idx number(4) PRIMARY key,--기본키 
  board_name varchar(50),--작성자 이름 
  board_title VARCHAR2(100),--제목
  board_content varchar(300),--내용
  board_date date default sysdate,--작성일
  board_hit number(4) default 0 --조회수
  
);

drop table board;

select * from board;


create SEQUENCE board_seq;

insert into board (board_idx, board_name,board_title,board_content,board_date)
values (board_seq.nextval, '뿌락찌','글 제목1','글 내용1', sysdate);

insert into board (board_idx, board_name,board_title,board_content,board_date)
values (board_seq.nextval, '장의영','글 제목2','글 내용2', sysdate);

insert into board (board_idx, board_name,board_title,board_content,board_date)
values (board_seq.nextval, '이민우','글 제목3','글 내용3', sysdate);

drop SEQUENCE board_seq;





ALTER SEQUENCE board_seq INCREMENT BY 1;

create SEQUENCE reply_board_seq;

drop sequence board_seq;

COMMIT;

select *from board;
ALTER SEQUENCE reply_board_seq INCREMENT BY 1;



create table reply(
   
       reply_idx  number(4) primary key,--댓글 기본키
       reply_name varchar2(100),--댓글 이름 
       reply_content varchar2(300),--댓글 내용 
       reply_date date default sysdate, --댓글 작성일 
       reply_board_idx number(4)-- 조회수 
);


insert into reply (reply_idx, reply_name, reply_content, reply_date, reply_board_idx)
values (reply_board_seq.nextval, '간달프','댓글 제목1',sysdate,1);

insert into reply (reply_idx, reply_name, reply_content, reply_date, reply_board_idx)
values (reply_board_seq.nextval, '고민훈','댓글 제목2',sysdate,2);

insert into reply (reply_idx, reply_name, reply_content, reply_date, reply_board_idx)
values (reply_board_seq.nextval, '장의영','댓글 제목3',sysdate,3);

select * from reply;

commit







   