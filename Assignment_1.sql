/** Assignemnt_1 **/

select [firstname]+ ' '+[lastname] as Student, age
from IT471Assignment, IT471Student
where Age<21 ;


/** list all which is not graded **/
select AssignmentID, Assignmentscore 
from IT471Assignment
where Assignmentscore is null;

/** late assignment submission **/
select AssignmentID, submissiontime
from IT471Assignment
where submissiontime is null;

/** student who miss their assignment and their firstname, and lastname. **/
select distinct firstname, lastname, AssignmentScore
from IT471Student, IT471Assignment
where AssignmentScore is null;


/** list student with nuber of missing assingnment and sort result with most missing at top and least ant bottom.**/
select distinct [firstname], [lastname] , count (Assignmentscore) as missingassignment
from IT471Assignment, IT471Student
where  Assignmentscore is null
group by  firstname, lastname
order by  missingassignment desc;
