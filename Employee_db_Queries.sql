-- 1. List the following details of each employee: employee number, last name, first name,
-- gender, and salary.

SELECT * FROM Employee_Data;

SELECT Employee_Data.Employee_Number, Employee_Data.Last_Name, Employee_Data.First_Name, 
Employee_Data.Gender, Salaries.Salary
FROM Salaries
INNER JOIN Employee_Data ON
Employee_Data.Employee_Number=Salaries.Salary
ORDER BY Last_Name;

-- 2. List employees who were hired in 1986
--SELECT Hire_Date FROM Employee_Data
SELECT * FROM Employee_Data WHERE YEAR(Hire_Date) LIKE '%1986';
--SELECT * FROM Employee_Data WHERE H1996;

--3. List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name, and start and end 
--employment dates.
SELECT Department_Mgr.Department_Number, Departments.Department_Name, Employee_Data.Last_Name, 
Employee_Data.First_Name, Department_Mgr.From_date, Department_Mgr.To_Date
FROM Department_Mgr
LEFT JOIN Employee_Data
ON Employee_Data.Employee_Number = Department_Mgr.Employee_Number
LEFT JOIN Departments
ON Departments.Department_Number = Department_Mgr.Department_Number
ORDER BY Last_Name;

--4. List the department of each employee with the following information: employee number, last name, 
--first name, and department name.
SELECT Employee_Data.Employee_Number, Employee_Data.Last_Name, Employee_Data.First_Name, 
Employee_Time.Department_Number, Departments.Department_Name
FROM Employee_Data
LEFT JOIN Employee_Time
ON Employee_Time.Employee_Number = Employee_Data.Employee_Number
LEFT JOIN Departments
ON Employee_Time.Department_Number = Departments.Department_Number
ORDER BY Last_Name;

--5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM Employee_Data WHERE Last_Name LIKE 'B%' AND First_Name='Hercules'
ORDER BY Last_Name;

--6. List all employees in the Sales department, including their employee number, last name, 
--first name, and department name.
SELECT Employee_Data.Employee_Number, Employee_Data.Last_Name, Employee_Data.First_Name, 
Employee_Time.Department_Number, Departments.Department_Name
FROM Employee_Data
LEFT JOIN Employee_Time
ON Employee_Time.Employee_Number = Employee_Data.Employee_Number
LEFT JOIN Departments
ON Employee_Time.Department_Number = Departments.Department_Number
WHERE Department_Name='Sales'
ORDER BY Last_Name;

--7. List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
SELECT Employee_Data.Employee_Number, Employee_Data.Last_Name, Employee_Data.First_Name, 
Employee_Time.Department_Number, Departments.Department_Name
FROM Employee_Data
LEFT JOIN Employee_Time
ON Employee_Time.Employee_Number = Employee_Data.Employee_Number
LEFT JOIN Departments
ON Departments.Department_Number = Employee_Time.Department_Number
WHERE Department_Name='Sales'
AND Department_Name='Development'
ORDER BY Last_Name;

--8. In descending order, list the frequency count of employee last names, i.e., how many employees 
--share each last name.
SELECT Last_Name, COUNT(Last_Name) AS FREQUENCY
FROM Employee_Data
GROUP BY Last_Name
ORDER BY COUNT(Last_Name) DESC;