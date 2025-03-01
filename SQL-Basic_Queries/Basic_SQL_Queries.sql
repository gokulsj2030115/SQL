USE Projects;

-- SELECT CLAUSE --

SELECT * FROM Departments;
SELECT * FROM Employees;
SELECT * FROM Salaries;
SELECT * FROM Projects;
SELECT * FROM EmployeeProjects;

-- WHERE CLAUSE --

SELECT * FROM Departments WHERE DeptID = 1;
SELECT * FROM Employees WHERE EmpID = 101;
SELECT * FROM Salaries WHERE SalaryAmount > 55000;
SELECT * FROM Projects WHERE ProjectName = 'AI Automation';
SELECT * FROM EmployeeProjects WHERE ProjectID = 1;

-- ORDER BY --

SELECT * FROM Salaries 
ORDER BY SalaryAmount;

SELECT * FROM Salaries 
ORDER BY SalaryAmount DESc;

-- LIMIT --

SELECT TOP 10 * FROM EmployeeProjects; 
/* In Microsoft SQL Server, the LIMIT keyword is not supported. Instead, we use TOP to retrieve a specific number of rows */



-- 1. Retrieve all employees from the Employees table. --

SELECT * FROM Employees;


-- 2. Find details of the department with DeptID = 3. --

SELECT * FROM Departments
WHERE DeptID = 3;


-- 3. Get information on employees hired after ‘2020-01-01’. --

SELECT * FROM Employees
WHERE HireDate > '2020-01-01';


-- 4. Find all employees with a salary greater than 70,000. --

SELECT * FROM Employees
WHERE Salary > 70000;


-- 5. Show all employees who belong to the IT department. --

SELECT * FROM Employees
WHERE DeptID IN (
    SELECT DeptID FROM Departments
    WHERE DeptName LIKE 'IT'
);



					-- Sorting Data (ORDER BY) --

-- 6. Retrieve all salaries in descending order. --

SELECT * FROM Salaries
ORDER BY SalaryAmount DESC;


-- 7. List all projects sorted by their start date. --

SELECT * FROM Projects
ORDER BY StartDate;


-- 8. Find all employees sorted by their hiring date (oldest first). --

SELECT * FROM Employees
ORDER BY HireDate;



					-- Limiting Results (TOP) --

-- 9. Retrieve the top 5 highest-paid employees. --

SELECT TOP 5 * FROM Salaries
ORDER BY SalaryAmount DESC;


-- Retrieve the top 5 highest-paid employees (Incl. Bonus amount). --

SELECT TOP 5 *,
(SalaryAmount + Bonus) AS Total_Salary
FROM Salaries
ORDER BY Total_Salary DESC;


-- 10. Find the top 3 longest-running projects (by duration). --

SELECT TOP 3 *,
DATEDIFF(day, StartDate, EndDate) AS Duration
FROM Projects
ORDER BY DATEDIFF(day, StartDate, EndDate) DESC;


-- 11. Display the first 10 employees in the Employees table. --

SELECT TOP 10 * FROM Employees
ORDER BY EmpID;



					-- Removing Duplicates (DISTINCT) --

-- 12. Find all unique departments employees work in. --

SELECT DISTINCT DeptID FROM Employees;


-- 13. Retrieve all distinct project IDs from EmployeeProjects. --

SELECT DISTINCT ProjectID FROM EmployeeProjects;



					-- Aggregations & Grouping (COUNT, SUM, AVG, MIN, MAX, GROUP BY, HAVING) --


-- 14. Find the total number of employees --

SELECT COUNT(DISTINCT EmpID) AS Total_Emp FROM Employees;


-- 15. Calculate the total salary paid to employees. --

SELECT SUM(SalaryAmount + Bonus) AS Total_Salary FROM Salaries;


-- 16. Find the average bonus paid to employees. --

SELECT AVG(Bonus) AS Avg_BonusAmount FROM Salaries;


-- 17. Find the minimum and maximum salary in the company. --

SELECT MIn(SalaryAmount) AS MinimumSalary, 
       MAX(SalaryAmount) AS MaximumSalary 
FROM Salaries;


-- 18. Find employees with an average salary greater than 75,000. --

SELECT EmpID
FROM Salaries
GROUP BY EmpID
HAVING AVG(SalaryAmount) > 75000;


-- 19. Find the total number of employees in each department. --

SELECT DeptID, COUNT(EmpID) AS TotalEmployees
FROM Employees
GROUP BY DeptID;


-- 20. Find departments where the total salary paid is greater than 800,000. --

SELECT DeptID, SUM(Salary) AS Tot_Sal
FROM Employees
GROUP BY DeptID
HAVING SUM(Salary) > 800000;


-- 21. Find projects where more than 3 employees are assigned. --

SELECT ProjectID, COUNT(EmpID) AS Tot_Emp
FROM EmployeeProjects
GROUP BY ProjectID
HAVING COUNT(EmpID) > 3;



					-- JOINS --


-- 22. Retrieve employee names along with their department names. --

SELECT e.Name, d.DeptName
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID;


-- 23. Find employees and the projects they are working on. --

SELECT e.EmpID, e.Name AS EmployeeName, p.ProjectID, p.ProjectName, ep.Role
FROM EmployeeProjects ep
INNER JOIN Employees e ON ep.EmpID = e.EmpID
INNER JOIN Projects p ON ep.ProjectID = p.ProjectID;


-- 24. Retrieve all employees and their project assignments --

SELECT e.EmpID, e.Name, e.DeptID, ep.ProjectID, ep.Role
FROM Employees e
LEFT JOIN EmployeeProjects ep ON e.EmpID = ep.EmpID;


-- 25. List all departments and the employees working in them --

SELECT e.EmpID, e.Name, d.DeptName
FROM Employees e
LEFT JOIN Departments d ON e.DeptID = d.DeptId;


-- 26. Show all projects and employees assigned to them (include projects even if no employees are assigned) --

SELECT p.ProjectName, e.EmpID, e.Name AS Emp_Name, ep.Role
FROM Employees e
RIGHT JOIN EmployeeProjects ep ON e.EmpID = ep.EmpID
RIGHT JOIN Projects p On p.ProjectID = ep.ProjectID;


-- 27. List all departments and employees (include departments even if they have no employees). --

SELECT d.DeptID, d.DeptName, e.Name
FROM Departments d
RIGHT JOIN Employees e ON d.DeptID = e.DeptID;


-- 28. Retrieve all departments and employees (include departments with no employees and employees without departments) --

SELECT d.DeptID, d.DeptName, e.EmpID, e.Name
FROM Departments d
FULL OUTER JOIN Employees e ON d.DeptID = e.DeptID;


-- 29. List all possible employee-project combinations. --

SELECT d.DeptName, e.Name 
FROM Departments d
CROSS JOIN Employees e;


-- 30. Find employees who have the same hire date as another employee. --

SELECT e.EmpID, e.name, e1.HireDate
FROM Employees e
JOIN Employees e1 ON e.HireDate = e1.HireDate
AND e.EmpID <> e1.EmpID;
