desc department;

insert into department values(null, "총무팀");

insert into department values(null, "개발팀");

insert into department values(null, "인사팀");

insert into department values(null, "영업팀");

select * from department;

insert
  into employee
values (null, '둘리', 1);

insert
  into employee
values (null, '마이콜', 2);

insert
  into employee
values (null, '또치', 3);

insert
  into employee
values (null, '길동이', null);

select * from employee;
select * from department;

select * from employee a, department b
	where a.department_no = b.no;

-- OUTER JOIN
-- 1. 사용하기 위해서는 표준을 사용해야된다.
-- JOIN ~ ON 표준
select * from employee a
	JOIN department b
    ON a.department_no = b.no;
-- LEFT OUTER JOIN
select a.name as '이름',
	   ifnull(b.name, '없음') as '부서명' -- null 이라면 다른 값으로 표시하는 함수
  from employee a
  LEFT JOIN department b
  ON a.department_no = b.no;
  
-- RIGHT OUTER JOIN
select ifnull(a.name, '없음') as '이름',
	   b.name as '부서명'
  from employee a
  RIGHT JOIN department b
  ON a.department_no = b.no;
  
-- FULL OUTER JOIN ( mysql 지원 안함 )
-- select *
--  from employee a
--  FULL JOIN department b
--  ON a.department_no = b.no;