SELECT *
  FROM GUESTBOOK;

DELETE 
  FROM GUESTBOOK 
 WHERE NO = 5;
 
 select no, name, message, date_format(reg_date, '%Y-%m-%d %h:%i:%s') from guestbook order by reg_date desc limit 15, 5;
 
 -- 방금 들어간 값 가져오기
 select last_insert_id();