-- 집계함수(통계)

-- 집계함수를 쓸 떄는 다른 컬럼은 올 수 없다. 하지만 그룹바이에 온 컬럼은 확인용으로 올 수 있다.
select *
	from salaries
    where emp_no = 10060;
    
-- 평균(avg)
select avg(salary), sum(salary)
	from salaries
    where emp_no = 10060;
    
select emp_no, avg(salary), sum(salary)
	from salaries
    group by emp_no;
    
-- 직원의 최저 임금을 받은 시기와 최대 임금을 받은 시기를 각 각 출력.

select * 
from(
	select max(salary) as max_salary,
		   min(salary) as min_salary
		from salaries
		where emp_no = 10060) a;

select emp_no, count(*)
  from titles
  group by emp_no;

-- 1.3
select emp_no, avg(salary)
  from salaries
  group by emp_no
  having avg(salary) > 50000;

select emp_no, avg(salary)
  from salaries
  where emp_no > 10070
  group by emp_no
  having avg(salary) > 50000;