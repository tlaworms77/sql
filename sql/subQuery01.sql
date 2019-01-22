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
-- subquery 단일행인 경우 -> ( <, >, =, !=, <=, >= ) 
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
SELECT 
    title, ROUND(AVG(a.salary)) AS avg_salary
FROM
    salaries a,
    titles b
WHERE
    a.emp_no = b.emp_no
        AND a.to_date = '9999-01-01'
        AND b.to_date = '9999-01-01'
GROUP BY title
HAVING avg_salary = (SELECT 
        MIN(avg_salary)
    FROM
        (SELECT 
            title, ROUND(AVG(a.salary)) AS avg_salary
        FROM
            salaries a, titles b
        WHERE
            a.emp_no = b.emp_no
                AND a.to_date = '9999-01-01'
                AND b.to_date = '9999-01-01'
        GROUP BY title) a);
                               
                               
-- 다중행
-- any
-- =any(in 과 동일), >any, <any, <>any, <=any, >=any
-- all
-- =all(값이 하나만 있을 경우), >all, <all, <>all, <=all, >=all

-- ex) 예제:  현재 급여가 50000 이상인 직원 이름 출력
SELECT 
    a.emp_no, b.salary AS name, b.salary
FROM
    employees a,
    salaries b
WHERE
    a.emp_no = b.emp_no
        AND b.to_date = '9999-01-01'
        AND (a.emp_no, b.salary) = any (SELECT 
            emp_no, salary
        FROM
            salaries
        WHERE
            salary > 50000
                AND to_date = '9999-01-01');

-- join사용
select concat(a.first_name, ' ', a.last_name), b.salary
from employees a,
		(select emp_no, salary
		from  salaries
        where to_date = '9999-01-01'
        and salary>50000) b
where a.emp_no = b.emp_no;