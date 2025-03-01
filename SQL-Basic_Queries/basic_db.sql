CREATE DATABASE Projects;


CREATE TABLE Departments (
	DeptID INT PRIMARY KEY,
	DeptName VARCHAR(50)
);

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(100),
    DeptID INT,
    HireDate DATE,
    Salary DECIMAL(10,2),
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

CREATE TABLE Salaries (
    EmpID INT,
    SalaryAmount DECIMAL(10,2),
    Bonus DECIMAL(10,2),
    PayDate DATE,
    PRIMARY KEY (EmpID, PayDate),
    FOREIGN KEY (EmpID) REFERENCES Employees(EmpID)
);

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100),
    StartDate DATE,
    EndDate DATE
);

CREATE TABLE EmployeeProjects (
    EmpID INT,
    ProjectID INT,
    Role VARCHAR(50),
    PRIMARY KEY (EmpID, ProjectID),
    FOREIGN KEY (EmpID) REFERENCES Employees(EmpID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);

SELECT * FROM EmployeeProjects

-- Insert Data --
INSERT INTO Departments (DeptID, DeptName) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Operations');

INSERT INTO Employees VALUES
(101, 'Alice', 1, '2020-05-10', 55000),
(102, 'Bob', 2, '2019-07-15', 70000),
(103, 'Charlie', 3, '2018-06-20', 65000),
(104, 'David', 2, '2021-08-25', 72000),
(105, 'Eve', 4, '2017-03-14', 60000),
(106, 'Frank', 5, '2016-10-05', 80000),
(107, 'Grace', 1, '2021-09-12', 57000),
(108, 'Hank', 2, '2020-11-20', 75000),
(109, 'Ivy', 3, '2019-04-18', 68000),
(110, 'Jack', 4, '2018-07-22', 62000),
(111, 'Karen', 5, '2017-01-30', 83000),
(112, 'Leo', 1, '2015-06-10', 55000),
(113, 'Mia', 2, '2016-12-05', 71000),
(114, 'Noah', 3, '2022-03-15', 63000),
(115, 'Olivia', 1, '2023-01-20', 58000),
(116, 'Peter', 4, '2022-09-05', 61000),
(117, 'Quinn', 2, '2024-04-10', 73000),
(118, 'Riley', 5, '2023-07-18', 78000),
(119, 'Sophia', 1, '2020-02-28', 56000),
(120, 'Thomas', 3, '2019-11-01', 67000),
(121, 'Ursula', 2, '2021-06-12', 74000),
(122, 'Victor', 4, '2018-12-25', 64000),
(123, 'Wendy', 5, '2017-08-08', 81000),
(124, 'Xavier', 1, '2016-04-15', 59000),
(125, 'Yara', 2, '2023-05-20', 76000),
(126, 'Zachary', 3, '2022-10-30', 69000),
(127, 'Aaliyah', 4, '2021-01-10', 63000),
(128, 'Benjamin', 5, '2020-07-05', 82000),
(129, 'Caleb', 1, '2019-03-22', 57000),
(130, 'Danielle', 2, '2018-09-18', 72000),
(131, 'Ethan', 3, '2017-05-01', 66000),
(132, 'Faith', 4, '2016-11-28', 61000),
(133, 'Gabriel', 5, '2024-02-14', 84000),
(134, 'Hannah', 1, '2023-08-20', 55500),
(135, 'Isaac', 2, '2022-04-12', 71500),
(136, 'Jasmine', 3, '2021-12-05', 68500),
(137, 'Kevin', 4, '2020-06-30', 62500),
(138, 'Lily', 5, '2019-02-25', 80500),
(139, 'Mason', 1, '2018-08-10', 58500),
(140, 'Nora', 2, '2017-04-03', 73500),
(141, 'Owen', 3, '2016-10-18', 65500),
(142, 'Penelope', 4, '2023-03-09', 63500),
(143, 'Quentin', 5, '2022-09-01', 79500),
(144, 'Rachel', 1, '2021-05-22', 56500),
(145, 'Samuel', 2, '2020-11-15', 70500),
(146, 'Taylor', 3, '2019-07-08', 67500),
(147, 'Uma', 4, '2018-03-01', 61500),
(148, 'Vincent', 5, '2017-09-25', 83500),
(149, 'Willow', 1, '2024-01-18', 59500),
(150, 'Xander', 2, '2023-06-10', 75500);


INSERT INTO Salaries  VALUES
(101, 55000, 5000, '2023-12-31'),
(102, 70000, 7000, '2023-12-31'),
(103, 65000, 6500, '2023-12-31'),
(104, 72000, 7200, '2023-12-31'),
(105, 60000, 6000, '2023-12-31'),
(106, 80000, 8000, '2023-12-31'),
(107, 57000, 5500, '2023-12-31'),
(108, 75000, 7200, '2023-12-31'),
(109, 68000, 6800, '2023-12-31'),
(110, 62000, 6200, '2023-12-31'),
(111, 83000, 8300, '2023-12-31'),
(112, 55000, 5500, '2023-12-31'),
(113, 71000, 7100, '2023-12-31'),
(114, 63000, 6300, '2023-12-31'),
(115, 58000, 5800, '2023-12-31'),
(116, 61000, 6100, '2023-12-31'),
(117, 73000, 7300, '2023-12-31'),
(118, 78000, 7800, '2023-12-31'),
(119, 56000, 5600, '2023-12-31'),
(120, 67000, 6700, '2023-12-31'),
(121, 74000, 7400, '2023-12-31'),
(122, 64000, 6400, '2023-12-31'),
(123, 81000, 8100, '2023-12-31'),
(124, 59000, 5900, '2023-12-31'),
(125, 76000, 7600, '2023-12-31'),
(126, 69000, 6900, '2023-12-31'),
(127, 63000, 6300, '2023-12-31'),
(128, 82000, 8200, '2023-12-31'),
(129, 57000, 5700, '2023-12-31'),
(130, 72000, 7200, '2023-12-31'),
(131, 66000, 6600, '2023-12-31'),
(132, 61000, 6100, '2023-12-31'),
(133, 84000, 8400, '2023-12-31'),
(134, 55500, 5550, '2023-12-31'),
(135, 71500, 7150, '2023-12-31'),
(136, 68500, 6850, '2023-12-31'),
(137, 62500, 6250, '2023-12-31'),
(138, 80500, 8050, '2023-12-31'),
(139, 58500, 5850, '2023-12-31'),
(140, 73500, 7350, '2023-12-31'),
(141, 65500, 6550, '2023-12-31'),
(142, 63500, 6350, '2023-12-31'),
(143, 79500, 7950, '2023-12-31'),
(144, 56500, 5650, '2023-12-31'),
(145, 70500, 7050, '2023-12-31'),
(146, 67500, 6750, '2023-12-31'),
(147, 61500, 6150, '2023-12-31'),
(148, 83500, 8350, '2023-12-31'),
(149, 59500, 5950, '2023-12-31'),
(150, 75500, 7550, '2023-12-31');



INSERT INTO Projects VALUES

(1, 'AI Automation', '2022-01-01', '2022-12-31'),
(2, 'Cloud Migration', '2023-03-15', '2023-12-31'),
(3, 'Market Expansion', '2022-06-01', '2023-06-01'),
(4, 'Cybersecurity Upgrade', '2021-05-01', '2022-05-01'),
(5, 'Data Warehouse Implementation', '2023-01-10', '2023-10-15'),
(6, 'Mobile App Redesign', '2024-02-01', '2024-11-30'),
(7, 'Supply Chain Optimization', '2023-08-01', '2024-05-31'),
(8, 'Customer Relationship Management (CRM) Upgrade', '2022-10-15', '2023-09-30'),
(9, 'E-commerce Platform Enhancement', '2024-01-01', '2024-08-31'),
(10, 'Employee Training Program', '2023-05-01', '2023-12-31'),
(11, 'New Product Launch', '2024-03-15', '2024-12-15'),
(12, 'Financial System Overhaul', '2022-11-01', '2023-10-31'),
(13, 'Global Website Localization', '2023-09-10', '2024-06-30'),
(14, 'Sustainability Initiative', '2024-04-01', '2025-03-31'),
(15, 'Internal Knowledge Base Development', '2023-07-01', '2024-01-31'),
(16, 'Remote Work Infrastructure Upgrade', '2024-05-15', '2025-02-28'),
(17, 'Predictive Analytics Implementation', '2022-12-01', '2023-11-30'),
(18, 'Social Media Marketing Campaign', '2023-10-20', '2024-07-20'),
(19, 'Inventory Management System Update', '2024-06-01', '2024-12-31'),
(20, 'Research and Development of Next-Gen Technology', '2023-06-15', '2025-06-15');


INSERT INTO EmployeeProjects  VALUES
(111, 4, 'Security Analyst'),
(112, 5, 'Data Analyst'),
(113, 2, 'Software Architect'),
(114, 1, 'Machine Learning Engineer'),
(115, 3, 'Business Analyst'),
(116, 5, 'Database Administrator'),
(117, 4, 'Penetration Tester'),
(118, 2, 'Frontend Developer'),
(119, 1, 'Data Scientist'),
(120, 3, 'Project Coordinator'),
(121, 5, 'ETL Developer'),
(122, 4, 'Security Engineer'),
(123, 2, 'Backend Developer'),
(124, 1, 'AI Researcher'),
(125, 3, 'Sales Manager'),
(126, 5, 'BI Developer'),
(127, 4, 'Compliance Officer'),
(128, 2, 'UI/UX Designer'),
(129, 1, 'Algorithm Developer'),
(130, 3, 'Product Manager'),
(131, 5, 'Data Modeler'),
(132, 4, 'Network Engineer'),
(133, 2, 'DevOps Engineer'),
(134, 1, 'NLP Engineer'),
(135, 3, 'Regional Manager'),
(136, 5, 'Data Warehouse Architect'),
(137, 4, 'Incident Responder'),
(138, 2, 'QA Engineer'),
(139, 1, 'Computer Vision Engineer'),
(140, 3, 'Brand Manager'),
(141, 5, 'Data Governance Specialist'),
(142, 4, 'Security Consultant'),
(143, 2, 'Technical Lead'),
(144, 1, 'Robotics Engineer'),
(145, 3, 'Channel Manager'),
(146, 5, 'Data Integration Specialist'),
(147, 4, 'Security Auditor'),
(148, 2, 'Mobile Developer'),
(149, 1, 'Deep Learning Engineer'),
(150, 3, 'Communications Manager');



SELECT * FROM Departments;
SELECT * FROM Employees;
SELECT * FROM Salaries;
SELECT * FROM Projects;
SELECT * FROM EmployeeProjects;
