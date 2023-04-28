/*   Show all information for those projects whose name contains tax. */
select *
from EMPLOYEE ;

select *
from PROJECT;
select *
from assignment;



/* 2.	Display all information about those projects that is not completed.
(Hint: The project will have an end date if the project is completed) 
*/
select*
from project
where EndDate is null;




/*3.	Find out the earliest start date and latest start date of the projects in WPC using one query. Your query result should only have one row and two columns.
*/
select distinct (startdate)
from project 
where startdate<2015-07-05 and startdate>2015-08-10
order by startdate;




/* 
4.	How many employees are working for each project? Sort the results in descending order of the number of employees.  
*/

select employeenumber, ProjectID
from ASSIGNMENT
order by EmployeeNumber desc ;

/*5.	Show EmployeeNumber, First Name, Last Name, email, HoursWorked, MaxHours, and department name 
for Accounting, Legal or Production departments. Sort the results in ascending order of department. */
select Employee.employeenumber, Firstname, lastname, email, Assignment.hoursworked, project.maxhours, employee.DEPARTMENT
from EMPLOYEE, ASSIGNMENT, project
where employee.Department = 'accounting' or employee.Department ='legal' or employee.Department ='production'
order by department ASC ;


/*6.Find out EmployeeNumber, phone number and email of those employees who have not been assigned to any project and have phone numbers
with 1 as the second digit from the right (e.g. XXX-XXX-XX1X). */
select employee.EmployeeNumber, employee.phone, Employee.email, PROJECT.projectID
from EMPLOYEE, PROJECT,  assignment
where  assignment.projectID is null and employee.phone like '%1_';