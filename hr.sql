-- employees 에서 전체 내용 조회
SELECT *
FROM EMPLOYEES e ;

-- first name, last name, job_id 조회
SELECT FIRST_NAME , LAST_NAME , JOB_ID FROM EMPLOYEES e ;

-- 사원번호가 176인 사람의 LAST_NAME 과 DEPARTMENT_ID 조회
SELECT LAST_NAME , DEPARTMENT_ID 
FROM EMPLOYEES e 
WHERE e.EMPLOYEE_ID = 176 ;

-- 연봉이 12000 이상 되는 직원들의 LAST_NAME과 SALARY 조회
SELECT LAST_NAME , SALARY 
FROM EMPLOYEES e 
WHERE SALARY >= 12000 ;

-- 연봉이 5000 에서 12000 의 범위 이외인 사람들의 LAST_NAME과 SALARY 조회
SELECT LAST_NAME , SALARY 
FROM EMPLOYEES e 
WHERE SALARY < 5000 OR SALARY > 12000 ;




-- 부서번호가 20, 50 부서에서 근무하는 사원들의 LAST_NAME,DEPARTMENT_ID 조회
SELECT LAST_NAME , DEPARTMENT_ID 
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID IN (20, 50 );

-- 부서번호가 20, 50 부서에서 근무하는 사원들의 LAST_NAME,DEPARTMENT_ID 조회
-- 오름차순
SELECT LAST_NAME , DEPARTMENT_ID 
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID IN (20, 50 )
ORDER BY LAST_NAME ASC, DEPARTMENT_ID ASC ;

-- 커미션을 버는 모든 사원들의 성씨, SALARY, COMMISSION_PCT 조회
SELECT LAST_NAME , SALARY , COMMISSION_PCT 
FROM EMPLOYEES e 
WHERE COMMISSION_PCT > 0 
ORDER BY SALARY DESC , COMMISSION_PCT DESC ;

-- SALARY 가 2500, 3500, 7000 이 아니며 JOB 이 SA_REP 나 ST_CLERK 사원 조회
SELECT *
FROM EMPLOYEES e 
WHERE SALARY NOT IN (2500, 3500, 7000) AND
JOB_ID IN ('SA_REP', 'ST_CLERK') ;
