-- Basic query practice
drop table pet;

create table pet(
	name varchar(20),
    owner varchar(20),
    species varchar(20),
    gender char(1),
    birth date,
    death date
);

desc pet;

insert into pet 
	values('똘똘이', '근이', 'dog', 'f', '2018-10-10', null);
    
select * from pet;

select name, owner from pet;


-- load data
load data local infile 'c:\\pet.txt' into table pet;

select * from pet;


-- sql select
select * from pet;
select name, owner from pet where name='bowser';
select * from pet where birth >= '1998'; -- '1998-01-01'

select *
from pet
where species = 'dog'
and gender = 'f';

select * from pet where species = 'snake' or species = 'bird';

select name, birth from pet;

select name, birth from pet order by birth desc;

select name, gender, birth from pet order by gender asc, birth desc;

-- null 다루기
select * from pet where gender is null;

select * from pet where death is not null;


-- LIKE 검색
select * from pet where name like 'b%'; -- b로 시작하는 모든 문자 검색

select * from pet where name like 'b___'; -- b로 시작하는 _갯수만큼 달른 문자 검색

select * from pet where name like '%fy'; -- fy로 끝나는 모든 문자 검색

select * from pet where name like '%w%'; -- w가 들어가는 모든 문자검색

select * from pet where name like '_____'; -- 내용이 5개인 문자 검색

select * from pet where length(name) = 5; -- 내용(name의)가 5개인 문자 검색

-- count 집계(통계) 함수
select name, count(*) as '총 애완동물 수' from pet; -- 문제가 있다 매칭이 안됨

-- 각 주인들이 몇 마리의 애완동물을 가지고 있는가
-- group by 
select owner, count(*) as '애완동물 수' from pet group by owner;

-- 살아 있는 애완동물
select owner, count(*)
	from pet
	where death is null
		or death = '0000-00-00'
    group by owner
		having count(*) > 1;

select owner, count(*) 
	from pet
	group by owner
		having count(*) > 1;





