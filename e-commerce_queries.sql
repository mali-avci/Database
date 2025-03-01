select E.Fname, E.Lname
from employee as E
where exists (select * from dependent where Essn = E.Ssn);

select E.Dno ,Count(*), AVG(E.Salary)
from Employee as E
JOIN department D on E.Dno = D.Dnumber
group by E.Dno;

select P.Pname, Count(W.Pno) as Proj_Emp_Count, SUM(W.Hours) as proj_hours
from works_on as W JOIN project P on W.Pno = P.Pnumber
group by P.Pnumber
HAVING Count(W.Pno) > 1;

SELECT E.Dno, E.Fname, E.Lname, E.Salary, D.Avg_Salary
FROM EMPLOYEE AS E
JOIN (
    SELECT Dno, AVG(Salary) AS Avg_Salary
    FROM EMPLOYEE
    GROUP BY Dno
) AS D ON E.Dno = D.Dno
WHERE E.Salary > D.Avg_Salary;

select E.Fname, E.Lname, SUM(W.Hours) as emp_total_hours
from Employee as E
join works_on as W on E.Ssn = W.Essn
group by E.Ssn;

select E.Fname, E.Lname, E.Salary, H.emp_total_hours, (E.Salary/H.emp_total_hours) as hourly_rate
from employee as E
join (
	select E.Ssn ,E.Fname, E.Lname, SUM(W.Hours) as emp_total_hours
	from Employee as E
	join works_on as W on E.Ssn = W.Essn
	group by E.Ssn
	) as H on E.Ssn = H.Ssn;
    
select E.Fname, E.Lname, E.Salary, SUM(W.Hours), (E.Salary/SUM(W.Hours)) as hourly_rate
from Employee as E
join works_on W on E.Ssn = W.Essn
group by E.Ssn;

WITH DepartmentSalary AS (
    SELECT Dno, SUM(Salary) AS Total_Salary
    FROM Employee
    GROUP BY Dno
)
SELECT Dno, Total_Salary
FROM DepartmentSalary
WHERE Total_Salary = (SELECT MAX(Total_Salary) FROM DepartmentSalary);












