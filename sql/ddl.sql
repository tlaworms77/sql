-- create table
CREATE TABLE member (
    no INT UNSIGNED NOT NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(20) NOT NULL,
    name VARCHAR(20),
    department_name VARCHAR(20) NOT NULL DEFAULT 'none',
    
    PRIMARY KEY (no)
);

desc member;

-- alter table (add/drop)
alter table member add juminbunho char(13) not null;
alter table member drop juminbunho;
alter table member add juminbunho char(13) not null first; -- first 위치지정
alter table member drop juminbunho;
alter table member add juminbunho char(13) not null after name; -- name 뒤에

alter table member add join_date datetime not null;
-- ex5) Member 테이블의 Primary Key no에 자동 1씨기 증가하는 속성을 추가 해 보세요. 
alter table member change no no int unsigned not null auto_increment;
-- ex6) member의 컬럼 deparment_name의 이름이  길어 dept_name으로 바꿀려고 합니다.
alter table member change department_name dept_name varchar(20) not null default 'none';

desc member;

-- 이름 변경
alter table member rename user;
desc user;

-- foreign key
-- constraint(제약 조건 : 데이터의 생성, 삭제, 수정에 제약을 준다.)

create table dept(
	no int unsigned not null auto_increment,
    name varchar(50) not null,
    
    primary key(no)
);

desc dept;

alter table user drop column dept_name;

drop table user;

CREATE TABLE user (
    no INT UNSIGNED NOT NULL AUTO_INCREMENT,
    email VARCHAR(20) NOT NULL,
    password VARCHAR(64) NOT NULL,
    name VARCHAR(20),
    juminbunho CHAR(13) NOT NULL,
    join_date DATETIME NOT NULL,
    dept_no INT UNSIGNED null, -- -- NULL,
    PRIMARY KEY (no),
    FOREIGN KEY (dept_no)
        REFERENCES dept (no)
        ON DELETE cascade -- set null -- RESTRICT
);

insert into dept(name) values('개발팀');
select * from dept;

insert into user values(null, 'a@a.com', password('1234'), '둘리', '', now(), 1); -- password('') 암호화거는 함수

-- on delete cascade
delete from user where no = 1;
delete from dept where no = 1;

select * from user;

desc user;
















