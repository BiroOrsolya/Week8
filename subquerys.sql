SELECT CONCAT(FIRST_NAME, " ", LAST_NAME) AS NAME, SALARY
FROM employees
WHERE SALARY > (SELECT SALARY FROM employees WHERE LAST_NAME="Bull");


SELECT CONCAT(FIRST_NAME, " ", LAST_NAME) AS NAME 
FROM employees
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM departments WHERE DEPARTMENT_NAME = "IT");


SELECT CONCAT(FIRST_NAME, " ", LAST_NAME) AS NAME 
FROM employees
WHERE JOB_ID IN(SELECT JOB_ID FROM jobs WHERE JOB_TITLE LIKE "%manager");

  
SELECT CONCAT(FIRST_NAME, " ", LAST_NAME) AS NAME, SALARY 
FROM employees
WHERE SALARY > (SELECT AVG(SALARY) FROM employees);

 
SELECT CONCAT(FIRST_NAME, " ", LAST_NAME) AS NAME, SALARY 
FROM employees
WHERE SALARY IN(SELECT MIN_SALARY FROM jobs WHERE employees.JOB_ID=jobs.JOB_ID);


SELECT CONCAT(FIRST_NAME, " ", LAST_NAME) AS NAME, SALARY 
FROM employees
WHERE SALARY IN(SELECT MIN(SALARY) FROM employees GROUP BY DEPARTMENT_ID);


SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, 
	(SELECT DEPARTMENT_NAME 
	FROM departments
	WHERE employees.DEPARTMENT_ID=departments.DEPARTMENT_ID) AS DEPARTMENT_NAME 
	FROM employees;


SELECT * FROM 
	(SELECT * FROM employees ORDER BY EMPLOYEE_ID DESC LIMIT 10) AS LAST_TEN 
	ORDER BY EMPLOYEE_ID ASC;
