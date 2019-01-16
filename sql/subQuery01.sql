-- subquery

select a.emp_no, b.dept_no
  from employees a, dept_emp b
  where a.emp_no = b.emp_no
    and concat(a.first_name, ' ', a.last_name) = 'Fai Bale'
    and b.to_date = '9999-01-01';
    
select b.dept_no
from employees a, dept_emp b
where a.emp_no = b.emp_no
and concat(a.first_name, ' ', a.last_name) = 'Fai Bale'
and b.to_date = '9999-01-01';
    
-- subquery 일 때 조건에 맞게 행,열을 맞춰서 받아야한다.
select a.emp_no, concat(a.first_name, ' ', a.last_name)
  from employees a, dept_emp b
 where a.emp_no = b.emp_no
   and b.dept_no = ( -- (a.emp_no, b.dept.no) = ~~~ 이렇게
	   select b.dept_no
		from employees a, dept_emp b
		where a.emp_no = b.emp_no
		and concat(a.first_name, ' ', a.last_name) = 'Fai Bale'
		and b.to_date = '9999-01-01');
        
-- 3-4. 단일행 서브쿼리 실습문제
-- 실습1 : 현재 전체사원의 평균 연봉보다 적은 급여를 받는 사원의  이름, 급여를 나타내세요.
select concat(a.first_name, ' ', a.last_name) as 'name',
	   salary as '급여'
  from employees a, salaries b
 where a.emp_no = b.emp_no
   and b.to_date = '9999-01-01'
   and salary < ( select avg(salary)
					from salaries
                    where to_date = '9999-01-01')
   order by b.salary desc;

-- 실습2 : 현재 가장적은 평균 급여를 받고 있는 직책에 대해서  평균 급여를 구하세요.
select title, avg(a.salary) as avg_salary
  from salaries a, titles b
 where a.emp_no = b.emp_no
   and a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01'
group by title;

select min(avg_salary)
  from (select title, avg(a.salary) as avg_salary
		  from salaries a, titles b
		 where a.emp_no = b.emp_no
		   and a.to_date = '9999-01-01'
		   and b.to_date = '9999-01-01'
	  group by title) a;

select title, avg(a.salary) as avg_salary
  from salaries a, titles b
 where a.emp_no = b.emp_no
   and a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01'
group by title
 having round(avg(a.salary)) = (select round(min(avg_salary))
  from (select title, avg(a.salary) as avg_salary
		  from salaries a, titles b
		 where a.emp_no = b.emp_no
		   and a.to_date = '9999-01-01'
		   and b.to_date = '9999-01-01'
	  group by title) a);

  select title, 
 	     round(avg(a.salary)) as avg_salary
    from salaries a, titles b
   where a.emp_no = b.emp_no
     and a.to_date = '9999-01-01'
     and b.to_date = '9999-01-01'
group by title
  having avg_salary = (select min(avg_salary)
                         from (  select title, 
                                        round(avg(a.salary)) as avg_salary
	                               from salaries a, titles b
		                          where a.emp_no = b.emp_no
                                    and a.to_date = '9999-01-01'
                                    and b.to_date = '9999-01-01'
							   group by title ) a );