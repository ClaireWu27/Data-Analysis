create table if not exists financial_loan(
id	int primary key,
address_state	varchar(10),
application_type varchar(50),
emp_length	varchar(50),
emp_title	varchar(100),
grade	varchar(10),
home_ownership	varchar(50),
issue_date	date,
last_credit_pull_date	date,
last_payment_date	date,
loan_status	varchar(50),
next_payment_date	date,
member_id	int,
purpose	varchar(50),
sub_grade	varchar(10),
term	varchar(50),
verification_status	varchar(50),
annual_income	float,
dti float,
installment	float,
int_rate		float,
loan_amount		float,
total_acc		float,
total_payment 	float
);
select count(*) from financial_loan fl ;
-- calculating the total number of application receive
select count(id) as total_loan_applications from financial_loan fl; 
;  
-- calculating MTD total_loan_application
 select count(id) as total_loan_applications 
 from financial_loan fl
 where extract(month from issue_date)=12 and extract(year from issue_date)=2021 
; 
-- 4314

-- calculating PMTD total_loan_application
 select count(id) as total_loan_applications 
 from financial_loan fl
 where extract(month from issue_date)=11 and extract(year from issue_date)=2021
; 
-- 4035
-- calculating MOM total_loan_application
with MTD_app as(select count(id) as total_loan_applications 
 from financial_loan fl
 where extract(month from issue_date)=12 and extract(year from issue_date)=2021 
),
PMTD_app as( select count(id) as total_loan_applications 
 from financial_loan fl
 where extract(month from issue_date)=11 and extract(year from issue_date)=2021
)
select ((((MTD_app.total_loan_applications)-(PMTD_app.total_loan_applications))/(PMTD_app.total_loan_applications))) as MOM_app
from MTD_app, PMTD_app; 
-- calculating the total funded amount
select sum(loan_amount) as total_funded_amount
from financial_loan fl ;
-- calculating the MTD funded amount
 select sum(loan_amount) as total_funded_amount
from financial_loan fl 
where extract(month from issue_date)=12 and extract(year from issue_date)=2021;
-- calculating the PMTD funded amount
select sum(loan_amount) as total_funded_amount
from financial_loan fl 
where extract(month from issue_date)=11 and extract(year from issue_date)=2021;

-- calculating MOM funded amount
with MTD_loan as ( select sum(loan_amount) as total_funded_amount
from financial_loan fl 
where extract(month from issue_date)=12 and extract(year from issue_date)=2021),
PMTD_loan as (select sum(loan_amount) as total_funded_amount
from financial_loan fl 
where extract(month from issue_date)=11 and extract(year from issue_date)=2021)
select ((MTD_loan.total_funded_amount- PMTD_loan.total_funded_amount)/PMTD_loan.total_funded_amount) as MOM_loan
from MTD_loan,PMTD_loan;

-- calculating total amount received
select sum(total_payment) from financial_loan fl ;

-- calculating MTD total amount received
select sum(total_payment) as total_payment_received
from financial_loan fl 
where extract(month from issue_date)=12 and extract(year from issue_date)=2021;

-- calculating PMTD total amount received
select sum(total_payment) as total_payment_received
from financial_loan fl 
where extract(month from issue_date)=11 and extract(year from issue_date)=2021;

-- calculating MOM total amount received

with MTD_payment as ( select sum(total_payment) as total_payment_received
from financial_loan fl 
where extract(month from issue_date)=12 and extract(year from issue_date)=2021),
PMTD_payment as (select sum(total_payment) as total_payment_received
from financial_loan fl 
where extract(month from issue_date)=11 and extract(year from issue_date)=2021)
select ((MTD_payment.total_payment_received- PMTD_payment.total_payment_received)/PMTD_payment.total_payment_received) as MOM_payment
from MTD_payment,PMTD_payment;

-- average interest
select avg(int_rate) as avg_in_rate from financial_loan fl ;


-- MTD average interest
select avg(int_rate) as avg_int_rate
from financial_loan fl 
where extract(month from issue_date)=12 and extract(year from issue_date)=2021;

-- PMTD average interest
select avg(int_rate) as avg_int_rate
from financial_loan fl 
where extract(month from issue_date)=11 and extract(year from issue_date)=2021;

-- calculating MOM average interest rate

with MTD_in_rate as ( select avg(int_rate) as avg_int_rate
from financial_loan fl 
where extract(month from issue_date)=12 and extract(year from issue_date)=2021),
PMTD_in_rate as (select avg(int_rate) as  avg_int_rate
from financial_loan fl 
where extract(month from issue_date)=11 and extract(year from issue_date)=2021)
select ((MTD_in_rate.avg_int_rate- PMTD_in_rate.avg_int_rate)/PMTD_in_rate.avg_int_rate) as MOM_int_rate
from MTD_in_rate,PMTD_in_rate;
 
-- average debt to income ratio
select avg(dti) as avg_dti from financial_loan fl ;

-- MTD average debt to income ratio
select avg(dti) as avg_dti
from financial_loan fl 
where extract(month from issue_date)=12 and extract(year from issue_date)=2021;

-- PMTD average debt to income ratio
select avg(dti) as avg_dti
from financial_loan fl 
where extract(month from issue_date)=11 and extract(year from issue_date)=2021;

-- calculating MOM debt to income rati

with MTD_dti as ( select avg(dti) as avg_dti
from financial_loan fl 
where extract(month from issue_date)=12 and extract(year from issue_date)=2021),
PMTD_dti as (select avg(dti) as avg_dti
from financial_loan fl 
where extract(month from issue_date)=11 and extract(year from issue_date)=2021)
select ((MTD_dti.avg_dti- PMTD_dti.avg_dti)/PMTD_dti.avg_dti) as MOM_avg_dti
from MTD_dti,PMTD_dti;

-- good loan application percentage
select (count(case when loan_status='Fully Paid' or loan_status='Current' then id end)/count(id)*100) as good_loan_per
from financial_loan fl ;

-- total good loan application 
select count(id)
from financial_loan 
where loan_status='Fully Paid' or loan_status='Current';

-- good loan funded amount
select sum(loan_amount)
from financial_loan 
where loan_status='Fully Paid' or loan_status='Current'; 

--  good loan total received amount
select sum(total_payment)
from financial_loan 
where loan_status='Fully Paid' or loan_status='Current'; 

--  bad loan application percentage
select (count(case when loan_status='Charged Off' then id end)/count(id)*100) as bad_loan_per
from financial_loan;

-- total bad loan application 
select count(id)
from financial_loan 
where loan_status='Charged Off';


-- bad loan funded amount
select sum(loan_amount)
from financial_loan 
where loan_status='Charged Off';

--  bad loan total received amount
select sum(total_payment)
from financial_loan 
where loan_status='Charged Off';

--  total loan applications, toal funded amount, total amount received, average interest rate, average debate to income ratio categories by loan status
select loan_status, 
count(id) as total_loan_applications, 
sum(loan_amount) as total_loan_amount, 
sum(total_payment) as total_amount_received,
avg(int_rate) as avg_int_rate,
avg(dti) as avg_dti
from financial_loan
group by loan_status ;

--  MTD funded amount, MTD amount received,  average interest rate, average debate to income ratio categories by loan status
select loan_status, 
sum(loan_amount) as MTD_loan_amount, 
sum(total_payment) as MTD_amount_received,
avg(int_rate) as avg_int_rate,
avg(dti) as avg_dti
from financial_loan
where extract(month from issue_date)=12 and extract(year from issue_date)=2021 
group by loan_status ;

-- calculate monthly total loan application, total funded amount, and total amount received
--  bank loan report |overview   
select extract(year from issue_date) as year, extract(month from issue_date) as month, to_char(issue_date,'Month') as month_name, count(id) as total_loan_application, sum(loan_amount) as total_funded_amount, sum(total_payment) as total_amount_received
from financial_loan 
group by 1,2,3
order by 1,2;

--  bank loan report |state
select address_state, count(id) as total_loan_application, sum(loan_amount) as total_funded_amount, sum(total_payment) as total_amount_received
from financial_loan 
group by 1
order by 1;

--  bank loan report |employee length
select emp_length, count(id) as total_loan_application, sum(loan_amount) as total_funded_amount, sum(total_payment) as total_amount_received
from financial_loan 
group by 1
order by 1;

--  bank loan report |loan purpose
select purpose , count(id) as total_loan_application, sum(loan_amount) as total_funded_amount, sum(total_payment) as total_amount_received
from financial_loan 
group by 1
order by 1;
 
--  bank loan report |home ownership
select home_ownership , count(id) as total_loan_application, sum(loan_amount) as total_funded_amount, sum(total_payment) as total_amount_received
from financial_loan 
group by 1
order by 1;

select * 
from financial_loan;

select address_state
from financial_loan;


