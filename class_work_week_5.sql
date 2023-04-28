select top(1)lastname, age
from [IT471Assignment], [IT471Student]
where [IT471Assignment].StudentID=[IT471Student].StudentID
AND [Assignmentname]='assignemnt_4' 
AND [submissiontime] IS NOT NULL
ORDER BY age ASC



/** show student with late submission**/
select *
from [student].[dbo].[IT471Assignment]

/** average score**/
select assignmentname, avg (assignmentscore) as avereage_score
from [student].[dbo].[IT471Assignment]
Group by assignmentname


/** lowest score**/
select assignmentname, MIN (assignmentscore) as lowest_score
from [student].[dbo].[IT471Assignment]
Group by assignmentname
Order by Lowest_score asc

/** lowest score, average_socre, max_score, STDEV**/
select assignmentname, MIN (assignmentscore) as lowest_score,
Max(AssignmentScore) as Max_score,
STDEV(Assignmentscore) as STD,
var(AssignmentScore)as varience
from [student].[dbo].[IT471Assignment]
Group by assignmentname
Order by Lowest_score asc

/** how do we keep only two dfigits **/
select assignmentname, MIN (assignmentscore) as lowest_score,
Max(AssignmentScore) as Max_score,
round(STDEV(Assignmentscore), 2) as STD,
round(var(AssignmentScore), 2)as varience
from [student].[dbo].[IT471Assignment]
Group by assignmentname
Order by Lowest_score asc


/** using group by and count function , find assignmentname submitted late **/
select assignmentname, count(*)
from IT471Assignment
where submissiontime>duedate
group by assignmentname

/** using HAVING AND COUNT Together
we use this to make result sorter or aggregate from multiple rows **/
select assignmentname, count(*)
from IT471Assignment
where submissiontime>duedate
group by assignmentname
having count(*)>1

/** example_1
show a loist of student (lastname and firstname) with their number of garded submissions, 
avg score as min/max, but only for student whose average score is greater then 80

**/


/** NOTE WE ONLY USE REAL NAME IN WHERE FUNCTION LIKE ASSIGNEMNTSCORE NOT AVE(ASSIGNMENTSCORE)
**/

select [firstname], [lastname],count(*) as number_graded, avg(assignmentscore) as avg_score,
max(assignmentscore) as max_score, min(assignmentscore) as min_score
from [IT471Assignment], [IT471Student]
where IT471Assignment.studentid=IT471Student.StudentID
and assignmentscore is not null
group by LastName, FirstName
having avg(assignmentscore)>=80;

