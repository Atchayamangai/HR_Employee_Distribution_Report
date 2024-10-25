SELECT * FROM hr;

ALTER TABLE hr
CHANGE COLUMN id emp_id VARCHAR(20) NULL;

DESCRIBE hr;

SELECT birthdate FROM hr;

SELECT * FROM hr;

/*
SET sql_safe_updates = 0;
*/

UPDATE hr
SET birthdate = CASE
    WHEN birthdate LIKE'%/%'THEN DATE_FORMAT(STR_TO_DATE(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
    WHEN birthdate LIKE'%-%'THEN DATE_FORMAT(STR_TO_DATE(birthdate,'%m-%d-%Y'),'%Y-%m-%d')
    ELSE NULL
END;

ALTER TABLE hr
MODIFY COLUMN birthdate DATE;

SELECT birthdate FROM hr;

UPDATE hr
SET hire_date = CASE
    WHEN hire_date LIKE'%/%'THEN DATE_FORMAT(STR_TO_DATE(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
    WHEN hire_date LIKE'%-%'THEN DATE_FORMAT(STR_TO_DATE(hire_date,'%m-%d-%Y'),'%Y-%m-%d')
    ELSE NULL
END;

ALTER TABLE hr
MODIFY COLUMN hire_date DATE;

SELECT hire_date FROM hr;

SELECT termdate FROM hr;

UPDATE hr
SET termdate = date(STR_TO_DATE(termdate,'%y-%m-%d'))
WHERE termdate IS NOT NULL AND termdate !='';

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

SELECT termdate FROM hr;

ALTER TABLE hr
ADD COLUMN age INT;

UPDATE hr
SET age = TIMESTAMPDIFF(YEAR, birthdate, CURDATE());

SELECT birthdate, age FROM hr;

SELECT MIN(age) AS youngest, MAX(age) AS oldest FROM hr;
