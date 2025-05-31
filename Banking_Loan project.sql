create database BankData;
use BankData;
select * from financial_loan;

# Total Funded Amount
select sum(loan_amount) from financial_loan;

# Purpose Of Loan
select purpose, sum(loan_amount) from financial_loan group by purpose;


# Total loan Application
select count(id) as Total_Loan_Application from financial_loan;

# Month to date loan Application 
select count(id) as MTdTotal_Loan_Application from financial_loan
where month(issue_date)= 12 and year(issue_date)= 2021;

# Total Funded Amount
select sum(loan_amount) from financial_loan
where month(issue_date)= 12 and year(issue_date)= 2021;

# Total Amount Recieved
select sum(total_payment)as total_amount_recieved from financial_loan;

# Average Intrest Rate
select round( avg(int_rate), 5) * 100 as average_interest_rate from financial_loan;

#Average DTI
select round( avg(dti), 4)* 100 as average_dti from financial_loan;

# GOOD LOAN ISSUED
select 
       (count(case when loan_status = 'Fully Paid' or loan_status = 'Current' then id end) * 100)
       /
       count(id)as good_loan_percentage from financial_loan;
       
#GOOD LOAN APPLICATION
select count(id)as good_loan_application from financial_loan
where loan_status ='Fully Paid' or loan_status = 'current';

# GOOD LOAN FUNDED AMOUNT
select sum(loan_amount) as good_loan_funded_amount from financial_loan
where loan_status = 'Fully Paid' or loan_status = 'current';

#GOOD LOAN AMOUNT RECIEVED
select sum(total_payment) as good_loan_amount_recieved from financial_loan
where loan_status = 'Fully Paid' or loan_status = 'current';

    
 # BAD LOAN ISSUED
 # BAD LOAN PERCENTAGE
select (count(case when loan_status = 'Charged Off' then id end) * 100.0)
/
count(id) as bad_loan_percentage from financial_loan;
    
 #BAD LOAN APPLICATION   
select count(id)as bad_loan_application from financial_loan
where loan_status = 'Charged Off' ;

#BAD LOAN FUNDED AMOUNT    
select sum(loan_amount) as bad_loan_fundeed_amount from financial_loan
where loan_status = 'Charged Off';

#BAD LOAN AMOUNT RECIVED
select sum(total_payment)as bad_amount_loan_recived from financial_loan
where loan_status = 'Charged Off' ;

# LOAN STATUS
select 
       loan_status,
       count(id) as total_loan_application,
       sum(total_payment)as total_amount_received,
       sum(loan_amount)as total_funded_amount,
       avg(int_rate * 100) as intrest_rate,
       avg(dti * 100)as DTI
	from 
         financial_loan
    group by
		loan_status;
        
# MONTHS
select 
      month(issue_date)as Month_number,
      monthname( issue_date) as Month_name,
      count(id) as total_loan_applications,
      sum(loan_amount)as total_funded_amount,
      sum(total_payment)as total_received_amount
from financial_loan
group by  month(issue_date) , monthname( issue_date) 
order by  month(issue_date) ;

# STATE
select 
	  address_state,
	  count(id) as total_loan_applications,
      sum(loan_amount)as total_funded_amount,
      sum(total_payment)as total_received_amount
from financial_loan
group by address_state
order by address_state ;


# TERM
select 
	  term,
	  count(id) as total_loan_applications,
      sum(loan_amount)as total_funded_amount,
      sum(total_payment)as total_received_amount
from financial_loan
group by term
order by term ;

# EMPLOYEE LENGTH
select 
	  emp_length,
	  count(id) as total_loan_applications,
      sum(loan_amount)as total_funded_amount,
      sum(total_payment)as total_received_amount
from financial_loan
group by emp_length
order by emp_length ;

# PURPOSE
select 
	  purpose,
	  count(id) as total_loan_applications,
      sum(loan_amount)as total_funded_amount,
      sum(total_payment)as total_received_amount
from financial_loan
group by purpose
order by purpose ;

# HOME OWNERSHIP
select 
	  home_ownership,
	  count(id) as total_loan_applications,
      sum(loan_amount)as total_funded_amount,
      sum(total_payment)as total_received_amount
from financial_loan
group by home_ownership
order by count(id) desc ;










