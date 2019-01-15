-- 숫자함수

-- 절대값
select abs(10), abs(-10) from dual;

-- 나머지
select mod(234, 10), 254 % 10 from dual;

-- 내림
select floor(1.23), floor(-1.23) from dual;

-- 올림
select ceil(3.14), ceiling(3.14),
	   ceil(-3.14), ceiling(-3.14) from dual;

-- 반올림
select round(-1.23), round(-1.51), round(1.57) from dual;
select round(1.298, 0), round(1.298, 1), round(1.298, 2) from dual; -- 소수점 지정

-- 지승
select pow(2, 2), power(2, -2) from dual;

-- sin
select sign(-10), sign(0), sign(100) from dual;

-- 가장 큰값
select greatest(5, 4, 3, 2, 1),
	   greatest(3.14, 4.26, 5.3),
       greatest("ABCD", "ABCF", "B") from dual;

-- 가장 작은것
select least(5, 4, 3, 2, 1),
	   least(3.14, 4.26, 5.3),
       least("ABCD", "ABCF", "B") from dual;