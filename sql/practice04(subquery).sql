-- 서브쿼리(SUBQUERY) SQL 문제입니다.

-- 문제1.
-- 현재 평균 연봉보다 많은 월급을 받는 직원은 몇 명이나 있습니까?
SELECT 
    COUNT(*)
FROM
    salaries
WHERE
    to_date = '9999-01-01'
        AND salary > (SELECT 
            AVG(salary)
        FROM
            salaries
        WHERE
            to_date = '9999-01-01');

-- 문제2. 
-- 현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서 연봉을 조회하세요. 단 조회결과는 연봉의 내림차순으로 정렬되어 나타나야 합니다. 
SELECT 
    a.emp_no AS '사번',
    CONCAT(a.first_name, ' ', a.last_name) AS '이름',
    d.dept_name as '부서명',
    b.salary as 'salary'
FROM
    employees a,
    salaries b,
    dept_emp c,
    departments d,
    (SELECT 
        c.dept_no, MAX(b.salary) AS max_salary
    FROM
        employees a, salaries b, dept_emp c
    WHERE
        a.emp_no = b.emp_no
            AND a.emp_no = c.emp_no
            AND b.to_date = '9999-01-01'
            AND c.to_date = '9999-01-01'
    GROUP BY c.dept_no) e
WHERE
    a.emp_no = b.emp_no
        AND a.emp_no = c.emp_no
        AND b.salary = e.max_salary
        AND c.dept_no = d.dept_no
        AND b.to_date = '9999-01-01'
        AND c.to_date = '9999-01-01'
ORDER BY b.salary DESC;

-- 문제3.
-- 현재, 자신의 부서 평균 급여보다 연봉(salary)이 많은 사원의 사번, 이름과 연봉을 조회하세요 
select concat(a.first_name, ' ', a.last_name) as '이름'
  from employees a, salaries b, dept_emp c
 where salaries

-- 문제4.
-- 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요.

  

-- 문제5.
-- 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로 출력하세요.


-- 문제6.
-- 평균 연봉이 가장 높은 부서는? 


-- 문제7.
-- 평균 연봉이 가장 높은 직책?


-- 문제8.
-- 현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?
-- 부서이름, 사원이름, 연봉, 매니저 이름, 메니저 연봉 순으로 출력합니다.


