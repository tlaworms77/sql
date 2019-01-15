-- 날짜 함수

select curdate(), current_date();
select curtime(), current_time();
select now(), sysdate();

-- cf. now()는 쿼리가 실행 될 때 시간이 유지된다.
-- cf. sysdate()은 출력될 때마다 현재 시간으로 세팅되므로 바뀐다.
select emp_no, now() from employees; -- query가 시작한 시간하고 모든 값이 같다.
select emp_no, sysdate() from employees; -- sysdate는 값을 호출할 때 마다 다르게 나온다.

-- sns와 같은 시간변경에 따른 몇분전 몇일전 일정일이 지나면 정확한 날짜가 표시되는 것들은 db에서 포맷팅해서 주는 것이 아니라 데이터를 그냥 주고 개발언어에서 포맷팅.
-- 포맷팅
select first_name,
	   date_format(hire_date, '%Y-%m-%d %h:%i:%s')
  from employees;
  
-- 각 직원들에 대해 직원의 이름과 근무개월수
select first_name,
	   concat(
		cast(period_diff(
				date_format(curdate(), '%Y%m'),
				date_format(hire_date, '%Y%m')) as char), 
       '개월')
  from employees;
  
  -- 각 사원들은 입사 후 6개월 뒤에 정규직으로 발령이 된다.
  -- 발령날은 언제?
  -- month, week, year, day
select first_name,
		 hire_date,
		 date_add(hire_date, interval 6 month)
  from employees;
  
select date_add(
		cast('1994-05-20' as DATE),
        interval 10000 day);
  
  