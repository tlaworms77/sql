-- MYSQL 문자열 함수

-- upper / lower 대소문자처리
select ucase('Seoul'), upper('seoul');
select lcase('Busan'), lower('Busan');

-- 문자 짜르기 ( DB는 인덱스가 1부터 시작한다!! )
-- substring(컬럼명, 시작인덱스, 자를갯수)
select substring('Happy Day', 3, 2);
select substring('Happy Day', 3, 2)
from dual; -- table없이 처리할 때 DB 에서는 FROM 절을 무조건 써야한다. 의미상으로

select *
  from employees
  where substring(hire_date, 1, 4) = '1989'; -- '1989-__-__' 형식이 정해져있을 때

-- 오른쪽/왼쪽 문자 채우기 (공백 채워서 정령하고 싶을 때)
select LPAD('hi', 10, '*') from dual;
select RPAD('hi', 10, '*') from dual;

select emp_no, LPAD(cast(salary as char), 10, '*')
  from salaries;
    
-- **111
-- ***11	이렇게 정렬 하고 싶을 때
-- *1111


-- 공백 제거

select ltrim(' hello    '), rtrim('  hello   ') from dual;
select concat('---', ltrim(' hello    '), '---'),
	   concat('---', rtrim('  hello   '), '---'),
	   concat('---', trim('   hello   '), '---') from dual;

-- 특정 문자 제거            
select trim(both 'x' from 'xxxhixxx'),
	   trim(leading 'x' from 'xxxhixxx'),
       trim(trailing 'x' from 'xxxhixxx') from dual;
