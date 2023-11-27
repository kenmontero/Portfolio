WITH all_levels AS(
SELECT experience_level,
CASE
	WHEN experience_level = 'SE' THEN 'Senior_Level'
	WHEN experience_level = 'MI' THEN 'Mid_level'
	WHEN experience_level = 'EN' THEN 'Entry_level'
	WHEN experience_level = 'EX' THEN 'Executive' 
END AS Experience_levels

FROM salaries)

SELECT Experience_levels, count(Experience_levels)AS Number_of_Jobs
FROM all_levels
GROUP BY Experience_levels
ORDER BY Number_of_Jobs DESC
--shows the number of jobs by level



SELECT job_title, AVG(salary_in_usd) AS Average_Salary
FROM salaries
WHERE job_title IN
(
    SELECT TOP 10 job_title
    FROM salaries
    GROUP BY job_title
    ORDER BY COUNT(*) DESC
)
GROUP BY job_title
ORDER BY Average_Salary DESC;
--Shows Average salary of the top 10 job titles




SELECT work_year, remote_ratio, COUNT(remote_ratio) AS number_of_jobs
FROM salaries
GROUP BY work_year,remote_ratio
ORDER BY work_year 
-- shows the number of  remote jobs per year




SELECT TOP 10 job_title, COUNT(job_title) AS number_of_jobs
FROM salaries
GROUP BY job_title
ORDER BY number_of_jobs DESC
--shows top 10 jobs and the number of jobs 





SELECT work_year,remote_ratio,count(*) AS number_of_jobs
FROM salaries
WHERE remote_ratio = 100
GROUP BY work_year,remote_ratio
-- Shows the number of employees that are fully remote.




SELECT work_year,count(*)AS number_of_jobs
FROM salaries
GROUP BY work_year
--compares the number of data jobs per year
