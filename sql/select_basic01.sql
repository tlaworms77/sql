select count(*)
	from employees;
    
select * 
	from employees
    limit 10, 20;
    
select min(hire_date) from employees;

select emp_no, first_name, hire_date
	from employees;

-- column heading alis
select emp_no as '번호',
	   first_name as '이름',
       hire_date as '입사일'
	from employees;

-- concat column의 값을 합친 것
select emp_no as '번호',
	   concat(first_name, ' ', last_name) as '이름',
       hire_date as '입사일'
	from employees;

-- distinct ( 중복 제거 )
select distinct * from titles;

-- order by 절 ( 데이터의 정렬 ) where에 있는 조건을 통해 필터링 하는 과정.
select concat(first_name, ' ', last_name) as '이름',
       gender as '성별',
       hire_date as '입사일'
from employees
order by hire_date desc;

select emp_no as '사원'
from salaries
where '2001-12-31' < from_date
	and from_date < '2002-01-10'
-- where from_date like '2001-%' -- like 연산보다 위에것이 빠르다.
order by salary desc;

select first_name as 이름,
	   gender as 성별,
       hire_date as 입사일 
	from employees
    where hire_date < '1991-01-01';

select *
 from employees
 where gender='f'
   and hire_date < '1989-01-01';

select *
  from dept_emp
 -- where dept_no = 'd005'
 -- or dept_no = 'd009';
 where dept_no in ('d005', 'd009');

select *
  from employees
  where hire_date like '1989-%'; -- '1989-__-__' 형식이 정해져있을 때
