desc employee;

select * from employee;

insert
  into employee(name, no, department_no)
values (null, 'test1', null);

insert
  into employee(name, no, department_no)
values ('test2', null, null);

insert
  into employee(name)
values ('tes3');

-- update
select * from employee;

UPDATE employee 
SET 
    name = '도우넛',
    department_no = 1
WHERE
    no = 5;

-- delete

select * from employee;

delete from employee where name = 'tes2';