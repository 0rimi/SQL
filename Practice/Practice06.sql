--예제
--다지우기

DROP TABLE book;
DROP TABLE author;

DROP SEQUENCE seq_author_id;
DROP SEQUENCE seq_book_id;

--일단 시퀀스 만들고
CREATE SEQUENCE seq_author_id
INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE seq_book_id
INCREMENT BY 1
START WITH 1;

--다 지웠으니 테이블 만들고
create table author(
    author_id number(10),
    author_name varchar(100) not null,
    author_desc varchar(500),
    primary key(author_id)
    );
    
create table book(
    book_id number(10),
    title varchar2(100) not null,
    pubs varchar2(100),
    pub_date date,
    author_id number(10),
    primary key(book_id),
    CONSTRAINT book_fk foreign key (author_id) REFERENCES author(author_id)
    );

--작가테이블에 행 입력.
INSERT  INTO author
VALUES(seq_author_id.nextval, '이문열', '경북 영양');
INSERT  INTO author
VALUES(seq_author_id.nextval, '박경리', '경상남도 통영');
INSERT  INTO author
VALUES(seq_author_id.nextval, '유시민', '17대 국회의원');
INSERT  INTO author
VALUES(seq_author_id.nextval, '기안84', '기안동에서 산 84년생');
INSERT  INTO author
VALUES(seq_author_id.nextval, '강풀', '온라인 만확가 1세대');
INSERT  INTO author
VALUES(seq_author_id.nextval, '김영하', '알쓸신잡');


--fk로 북인포
INSERT INTO Book
VALUES(seq_book_id.nextval, '우리들의 일그러진 영웅', '다림', '1998-02-22', 1);
INSERT INTO Book
VALUES(seq_book_id.nextval, '삼국지', '민음사', '2002-03-01', 1);
INSERT INTO Book
VALUES(seq_book_id.nextval, '토지', '마로니에북스', '2012-08-15', 2);
INSERT INTO Book
VALUES(seq_book_id.nextval, '유시민의 글쓰기 특강', '생각의 길', '2015-04-01', 3);
INSERT INTO Book
VALUES(seq_book_id.nextval, '패션왕', '중앙북스(books)', '2012-02-22', 4);
INSERT INTO Book
VALUES(seq_book_id.nextval, '순정만화', '재미주의', '2011-08-03', 5);
INSERT INTO Book
VALUES(seq_book_id.nextval, '오직두사람', '문학동네', '2017-05-04', 6);
INSERT INTO Book
VALUES(seq_book_id.nextval, '26년', '재미주의', '2012-02-04', 5);

SELECT * FROM book;
SELECT * FROM author;

--강풀의 정보 업데이트
update author
set author_desc = '서울특별시'
where author_id = 5;

SELECT b.book_id,
       b.title,
       b.pubs,
       to_char(b.pub_date,'YYYY-MM-DD') as pub_date,
       a.author_id,
       a.author_name,
       a.author_desc
FROM book b, author a
where b.author_id = a.author_id ;