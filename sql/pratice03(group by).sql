-- (Grouping)
-- GROUP BY 절에 여러 컬럼을 사용함으로써 여러 Subgroup으로 테이터를 분류할 수 있다.

-- 예제5: 현재 직책별로 평균 연봉과 인원수를 구하되 직책별로 인원이 100명 이상인 직책만 출력하세요.
select b.title as "직책별",
	   avg(c.salary) as "평균 연봉",
       count(*) as "인원수"
  from employees a, titles b, salaries c
 where a.emp_no = b.emp_no
   and a.emp_no = c.emp_no
   and b.to_date = '9999-01-01'
   and c.to_date = '9999-01-01'
   group by b.title
   having count(*) >= 100;

-- 예제6: 현재 부서별로 현재 직책이 Engineer인 직원들에 대해서만 평균급여를 구하세요.
 select b.dept_no as '부서',
		avg(d.salary)
   from employees a, dept_emp b, titles c, salaries d
  where a.emp_no = b.emp_no
	and a.emp_no = c.emp_no
    and a.emp_no = d.emp_no
    and b.to_date = '9999-01-01'
    and c.to_date = '9999-01-01'
    and d.to_date = '9999-01-01'
    and c.title = 'Engineer'
group by b.dept_no;

-- 예제7: 현재 직책별로 급여의 총합을 구하되 Engineer직책은 제외하세요
--       단, 총합이 2,000,000,000이상인 직책만 나타내며 급여총합에 대해서 내림차순(DESC)로 정렬하세요.
select b.title as '직책',
	   sum(c.salary) as '총 급여'
  from employees a, titles b, salaries c
 where a.emp_no = b.emp_no
   and a.emp_no = c.emp_no
   and b.to_date = '9999-01-01'
   and c.to_date = '9999-01-01'
group by b.title
having b.title != 'Engineer' and sum(c.salary) > 2000000000
order by sum(c.salary) desc;
