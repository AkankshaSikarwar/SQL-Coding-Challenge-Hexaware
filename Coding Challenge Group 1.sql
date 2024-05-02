-- 1. Provide a SQL script that initializes the database for the Job Board scenario “CareerHub”. 

-- Droping the database if it exists and create a new one named "CareerHub"
DROP DATABASE IF EXISTS CareerHub;
CREATE DATABASE CareerHub;
USE CareerHub;

-- 2. Create tables for Companies, Jobs, Applicants and Applications. 
-- 3. Define appropriate primary keys, foreign keys, and constraints. 
-- 4. Ensure the script handles potential errors, such as if the database or tables already exist.

-- Droping existing tables if they exist
DROP TABLE IF EXISTS Companies;
DROP TABLE IF EXISTS Jobs;
DROP TABLE IF EXISTS Applicants;
DROP TABLE IF EXISTS Applications;

-- Creating table for companies
CREATE TABLE Companies (
    CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(255),
    Location VARCHAR(255)
);

-- Creating table for jobs
CREATE TABLE Jobs (
    JobID INT PRIMARY KEY,
    CompanyID INT,
    JobTitle VARCHAR(255),
    JobDescription TEXT,
    JobLocation VARCHAR(255),
    Salary DECIMAL(10, 2),
    JobType VARCHAR(50),
    PostedDate DATETIME,
    FOREIGN KEY (CompanyID) REFERENCES Companies(CompanyID)
);

-- Creating table for applicants
CREATE TABLE Applicants (
    ApplicantID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(255),
    Phone VARCHAR(20),
    Resume TEXT
);

-- Creating table for applications
CREATE TABLE Applications (
    ApplicationID INT PRIMARY KEY,
    JobID INT,
    ApplicantID INT,
    ApplicationDate DATETIME,
    CoverLetter TEXT,
    FOREIGN KEY (JobID) REFERENCES Jobs(JobID),
    FOREIGN KEY (ApplicantID) REFERENCES Applicants(ApplicantID)
);

-- Inserting data into Companies table
INSERT INTO Companies (CompanyID, CompanyName, Location)
VALUES 
    (1, 'Hexaware', 'Mumbai'),
    (2, 'Tata Consultancy Services', 'Chennai'),
    (3, 'Infosys', 'Bangalore'),
    (4, 'Wipro', 'Hyderabad'),
    (5, 'Tech Mahindra', 'Pune'),
    (6, 'HCL Technologies', 'Noida'),
    (7, 'IBM India', 'Gurgaon'),
    (8, 'Accenture India', 'Kolkata'),
    (9, 'Cognizant Technology Solutions', 'Chennai'),
    (10, 'Capgemini India', 'Mumbai'),
    (11, 'Mindtree', 'Bangalore'),
    (12, 'Persistent Systems', 'Pune'),
    (13, 'Mphasis', 'Bangalore'),
    (14, 'L&T Infotech', 'Mumbai'),
    (15, 'NIIT Technologies', 'Noida');
-- Data for 15 companies in various locations

-- Inserting data into Jobs table
INSERT INTO Jobs (JobID, CompanyID, JobTitle, JobDescription, JobLocation, Salary, JobType, PostedDate)
VALUES 
    (1, 1, 'Software Developer', 'We are looking for skilled software developers to join our team.', 'Mumbai', 100000.00, 'Full-time', '2024-05-02 10:00:00'),
    (2, 2, 'Data Analyst', 'We are hiring data analysts to analyze and interpret complex data sets.', 'Chennai', 90000.00, 'Contract', '2024-05-02 09:30:00'),
    (3, 3, 'Network Engineer', 'We are seeking network engineers to design, implement, and maintain our network infrastructure.', 'Bangalore', 110000.00, 'Full-time', '2024-05-02 11:45:00'),
    (4, 4, 'Java Developer', 'We are seeking experienced Java developers to work on our enterprise projects.', 'Hyderabad', 95000.00, 'Full-time', '2024-05-02 12:30:00'),
    (5, 5, 'Python Developer', 'We are looking for Python developers to develop and maintain scalable applications.', 'Pune', 80000.00, 'Part-time', '2024-05-02 14:00:00'),
    (6, 6, 'Software Engineer', 'We are hiring software engineers to develop innovative solutions for our clients.', 'Noida', 105000.00, 'Contract', '2024-05-02 15:15:00'),
    (7, 7, 'Data Scientist', 'We are seeking skilled data scientists to analyze and interpret large datasets.', 'Gurgaon', 120000.00, 'Full-time', '2024-05-02 16:30:00'),
    (8, 8, 'Web Developer', 'We are looking for web developers to create and maintain user-friendly web applications.', 'Kolkata', 60000.00, 'Full-time', '2024-05-02 17:45:00'),
    (9, 9, 'Frontend Developer', 'We are seeking frontend developers to implement user interface components.', 'Chennai', 95000.00, 'Contract', '2024-05-02 18:00:00'),
    (10, 10, 'DevOps Engineer', 'We are hiring DevOps engineers to automate and streamline our operations processes.', 'Mumbai', 110000.00, 'Part-time', '2024-05-02 19:15:00'),
    (11, 11, 'UI/UX Designer', 'We are looking for talented UI/UX designers to create engaging user experiences.', 'Bangalore', 105000.00, 'Full-time', '2024-05-02 20:30:00'),
    (12, 12, 'Database Administrator', 'We are seeking experienced database administrators to manage our databases.', 'Pune', 100000.00, 'Contract', '2024-05-02 21:45:00'),
    (13, 13, 'Software Tester', 'We are hiring software testers to ensure the quality of our software products.', 'Bangalore', 95000.00, 'Part-time', '2024-05-02 22:00:00'),
    (14, 14, 'Business Analyst', 'We are seeking business analysts to analyze business processes and recommend improvements.', 'Mumbai', 75000.00, 'Full-time', '2024-05-02 23:15:00'),
    (15, 15, 'System Administrator', 'We are looking for system administrators to manage and maintain our IT infrastructure.', 'Noida', 100000.00, 'Part-time', '2024-05-02 23:45:00'),
    (16, 1, 'Software Engineer II', 'We are seeking experienced software engineers to develop innovative solutions for our clients.', 'Mumbai', 115000.00, 'Full-time', '2024-05-03 10:00:00'),
    (17, 2, 'Machine Learning Engineer', 'We are hiring machine learning engineers to develop advanced algorithms.', 'Chennai', 125000.00, 'Contract', '2024-05-03 09:30:00'),
    (18, 3, 'Systems Analyst', 'We are seeking systems analysts to analyze and optimize our IT systems.', 'Bangalore', 120000.00, 'Full-time', '2024-05-03 11:45:00'),
    (19, 4, 'Frontend Developer II', 'We are looking for experienced frontend developers to create responsive user interfaces.', 'Hyderabad', 65000.00, 'Part-time', '2024-05-03 12:30:00');
 -- Data for 19 job listings

-- Inserting data into Applicants table
INSERT INTO Applicants (ApplicantID, FirstName, LastName, Email, Phone, Resume)
VALUES 
    (1, 'Rahul', 'Gupta', 'rahulgupta@example.com', '123-456-7890', 'Rahul_Gupta_Resume.pdf'),
    (2, 'Priya', 'Sharma', 'priyasharma@example.com', '456-789-0123', 'Priya_Sharma_Resume.pdf'),
    (3, 'Amit', 'Patel', 'amitpatel@example.com', '789-012-3456', 'Amit_Patel_Resume.pdf'),
    (4, 'Neha', 'Singh', 'nehasingh@example.com', '012-345-6789', 'Neha_Singh_Resume.pdf'),
    (5, 'Deepak', 'Kumar', 'deepakkumar@example.com', '345-678-9012', 'Deepak_Kumar_Resume.pdf'),
    (6, 'Pooja', 'Mehta', 'poojamehta@example.com', '678-901-2345', 'Pooja_Mehta_Resume.pdf'),
    (7, 'Raj', 'Verma', 'rajverma@example.com', '901-234-5678', 'Raj_Verma_Resume.pdf'),
    (8, 'Anita', 'Joshi', 'anitajoshi@example.com', '234-567-8901', 'Anita_Joshi_Resume.pdf'),
    (9, 'Arun', 'Yadav', 'arunyadav@example.com', '567-890-1234', 'Arun_Yadav_Resume.pdf'),
    (10, 'Kavita', 'Rao', 'kavitarao@example.com', '890-123-4567', 'Kavita_Rao_Resume.pdf'),
    (11, 'Vivek', 'Mishra', 'vivekmishra@example.com', '123-456-7890', 'Vivek_Mishra_Resume.pdf'),
    (12, 'Sneha', 'Gupta', 'snehagupta@example.com', '234-567-8901', 'Sneha_Gupta_Resume.pdf'),
    (13, 'Manoj', 'Shah', 'manojshah@example.com', '567-890-1234', 'Manoj_Shah_Resume.pdf'),
    (14, 'Kritika', 'Pandey', 'kritikapandey@example.com', '890-123-4567', 'Kritika_Pandey_Resume.pdf'),
    (15, 'Aarav', 'Choudhary', 'aaravchoudhary@example.com', '123-456-7890', 'Aarav_Choudhary_Resume.pdf');
-- Data for 15 applicants with years of experience

-- Inserting data into Applications table for job applications
INSERT INTO Applications (ApplicationID, JobID, ApplicantID, ApplicationDate, CoverLetter)
VALUES 
    (1, 1, 1, '2024-05-02 10:00:00', 'Dear Hiring Manager, I am excited to apply for the Software Developer position at Hexaware. I believe my skills and experience make me a strong candidate for this role.'),
    (2, 2, 2, '2024-05-02 09:30:00', 'To Whom It May Concern, I am writing to express my interest in the Data Analyst position at Tata Consultancy Services. Please find my resume attached for your review.'),
    (3, 3, 3, '2024-05-02 11:45:00', 'Hello, I am eager to apply for the Network Engineer position at Infosys. I am confident that my network engineering skills and experience align well with the requirements of this role.'),
    (4, 4, 4, '2024-05-02 12:30:00', 'Dear Hiring Team, I am excited to apply for the Java Developer position at Wipro. Please find my resume attached.'),
    (5, 2, 9, '2024-05-02 14:00:00', 'To Whom It May Concern, I am writing to express my interest in the Data Analyst position at Tata Consultancy Services. Please find my resume attached for your review.'),
    (6, 6, 6, '2024-05-02 15:15:00', 'Hello, I am eager to apply for the Software Engineer position at HCL Technologies. I am confident that my skills and experience make me a suitable candidate for this role.'),
    (7, 12, 7, '2024-05-02 16:30:00', 'Hello, I am eager to apply for the Database Administrator position at Persistent Systems. I am confident that my database administration skills make me a strong candidate for this role.'),
    (8, 8, 8, '2024-05-02 17:45:00', 'To Whom It May Concern, I am excited to apply for the Web Developer position at Accenture India. I believe my web development skills and experience make me a great fit for this role.'),
    (9, 9, 9, '2024-05-02 18:00:00', 'Hello, I am eager to apply for the Frontend Developer position at Cognizant Technology Solutions. Please find my resume attached for your consideration.'),
    (10, 10, 10, '2024-05-02 19:15:00', 'Dear Hiring Team, I am writing to express my interest in the DevOps Engineer position at Capgemini India. Please find my resume attached for your review.'),
    (11, 11, 14, '2024-05-02 20:30:00', 'To Whom It May Concern, I am excited to apply for the UI/UX Designer position at Mindtree. I believe my design skills and experience make me a suitable candidate for this role.'),
    (12, 12, 12, '2024-05-02 21:45:00', 'Hello, I am eager to apply for the Database Administrator position at Persistent Systems. I am confident that my database administration skills make me a strong candidate for this role.'),
    (13, 13, 13, '2024-05-02 22:00:00', 'Dear Hiring Manager, I am writing to express my interest in the Software Tester position at Mphasis. Please find my resume attached for your review.'),
    (14, 14, 14, '2024-05-02 23:15:00', 'To Whom It May Concern, I am excited to apply for the Business Analyst position at L&T Infotech. I believe my analytical skills and experience make me a strong candidate for this role.'),
    (15, 15, 15, '2024-05-02 23:45:00', 'Hello, I am eager to apply for the System Administrator position at NIIT Technologies. I am confident that my IT skills and experience align well with the requirements of this role.');
-- Data for 15 job applications

-- 5. Write an SQL query to count the number of applications received for each job listing in the 
-- "Jobs" table. Display the job title and the corresponding application count. Ensure that it lists all 
-- jobs, even if they have no applications.
SELECT Jobs.JobTitle, COUNT(Applications.ApplicationID) AS ApplicationCount
FROM Jobs
LEFT JOIN Applications ON Jobs.JobID = Applications.JobID
GROUP BY Jobs.JobID;

-- 6. Develop an SQL query that retrieves job listings from the "Jobs" table within a specified salary 
-- range. Allow parameters for the minimum and maximum salary values. Display the job title, 
-- company name, location, and salary for each matching job.
SELECT Jobs.JobTitle, Companies.CompanyName, Jobs.JobLocation, Jobs.Salary
FROM Jobs
INNER JOIN Companies ON Jobs.CompanyID = Companies.CompanyID
WHERE Jobs.Salary BETWEEN 80000 AND 100000;

-- 7. Write an SQL query that retrieves the job application history for a specific applicant. Allow a 
-- parameter for the ApplicantID, and return a result set with the job titles, company names, and 
-- application dates for all the jobs the applicant has applied to.
SELECT Jobs.JobTitle, Companies.CompanyName, Applications.ApplicationDate
FROM Jobs
INNER JOIN Applications ON Jobs.JobID = Applications.JobID
INNER JOIN Companies ON Jobs.CompanyID = Companies.CompanyID
WHERE Applications.ApplicantID = 14;

-- 8. Create an SQL query that calculates and displays the average salary offered by all companies for 
-- job listings in the "Jobs" table. Ensure that the query filters out jobs with a salary of zero.
SELECT AVG(Salary) AS AverageSalary
FROM Jobs
WHERE Salary > 0;

-- 9. Write an SQL query to identify the company that has posted the most job listings. Display the 
-- company name along with the count of job listings they have posted. Handle ties if multiple 
-- companies have the same maximum count.
SELECT Companies.CompanyName, COUNT(*) AS JobCount
FROM Jobs
INNER JOIN Companies ON Jobs.CompanyID = Companies.CompanyID
GROUP BY Jobs.CompanyID
HAVING COUNT(*) = (
    SELECT MAX(JobCounts.Count)
    FROM (
        SELECT COUNT(*) AS Count
        FROM Jobs
        GROUP BY CompanyID
    ) AS JobCounts
);

-- 10. Find the applicants who have applied for positions in companies located in 'CityX' and have at 
-- least 3 years of experience.

-- asked to leave

-- 11. Retrieve a list of distinct job titles with salaries between $60,000 and $80,000.
SELECT DISTINCT JobTitle
FROM Jobs
WHERE Salary BETWEEN 60000 AND 80000;

-- 12. Find the jobs that have not received any applications.
SELECT *
FROM Jobs
WHERE JobID NOT IN (SELECT DISTINCT JobID FROM Applications);

-- 13. Retrieve a list of job applicants along with the companies they have applied to and the positions 
-- they have applied for.
SELECT A.FirstName, A.LastName, C.CompanyName, J.JobTitle
FROM Applicants A
INNER JOIN Applications Ap ON A.ApplicantID = Ap.ApplicantID
INNER JOIN Jobs J ON Ap.JobID = J.JobID
INNER JOIN Companies C ON J.CompanyID = C.CompanyID;

-- 14. Retrieve a list of companies along with the count of jobs they have posted, even if they have not 
-- received any applications.
SELECT C.CompanyName,COUNT(J.JobID) AS JobCount
FROM Companies C
LEFT JOIN Jobs J ON C.CompanyID = J.CompanyID
GROUP BY C.CompanyName;

-- 15. List all applicants along with the companies and positions they have applied for, including those 
-- who have not applied.
SELECT A.FirstName, A.LastName, C.CompanyName, J.JobTitle
FROM Applicants A
LEFT JOIN Applications Ap ON A.ApplicantID = Ap.ApplicantID
LEFT JOIN Jobs J ON Ap.JobID = J.JobID
LEFT JOIN Companies C ON J.CompanyID = C.CompanyID;

-- 16. Find companies that have posted jobs with a salary higher than the average salary of all jobs.
SELECT DISTINCT C.CompanyName
FROM Companies C
INNER JOIN Jobs J ON C.CompanyID = J.CompanyID
WHERE J.Salary > (SELECT AVG(Salary) FROM Jobs);

-- 17. Display a list of applicants with their names and a concatenated string of their city and state.
-- Update City and State for each applicant
ALTER TABLE Applicants
ADD COLUMN City VARCHAR(255),
ADD COLUMN State VARCHAR(255);

UPDATE Applicants
SET City = 'Mumbai', State = 'Maharashtra'
WHERE ApplicantID = 1; -- For Rahul Gupta

UPDATE Applicants
SET City = 'Chennai', State = 'Tamil Nadu'
WHERE ApplicantID = 2; -- For Priya Sharma

UPDATE Applicants
SET City = 'Ahmedabad', State = 'Gujarat'
WHERE ApplicantID = 3; -- For Amit Patel

UPDATE Applicants
SET City = 'Indore', State = 'Madhya Pradesh'
WHERE ApplicantID = 4; -- For Neha Singh

UPDATE Applicants
SET City = 'Kolkata', State = 'West Bengal'
WHERE ApplicantID = 5; -- For Deepak Kumar

UPDATE Applicants
SET City = 'Pune', State = 'Maharashtra'
WHERE ApplicantID = 6; -- For Pooja Mehta

UPDATE Applicants
SET City = 'Jaipur', State = 'Rajasthan'
WHERE ApplicantID = 7; -- For Raj Verma

UPDATE Applicants
SET City = 'Hyderabad', State = 'Telangana'
WHERE ApplicantID = 8; -- For Anita Joshi

UPDATE Applicants
SET City = 'Bangalore', State = 'Karnataka'
WHERE ApplicantID = 9; -- For Arun Yadav

UPDATE Applicants
SET City = 'Lucknow', State = 'Uttar Pradesh'
WHERE ApplicantID = 10; -- For Kavita Rao

UPDATE Applicants
SET City = 'Indore', State = 'Madhya Pradesh'
WHERE ApplicantID = 11; -- For Vivek Mishra

UPDATE Applicants
SET City = 'Chandigarh', State = 'Punjab'
WHERE ApplicantID = 12; -- For Sneha Gupta

UPDATE Applicants
SET City = 'Bhopal', State = 'Madhya Pradesh'
WHERE ApplicantID = 13; -- For Manoj Shah

UPDATE Applicants
SET City = 'Nagpur', State = 'Maharashtra'
WHERE ApplicantID = 14; -- For Kritika Pandey

UPDATE Applicants
SET City = 'Surat', State = 'Gujarat'
WHERE ApplicantID = 15; -- For Aarav Choudhary

SELECT 
    CONCAT(FirstName, ' ', LastName) AS FullName,
    CONCAT(City, ', ', State) AS CityAndState
FROM 
    Applicants;

-- 18. Retrieve a list of jobs with titles containing either 'Developer' or 'Engineer'.

-- since no specific columns are specified therefore retrieving all columns
SELECT *
FROM Jobs
WHERE JobTitle LIKE '%Developer%' OR JobTitle LIKE '%Engineer%';

-- 19. Retrieve a list of applicants and the jobs they have applied for, including those who have not 
-- applied and jobs without applicants.
SELECT A.FirstName, A.LastName, J.JobTitle AS JobTitle
FROM Applicants A
LEFT JOIN Applications Ap ON A.ApplicantID = Ap.ApplicantID
LEFT JOIN Jobs J ON Ap.JobID = J.JobID

UNION

SELECT NULL AS FirstName, NULL AS LastName, JobTitle
FROM Jobs
WHERE JobID NOT IN (SELECT DISTINCT JobID FROM Applications);

-- 20. List all combinations of applicants and companies where the company is in a specific city and the 
-- applicant has more than 2 years of experience. For example: city=Chennai

-- asked to leave

