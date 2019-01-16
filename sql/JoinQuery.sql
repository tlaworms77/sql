-- equi join(inner join)

-- 현재 근무중인 직원의 이름과 직책을 출력하게요.
select *
  from employees a, titles b
 where a.emp_no = b.emp_no	-- join 조건
   and b.to_date > now();
   
-- 현재 근무중인 직책이 Senior Engineer인 직원의 이름을 출력하세요.
select a.emp_no, a.first_name
  from employees a, titles b
 where a.emp_no = b.emp_no
  and b.to_date > now()
  and b.title = 'Senior Engineer';
  
  --
  -- ANSI/ISO SQL의 JOIN
  --
  
  -- 1. NATURAL JOIN
  select a.emp_no, a.first_name, b.title
    from employees a
    join titles b on a.emp_no = b.emp_no -- 조인 조건의 컬럼 명이 같으면 natural join 가능 아니면 on!!!
	-- natural join titles b
   where b.to_date > now();
   
   
   -- 2. JOIN ~USING
   select a.emp_no, a.first_name, b.title
    from employees a
    join titles b using(emp_no)
   where b.to_date > now();
   
   -- 3. JOIN ~ ON
 select a.emp_no, a.first_name, b.title
   from employees a
   join titles b on a.emp_no = b.emp_no
  where b.to_date > now();
   
   -- EQUI join
   
-- 실습문제 1:  현재 회사 상황을 반영한 직원별 근무부서를  사번, 직원 전체이름, 근무부서 형태로 출력해 보세요.
select a.emp_no as '사번',
	   concat(a.first_name, ' ', a.last_name) as '직원 전체이름',
       c.dept_name as '부서명'
  from employees a, dept_emp b, departments c
 where a.emp_no = b.emp_no
   and b.dept_no = c.dept_no
   and b.to_date < now()
 order by a.first_name;

-- 실습문제 2: 현재 회사에서 지급되고 있는 급여체계를 반영한 결과를 출력하세요.
-- (사번,  전체이름, 연봉  이런 형태로 출력하세요.)
select a.emp_no as '사번',
	   concat(a.first_name, ' ', a.last_name) as '직원 전체이름',
       b.salary
  from employees a, salaries b
 where a.emp_no = b.emp_no
   and b.to_date > now()
 order by a.first_name;
   