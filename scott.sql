-- scott

-- SELECT(데이터 조회)
-- e : 별칭 (임의 지정 가능) / 없어도 실행 가능
-- * : 전체 필드(컬럼)를 의미함
SELECT * FROM EMP;

-- 특정 컬럼에 해당하는 내용 보기
SELECT EMPNO , ENAME , JOB FROM EMP;

-- emp 테이블
-- empno(사원번호), ename(사원명), job(직책), mgr(매니저번호), hiredate(고용일),
-- sal(급여), comm(보너스), deptno(부서번호)

-- emp 테이블에서 사원번호, 매니저번호, 부서번호만 조회
SELECT
	EMPNO ,
	MGR ,
	DEPTNO
FROM
	EMP;
	
-- emp 테이블에서 부서번호만 조회 (중복 데이터는 제거)
SELECT DISTINCT deptno
FROM
EMP e ;

-- 데이터 출력 시 필드명 별칭 부여
-- 쌍따움표는 별칭에 공백이 있는 경우 무조건 사용
-- as 생략 가능
SELECT
	EMPNO AS 사원번호 ,
	MGR 매니저번호 ,
	DEPTNO "부서 번호"
FROM
	EMP;
	
-- 연봉 계산 (월급 * 12 + 수당)
-- sal * 12 + comm

SELECT
	empno,
	SAL ,
	sal * 12 + COMM AS "연봉"
FROM
	EMP e ;

-- 정렬 
-- order by 정렬기준 컬럼명 desc or asc
-- desc 내림차순 , asc 오름차순 (기본값은 오름차순)
SELECT
	*
FROM
	EMP e
ORDER BY
	sal DESC;
	
-- emp 테이블에서 empno, ename, sal 조회 (단 empno 내림차순)
SELECT
	EMPNO ,
	ENAME ,
	SAL
FROM
	EMP e
ORDER BY
	EMPNO DESC ;
	
-- 전체조회, 부서번호 오름차순, sal 내림차순
SELECT
	*
FROM
	EMP e
ORDER BY
	DEPTNO ,
	SAL DESC ;
	
-- 조건 부여
-- 부서 번호가 30번인 사원 조회
-- 급여가 1000 이상인 사원 조회
-- = (같다) 그외 산술연산자(>, <, >=, <=)
SELECT
	*
FROM
	EMP e
WHERE
	DEPTNO = 30 ;
	
SELECT
	*
FROM
	EMP e
WHERE
	sal >= 1000;
	
SELECT *
FROM EMP e 
WHERE sal >= 1000
ORDER BY sal DESC;

-- empno 가 7782 인 사원 조회
SELECT *
FROM EMP e 
WHERE EMPNO = 7782 ;

--부서번호가 30번이고, 직책이 SALESMAN
-- 데이터는 대소문자 구별함
SELECT *
FROM EMP e 
WHERE DEPTNO = 30 AND JOB = 'SALESMAN' ;

-- 사원번호가 7499이고 부서번호가 30인 사원 조회
SELECT *
FROM EMP e 
WHERE EMPNO = 7499 AND DEPTNO = 30 ;

-- 이거나(혹은) : or
-- 부서번호가 30 이거나 직무가 SALESMAN 인 사원 조회
SELECT *
FROM EMP e 
WHERE DEPTNO = 30 OR JOB = 'SALESMAN' ;

-- 연봉이 36000 인 사원 조회 (연봉: SAL*12+COMM)
SELECT *
FROM EMP e 
WHERE SAL * 12 + COMM = 36000 ;

-- 문자 비교도 산술연산 기호로 비교 가능
-- 알파벳 순서로 F 다음에 있는 
-- 문자는 코드로 변환됨
SELECT *
FROM EMP e 
WHERE ENAME >= 'F' ;

-- SAL 이 3000이 아닌 사원 정보 조회
-- ~이 아닌 : !=, <>, ^=
SELECT *
FROM EMP e 
WHERE SAL != 3000 ;

SELECT *
FROM EMP e 
WHERE SAL <> 3000 ;

SELECT *
FROM EMP e 
WHERE SAL ^= 3000 ;