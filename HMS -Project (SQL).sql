create database hospital_management_system;
use hospital_management_system;
drop database hospital_management_system;

create table patients (
patient_id int primary key auto_increment,
patient_name varchar(150) not null,
patient_age int not null,
patient_gender varchar(100),
patient_address varchar(100),
blood_type varchar(50) not null,
patient_mobile varchar(100) not null
);
drop table patients;
select * from patients;

insert into patients(patient_name, patient_age, patient_gender, patient_address, blood_type,patient_mobile)
values
 ( 'arun', 25, 'male', 'chennai', 'B+', '8999395930'),
 ( 'nisha', 22, 'female', 'erode', 'AB+', '8434530534'),
 ( 'ajith', 27, 'male', 'chengalpat', 'O-', '9485395345'),
 ( 'mani', 23, 'male', 'Thanjavur', 'A-' ,'8893535343'),
 ( 'prithi', 25, 'female', 'karur', 'O-','8484535935');
 
 select * from patients
 
 create table doctors(
 doctor_id int primary key auto_increment,
 doctor_name varchar(100) not null,
 doctor_speciality varchar(100),
 doctor_schedule varchar(100),
 gender varchar(100), 
 working_hours varchar(100),
 patient_id int,
 foreign key (patient_id)references
 patients(patient_id)
 );

alter table doctors drop constraint pati_id;
drop table doctors;
 insert into doctors (doctor_name, doctor_speciality, doctor_schedule,gender,working_hours,patient_id)
 values ('shivani', 'heart', 'morning','female','3PM-7PM', 1),
  ('arun', 'eye', 'night','male','8AM-1PM',2),
  ('bala', 'teeth', 'morning','male', '7AM-11AM',3),
  ('vijay', 'brain', 'morning','male','4PM-7PM' ,4),
  ('ajith', 'bone', 'evening','male','7PM-11PM',5);
 
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE DOCTORS;
drop table doctors;
select * from doctors;

  create table appointments (
  appointment_id int primary key auto_increment,
  patient_name varchar(100) not null,
  gender varchar(50),
  appointment_date date,
  appointment_time time,
  doctor_id int,
  foreign key (doctor_id)
  references 
  doctors(doctor_id)
  );
select * from doctors;
drop table appointments;
  insert into appointments (patient_name, gender, appointment_date, appointment_time,doctor_id)
  values
  ('mahesh', 'male', '2023-02-21', '10:00:00', 1),
  ('vel', 'male', '2022-06-23', '11:12:00', 2),
  ('raman', 'male', '2024-09-22', '11:30:00', 3),
  ('vimala', 'female', '2024-07-26', '14:00:00', 4),
  ('pradhap', 'male','2023-08-24', '15:15:00', 5)
  
  select * from appointments;
  
  create table departments (
   department_id int primary key auto_increment,
   doctor_name  varchar(100),
   salary int,
   department_name varchar(100),
   gender varchar(50),
   joining_date date,
   age int
   );
   
   insert into departments (doctor_name, salary, department_name, gender, joining_date, age)
values 
('arul', 50000 , 'emergency', 'male', '2024-06-09', 27),
('velan', 55000, 'cardiology', 'male', '2023-09-05', 29),
('vasugi', 40000, 'radiology', 'female', '2024-04-02', 30),
('sreeganesh', 60000, 'surgery', 'male', '2021-07-11', 33),
('suresh', 53000, 'audiology', 'male', '2022-05-08', 28)

select * from departments;

  
  create table treatments (
  treatment_id int primary key auto_increment,
  treatment_name varchar(150) not null,
  total_cost decimal(8, 2),
  treatment_date date,
  payment_method varchar(100)
  );
 drop table treatments; 
  
  insert into treatments ( treatment_name, total_cost, treatment_date, payment_method)
  values
  ('physical therapy', 3000.00, '2024-05-08', 'cash'),
  ('chemotherapy', 5000.00, '2024-06-02', 'upi'),
  ('dental cleaning', 8000.00, '2024-06-08', 'creditcard'),
  ('massage therapy', 3000.00, '2024-05-03', 'cash'),
  ('bone fracture', 30000.00, '2024-05-03', 'cash')
  
select * from patients;
  
select * FROM departments WHERE salary > 50000;

select* from departments where department_name = 'surgery';

select * from patients where blood_type = 'B+';

select *from treatments where payment_method = 'cash' or payment_method = 'upi';

select * from departments where gender = 'male' or salary > 55000;

select* from departments where age > 30 and salary < 55000;

select *  from appointments where gender = 'male'or appointment_time < '11:00:00';
 
select * from appointments where gender = 'female' and doctor_id = 4;

select * from  appointments where doctor_id in (1, 2, 3);

select sum(total_cost) as toalamount from treatments;

select max(total_cost) as toalamount from treatments;

ALTER TABLE departments ADD department_location VARCHAR(100);

select * from departments;

ALTER TABLE departments DROP COLUMN department_location;

alter table treatments add column gender varchar(30);

alter table treatments drop column gender;

alter table treatments change column total_cost cost decimal(10,2);

DELETE FROM departments WHERE salary BETWEEN 45000 AND 55000;

select count(*) as male_doctors from doctors where
gender = 'male' and  doctor_schedule = 'evening';

select upper(treatment_name) as treatment from treatments;

select lower(payment_method) as payment from treatments;

select p.patient_name, d.doctor_name from patients as p right join
doctors as d on p.patient_id = d.patient_id;

select p.patient_name, d.doctor_name
from patients  p
left join doctors as d on p.patient_id = d.patient_id;

select p.patient_name, d.doctor_name from patients as p
inner join doctors as d on p.patient_id = d.patient_id where p.patient_gender = 'male';

select p.patient_name, d.doctor_name from patients as p inner join doctors as d
on p.patient_id = d.patient_id where p.patient_age between 22 and 30
and d.doctor_speciality = 'heart';

select p.patient_name, d.doctor_speciality from patients as p
inner join doctors as d on p.patient_id = d.patient_id;

select a.patient_name, d.doctor_name, a.appointment_time from appointments as a inner join 
doctors as d on a.doctor_id = d.doctor_id
where a.appointment_time between'10:00:00' and'12:00:00';

select d.doctor_name, count(a.appointment_id) as total_appointments from appointments as a inner join
doctors as d on a.doctor_id = d.doctor_id
group by d.doctor_name;

select a.appointment_time, d.gender from appointments a right join doctors d 
on a.doctor_id = d.doctor_id;

select a.patient_name, d.working_hours from appointments a inner join doctors d 
on a.doctor_id = d.doctor_id;

select d.doctor_name, d.gender, a.appointment_time from doctors d 
left join appointments a 
on d.doctor_id = a.doctor_id;

select min(total_cost) as toal from treatments;

select * from treatments where total_cost > (select avg(total_cost) from treatments);

update treatments set payment_method = 'bank transfer' where treatment_name = 'chemotherapy';

select treatment_name, total_cost from treatments
order by total_cost desc;

select * from appointments order by appointment_date asc;

select count(total_cost) as toal from treatments;

select avg(total_cost) as toal from  treatments;
select * from departments;

select doctor_name from departments  where salary>60000;

select payment_method, count(*) as treatment_count from treatments
group by payment_method;

select * from doctor_name where salary>53000;

select * from doctor_name where  salary>55000;

select * from departments where doctor_name like '%n';

select * from departments where department_name like '%logy%';

select * from appointments where patient_name like '_____';

select * from appointments where patient_name like '%ra%';

select * from departments where doctor_name like '%a%' and salary between 50000 and 60000;

select * from departments where salary between 40000 and 55000;

select * from departments where department_name like 'c%';

select * from departments where department_name like '%logy%' and joining_date >= '2023-01-01';

select avg(salary),doctor_name,department_name from departments group by gender;

select avg(salary),doctor_name,department from departments group by gender order by dender desc;

select salary,count(*)from departments group by doctor_name;

select doctor_name, gender from departments group by department_name;

select * from departments

select  count(*) department_id ,sum(salary) as total_income from departments;

select department_id, sum(salary) as income, doctor_name as Name from departments
where salary = 40000 group by department_id, doctor_name
limit 2;

select department_name from departments where
age = (select max(age) fromdepartments);

select doctor_name from departments where 
salary > (select avg(salary) from departments);

select doctor_name from departments where 
age = (select min(age) from departments);

select * from patients;

select * from patients where patient_age  between 22 and 27 order by patient_age;

select patient_id, patient_age from patients where patient_age between 23 and 27
order by patient_age;

select * from departments;

select concat(treatment_name, ' - ', payment_method) as treatment_details 
from treatments;

select upper(doctor_name) from doctors;

select lower(doctor_name) from doctors

select * from departments;

select count(*) from patients where patient_address="chennai";

select * from patients;

select distinct patient_name from patients;

select * from treatments where total_cost < (25000);

 select * from treatments;
 select * from patients;
 select * from treatments;
 select * from doctors;
  
select patient_id, patient_age from patients where patient_age between 22 AND 27
order by patient_age;

select * from patients where patient_name = 'prithi' or patient_age = '25';

select department_id, sum(salary) as income, doctor_name as name from departments
where salary = 55000 group by department_id
limit 2;

select treatment_name, count(*) ascount, sum(total_cost) as total_costs, payment_method as cost
from treatments where payment_method = 'upi'
group  by treatment_name, payment_method
limit 2;

select * from treatments;

select avg(total_cost),treatment_name from treatments 
group by treatment_name
having avg (total_cost)<20000 limit 1;

select * from treatments where payment_method = 'cash' and total_cost > 5000;

select * from appointments where gender = 'male' 
and appointment_date > '2023-01-01'
order by appointment_date desc;

select * from patients where patient_age=(select min(patient_age) from patients);

select * from patients where patient_age=(select max(patient_age) from patients);

select * from patients  where patient_mobile is null;

select * from patients where patient_mobile is not null;

select max(salary) as max_salary, min(salary) as min_salary from departments;	

select * from departments order by salary;

select * from departments order by salary desc;

select * from doctors

select * from doctors where doctor_name in('bala','vijay');

select * from doctors where doctor_name not in('bala','vijay');

select doctor_name, salary from departments order by salary
desc limit 2;

select * from departments where age is null;

select * from departments where salary 
between 40000 and 50000;

select department_name, avg(salary) as avg_salary from departments
group by department_name having avg(salary) > 50000;

select doctor_name, department_name, case
when salary < 40000 then 'Low'
when salary between 50000 and  70000 then'Medium'
else 'High'
end as salary_range from departments;

select  doctor_name, doctor_speciality, case 
when doctor_speciality = 'heart' then'Cardiologist'
else 'Specialist'
end as doctor_role from doctors;

select doctor_name, patient_id, case
when patient_id is null then 'No Patient Assigned'
else 'Assigned to Patient'
end as assignment_status from doctors;

select doctor_name, doctor_schedule, case
when doctor_schedule = 'morning' then'Morning Available'
when doctor_schedule = 'night' then 'Night Available' else 'Not Available'
end  as availability from doctors;

select treatment_name, total_cost,case
when total_cost < 5000 then 'Low'
when total_cost between 5000 and 10000 then'Medium'
else 'High'
end as  cost_range from treatments;

--VIEWS--

create view patient_details as
select p.patient_name, d.doctor_name from patients as p
inner join doctors as d on p.patient_id = d.patient_id 
where p.patient_gender = 'male';

select * from patient_details

drop view patient_details


-- END OF THE PROJECT --





  
  
  

  

  
  

  
  
  
  
  
  
  
 
  
  






