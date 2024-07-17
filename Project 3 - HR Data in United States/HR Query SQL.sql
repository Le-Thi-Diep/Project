CREATE DATABASE hr;
USE HR;

SELECT *
FROM hr_data;

--Some data in the termdate column is Null, the remaining 1 is ... UTC
--Consider termdate column data in descending order
SELECT termdate
FROM hr_data 
ORDER BY termdate DESC;

--Update termdate column, convert format to datetime, get first 19 characters and convert to 'yyyy-mm-dd'
-- 120 is input date and time format is 'yyyy-mm-dd hh:mi:ss'
UPDATE hr_data
SET termdate = FORMAT(CONVERT(DATETIME, LEFT(termdate, 19), 120), 'yyyy-MM-dd');

--termdate column has data type nvarchar
--Create a new column new-termdate to store data type date
ALTER TABLE hr_data
ADD new_termdate DATE;

--Get data from the termdate column
--If it is not null and is of type date, convert the termdate column data into datetime
--If not, insert null
UPDATE hr_data
SET new_termdate = CASE
 WHEN termdate IS NOT NULL AND ISDATE(termdate) = 1 
 THEN CAST(termdate AS DATETIME) 
 ELSE NULL
 END;

--View new column
 SELECT new_termdate
FROM hr_data;

--add the employee's age column
ALTER TABLE hr_data
ADD age nvarchar(50)

--Calculate employee age
UPDATE hr_data
SET age = DATEDIFF(YEAR, birthdate, GETDATE());



--QUESTIONS TO ANSWER FROM THE DATA
--1) What's the age distribution in the company?
SELECT
 MIN(age) AS youngest,
 MAX(age) AS oldest
FROM hr_data;
-- The results returned were that the youngest person was 22 years old, and the oldest person was 59 years old


SELECT age_group,
count(*) AS count
FROM
(--select from a list of age_group columns created by grouping the age column into age groups
SELECT 
 CASE
  WHEN age >= 22 AND age <= 30 THEN '22 to 30'
  WHEN age >= 31 AND age <= 40 THEN '31 to 40'
  WHEN age >= 41 AND age <= 50 THEN '41 to 50'
  ELSE '50+'
  END AS age_group
 FROM hr_data
 WHERE new_termdate IS NULL
 -- filter employees who do not have an end date <=> they are still active at the company to perform analysis
 ) AS subquery
 --Count how many employees in each age group are still working at the company
GROUP BY age_group
ORDER BY age_group;

--Similarly, group the 'age' column and 'gender' column by group for analysis
SELECT age_group,
gender,
count(*) AS count
FROM
(SELECT 
 CASE
  WHEN age >= 22 AND age <= 30 THEN '22 to 30'
  WHEN age >= 31 AND age <= 40 THEN '31 to 40'
  WHEN age >= 41 AND age <= 50 THEN '41 to 50'
  ELSE '50+'
  END AS age_group,
  gender
 FROM hr_data
 WHERE new_termdate IS NULL
 ) AS subquery
GROUP BY age_group, gender
ORDER BY age_group, gender;


--2) What's the gender breakdown in the company?
SELECT
 gender,
 COUNT(gender) AS count
FROM hr_data
WHERE new_termdate IS NULL
GROUP BY gender
ORDER BY gender ;

--3) How does gender vary across departments and job titles?
SELECT 
department,
gender,
count(gender) AS count
FROM hr_data
WHERE new_termdate IS NULL
GROUP BY department, gender
ORDER BY department, gender ;

--job title
SELECT 
department, jobtitle,
gender,
count(gender) AS count
FROM hr_data
WHERE new_termdate IS NULL
GROUP BY department, jobtitle, gender
ORDER BY department, jobtitle, gender ASC;

--4) What's the race distribution in the company?
SELECT race,
count(*) AS count
FROM hr_data
WHERE new_termdate IS NULL 
GROUP BY race
ORDER BY count DESC;

--5) What's the average length of employment in the company?
SELECT 
AVG(DATEDIFF(year, hire_date, new_termdate)) AS tenure
FROM hr_data
WHERE new_termdate IS NOT NULL AND new_termdate <= GETDATE();


--6) Which department has the highest turnover rate?
SELECT
 department,
 total_count, --count the number of employees in the department
 terminated_count, --count the number of employees who have terminated
 (round((CAST(terminated_count AS FLOAT)/total_count), 4)) * 100 AS turnover_rate
 --Turnover rate = number of people who quit / total number of people in the department * 100
 FROM
	(SELECT 
	 department,
	 count(*) AS total_count,--count the number of employees in the department
	 SUM(CASE
		WHEN new_termdate IS NOT NULL AND new_termdate <= GETDATE() 
		-- count the number of employees who have terminated (laid off date before today)
		THEN 1 ELSE 0
		END
		) AS terminated_count
	FROM hr_data
	GROUP BY department
	) AS subquery
ORDER BY turnover_rate DESC;


--7) What is the tenure distribution for each department?
--Average number of years of service in each department
SELECT 
    department,
    AVG(DATEDIFF(year, hire_date, new_termdate)) AS tenure
FROM hr_data
WHERE 
    new_termdate IS NOT NULL 
    AND new_termdate <= GETDATE()
GROUP BY department
ORDER BY tenure DESC;

--8) How many employees work remotely for each department?
SELECT
 location,
 count(*) as count
FROM hr_data
WHERE new_termdate IS NULL
GROUP BY location;

--9) What's the distribution of employees across different states?
SELECT 
 location_state,
 count(*) AS count
FROM hr_data
WHERE new_termdate IS NULL
GROUP BY location_state
ORDER BY count DESC;


--10) How are job titles distributed in the company?
SELECT 
 jobtitle,
 count(*) AS count
 FROM hr_data
 WHERE new_termdate IS NULL
 GROUP BY jobtitle
 ORDER BY count DESC;

 --11) How have employee hire counts varied over time?
 SELECT
 hire_year,
 hires,
 terminations,
 hires - terminations AS net_change,
 (round(CAST(hires-terminations AS FLOAT)/hires, 4)) * 100 AS percent_hire_change
 --changes in hires and terminations
 FROM
	(SELECT 
	 YEAR(hire_date) AS hire_year,
	 count(*) AS hires,
	 SUM(CASE
			WHEN new_termdate is not null and new_termdate <= GETDATE() THEN 1 ELSE 0
			END
			) AS terminations
			--count the number of employees who have been terminated each year
	FROM hr_data
	GROUP BY YEAR(hire_date)
	-- count the number of employees recruited each year.
	) AS subquery
ORDER BY percent_hire_change ;










