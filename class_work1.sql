/** slect**/
select*
from [IT471student];

/** student pass who is younger then 20 and pass**/
select*
from [IT471student]
where FinalGrade >=60 and age<20;

select [firstname]+ ' '+[lastname] as fullname
from it471student


/** joining two table **/
select *
from IT471student, IT471Assignment

select *
from IT471student, IT471Assignment
where IT471student.studentID=IT471Assignment.studentid

/** when only need particular name only like assignment score.**/

select [firstname]+ ' '+[lastname] as fullname, assignmentname, assignmentscore
from IT471student, IT471Assignment
where IT471student.studentID=IT471Assignment.studentid;

/** to find assignment of missing student **/
select firstname, lastname, assignmentname , submissiontime
from IT471student, IT471Assignment
where IT471student.studentID=IT471Assignment.studentid
and submissiontime is null ;

/** but we don't need submisssiontime to show **/
select [firstname]+ ' '+[lastname] as fullname, assignmentname 
from IT471student, IT471Assignment
where IT471student.studentID=IT471Assignment.studentid
and submissiontime is null ;