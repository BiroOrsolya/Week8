SELECT DEPARTMENT_NAME, CONCAT(STREET_ADDRESS, " ", CITY, " ", STATE_PROVINCE, " ", COUNTRY_NAME, " ",
POSTAL_CODA) AS ADDRESS 
FROM departments NATURAL JOIN locations
NATURAL JOIN countries;
 
 
SELECT CONCAT(FIRST_NAME, " ", LAST_NAME) AS NAME, e.DEPARTMENT_ID, d.DEPARTMENT_NAME 
FROM employees e
JOIN departments d USING (DEPARTMENT_ID);

  
SELECT CONCAT(FIRST_NAME, " ", LAST_NAME) AS NAME, j.JOB_TITLE, d.DEPARTMENT_NAME 
FROM employees e
JOIN jobs j ON e.JOB_ID=j.JOB_ID LEFT JOIN departments d USING (DEPARTMENT_ID)
LEFT JOIN locations l USING (LOCATION_ID) WHERE l.city="London";


SELECT DEPARTMENT_NAME, COUNT(*) AS "Number of employees" 
FROM departments d
JOIN employees e USING (DEPARTMENT_ID) GROUP BY DEPARTMENT_NAME;

  
SELECT CONCAT(FIRST_NAME, " ", LAST_NAME) AS NAME, HIRE_DATE 
FROM employees
WHERE HIRE_DATE > (SELECT HIRE_DATE FROM employees WHERE LAST_NAME="Jones");