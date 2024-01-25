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

-- JOB 이 MANAGER 이거나 SALESMAN 이거나 CLERK
SELECT *
FROM EMP e 
WHERE JOB = 'MANAGER' OR
JOB = 'SALESMAN' OR 
JOB = 'CLERK' ;

-- IN
SELECT *
FROM EMP e 
WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK') ;

SELECT *
FROM EMP e 
WHERE JOB NOT IN ('MANAGER', 'SALESMAN', 'CLERK') ;

-- HIREDATE 가 1981-10-31 이후에 고용된 사원 조회
-- 날짜 데이터도 ''로 처리
SELECT *
FROM EMP e 
WHERE HIREDATE > '1981-10-31' ;

-- BETWEEN A AND B
-- SAL 2000 이상 3000 이하인 사원 조회
SELECT *
FROM EMP e 
WHERE SAL BETWEEN 2000 AND 3000 ;

-- NOT BETWEEN A AND B
-- SAL 2000 이상 3000 이하가 아닌 사원 조회
SELECT *
FROM EMP e 
WHERE SAL NOT BETWEEN 2000 AND 3000 ;




-- 2024-01-24
-- LIKE 연산자, 와일드 카드 (_, %)
-- 조건이 완전히 일치하지 않을 때 LIKE 연산자 사용, '='와 다른 용도
-- _는 문자 하나를 의미, %는 문자 개수는 무한대로 매칭

-- 사원 이름이 S로 시작하는 사원 조회
SELECT *
FROM EMP e 
WHERE ENAME LIKE 'S%' ;

-- 사원 이름의 두 번째 글짜가 L인 사원 조회
SELECT *
FROM EMP e 
WHERE ENAME LIKE '_L%' ;

-- 사원 이름에 AM 문자가 포함된 사원 조회
SELECT *
FROM EMP e 
WHERE ENAME LIKE '%AM%' ;

-- 사원 이름에 AM 문자가 포함되지 않은 사원 조회
SELECT *
FROM EMP e 
WHERE ENAME NOT LIKE '%AM%' ;

--
SELECT * FROM EMP e ;

-- NULL: 값이 없는 상태, 0 이 아님
-- '' : 비어 있는 값, NULL 이 아님
-- ' ' : 스페이스 바도 문자임

-- comm 이 null 인 사원 조회
-- null 비교는 is 사용 where comm = null (X)
SELECT * 
FROM EMP e 
WHERE COMM IS NULL ;

-- mgr이 null인 사원 조회
SELECT *
FROM EMP e
WHERE MGR IS NULL ;

-- mgr이 null이 아닌 사원 조회
SELECT *
FROM EMP e
WHERE MGR IS NOT NULL ;

-- 집합연산자
-- 합집합(UNION, UNION ALL), 교집합(INTERSECT), 차집합(MINUS)

-- 부서번호가 10 혹은 20번인 사원 조회
-- OR 또는 합집합
SELECT EMPNO, ENAME , SAL , DEPTNO 
FROM EMP e 
WHERE DEPTNO = 10
UNION SELECT EMPNO, ENAME , SAL , DEPTNO 
FROM EMP e 
WHERE DEPTNO = 20 ;

-- 질의 블록은 부정확한 수의 결과 열을 가지고 있습니다.
-- 집합 연산자 UNION을 사용할 때 출력 열 개수, 타입 동일
--SELECT EMPNO, ENAME , SAL , DEPTNO 
--FROM EMP e 
--WHERE DEPTNO = 10
--UNION SELECT EMPNO, ENAME , SAL 
--FROM EMP e 
--WHERE DEPTNO = 20 ;

--필드명 타입이 동일하면 필드명 상관 없음
SELECT EMPNO, ENAME , SAL , DEPTNO 
FROM EMP e 
WHERE DEPTNO = 10
UNION SELECT SAL, JOB , DEPTNO, SAL 
FROM EMP e 
WHERE DEPTNO = 20 ;

-- UNION은 결과값의 중복 제거
SELECT EMPNO, ENAME , SAL , DEPTNO 
FROM EMP e 
WHERE DEPTNO = 10
UNION 
SELECT EMPNO, ENAME , SAL , DEPTNO 
FROM EMP e 
WHERE DEPTNO = 10 ;

-- UNION ALL : 중복된 결과값을 제거 안 함
SELECT EMPNO, ENAME , SAL , DEPTNO 
FROM EMP e 
WHERE DEPTNO = 10
UNION ALL
SELECT EMPNO, ENAME , SAL , DEPTNO 
FROM EMP e 
WHERE DEPTNO = 10 ;

-- MINUS (차집합)
SELECT EMPNO, ENAME , SAL , DEPTNO 
FROM EMP e 
MINUS
SELECT EMPNO, ENAME , SAL , DEPTNO 
FROM EMP e 
WHERE DEPTNO = 10 ;

-- INTERSECT (교집합)
SELECT EMPNO, ENAME , SAL , DEPTNO 
FROM EMP e 
INTERSECT
SELECT EMPNO, ENAME , SAL , DEPTNO 
FROM EMP e 
WHERE DEPTNO = 10 ;


-- 오라클 함수(내장 함수)
-- 함수는 사용하는 DBMS에 따라 다르게 제공
-- 1. 문자 함수
--	1)대소문자 변경 

-- upper(문자열): 괄호 안 문자를 모두 대문자로 변환하여 반환
-- lower(문자열): 괄호 안 문자를 모두 소문자로 변환하여 반환
-- initcap(문자열): 괄호 안 문자 데이터 중 첫 글자만 대문자로, 나머지 글자는 소문자로 변환하여 반환
SELECT ENAME , UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)  
FROM EMP e ;

SELECT *
FROM EMP e 
WHERE ENAME = UPPER('clark') ;

SELECT *
FROM EMP e 
WHERE lower(ENAME) = 'clark' ;

--	2) 문자열의 길이: length(), lengthb()
SELECT ENAME, LENGTH(ENAME), LENGTHB(ENAME) 
FROM EMP e ;

-- DUAL: 함수 결과를 보고 싶은데 테이블이 없는 경우의 임시 테이블
-- lengthb: 문자열에 사용된 바이트 수 반환
-- 한글은 문자 하나 당 3 byte 할당
SELECT LENGTH('한글'), LENGTHB('한글')  FROM DUAL ;

-- 직책 이름이 6글자 이상인 사원 조회
SELECT *
FROM EMP e 
WHERE LENGTH(e.JOB) >= 6 ;

--	3) 문자열 일부 추출: substr(문자열 데이터, 시작 위치, 추출 길이)
-- 추출길이는 생략가능 substr(문자열, 시작위치): 시작 위치 ~ 마지막까지 
SELECT job, SUBSTR(job, 1, 2), SUBSTR(job, 3, 2), SUBSTR(job, 5)  
FROM EMP e ;
-- 시작 위치가 음수라면 끝에서부터 시작
SELECT job, SUBSTR(job, -1, 2), SUBSTR(job, -3, 2), SUBSTR(job, -5)  
FROM EMP e ;

--	4)문자열 데이터 안에서 특정 문자 위치 찾기:
--		instr(문자열 데이터, 위치를 찾으려는 문자, 시작 위치, 시작위치에서 몇 번째 위치)
SELECT INSTR('HELLO, ORACLE!', 'F') AS INSTR_1 , 
		INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_2,
		INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTR_3 -- 'E' 위치 이후의 'L' 중 두번째로 오는 'L' 찾기
FROM DUAL ;

-- 사원 이름에 S 가 들어있는 사원 조회
-- LIKE 말고도 INSTR() 함수 사용 가능
SELECT *
FROM EMP e 
WHERE INSTR(ENAME, 'S') > 0 ; 

--	5) 특정 문자를 다른 문자로 변경:
--		REPLACE(문자열 데이터, 찾는 문자, 변경할 문자)

SELECT '010-1234-5678' AS REPLACE_BEFORE,
	REPLACE('010-1234-5678', '-', '') AS REPLACE_1,
	REPLACE('010-1234-5678', '-') AS REPLACE_2,
	REPLACE('010-1234-5678', '-', ' ') AS REPLACE_3
FROM DUAL ;

--	6) 두 문자열 데이터를 합하는 함수: CONCAT
--		CONCAT(문자열 데이터 1, 문자열 데이터 2), 3 개 이상의 문자열 데이터 입력 시 에러
SELECT CONCAT(EMPNO, ENAME)
FROM EMP e
WHERE ENAME = 'SMITH' ;

-- 7369 : SMITH ( 3 개 이상 문자열 데이터 입력하려고 할 때)
SELECT CONCAT( EMPNO , CONCAT(' : ', ENAME)) 
FROM EMP e
WHERE ENAME = 'SMITH' ;

SELECT EMPNO || ' : ' || ENAME 
FROM EMP e
WHERE ENAME = 'SMITH' ;

--	7) 문자열 데이터의 일부 제거: TRIM(삭제 옵션 (삭제할 문자) FROM 원본 문자열)
-- 삭제옵션은 선택사항, 기본값은 공백 제거
-- LTRIM 왼쪽 공백제거, RTRIM 오른쪽 공백 제거

SELECT '[' || '  __Oracle__  ' || ']' AS trim_before,
		'[' || TRIM('  __Oracle__  ') || ']' AS trim,
		'[' || LTRIM('  __Oracle__  ') || ']' AS Ltrim,
		'[' || RTRIM('  __Oracle__  ') || ']' AS Rtrim
FROM DUAL ;

SELECT '[' || '  __Oracle__  ' || ']' AS trim_before,
		'[' || TRIM(LEADING '_' FROM '__Oracle__') || ']' AS trim_leading,
		'[' || TRIM(TRAILING '_' FROM '__Oracle__') || ']' AS trim_trailing,
		'[' || TRIM(both '_' FROM '__Oracle__') || ']' AS trim_both
FROM DUAL ;

-- 2. 숫자 함수: 숫자 데이터에 적용 (반올림, 올림, 버림, 나머지값 구하기 등)
-- ROUND, CEIL, FLOOR TRUNC, MOD

-- ROUND (숫자 데이터, 반올림 위치-기본값은 0, 소숫점 위치)
SELECT ROUND(1234.5678) AS ROUND,
	ROUND(1234.5678, 0) AS ROUND1,
	ROUND(1234.5678, 1) AS ROUND2,
	ROUND(1234.5678, 2) AS ROUND3,
	ROUND(1234.5678, -1) AS ROUND_MINUS1,
	ROUND(1234.5678, -2) AS ROUND_MINUS2
FROM DUAL ;

-- TRUNC(숫자 데이터, 버릴 위치)
SELECT TRUNC(1234.5678) AS TRUNC,
	TRUNC(1234.5678, 0) AS TRUNC0,
	TRUNC(1234.5678, 1) AS TRUNC1,
	TRUNC(1234.5678, 2) AS TRUNC2,
	TRUNC(1234.5678, -1) AS TRUNC_MINUS1,
	TRUNC(1234.5678, -2) AS TRUNC_MINUS2
FROM DUAL ;

-- CEIL, FLOOR: 지정한 숫자와 가까운 정수를 찾음
-- CEIL: 지정한 숫자보다 큰 정수 중 가장 작은 정수로 반환
-- FLOOR: 지정한 숫자보다 작은 정수 중 가장 큰 정수로 반환
SELECT CEIL(3.14), FLOOR(3.14),
	CEIL(-3.14), FLOOR(-3.14)
FROM DUAL ;

-- MOD : 나머지
SELECT 11/5, MOD(11, 5)
FROM DUAL ;

-- 3. 날짜 함수
-- 2023-01-24 OR 2023/01/24

-- 오늘 날짜
SELECT SYSDATE, CURRENT_DATE , CURRENT_TIMESTAMP 
FROM DUAL ;
-- 날짜 데이터 +/- 숫자: 날짜 데이터보다 숫자만큼 이후/이전의 날짜
SELECT SYSDATE, SYSDATE +1, SYSDATE - 1 
FROM DUAL ;
-- ADD_MONTHS(날짜데이터, 숫자): 몇 개월 이후의 날짜 구하기
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3)  
FROM DUAL ;

-- 입사 30 주년이 되는 날짜 구하기
SELECT EMPNO , ENAME , HIREDATE, ADD_MONTHS(HIREDATE, 360) 
FROM EMP e ;

-- MONTH_BETWEEN(날짜1, 날짜2): 두 개의 날짜 데이터를 입력하고 두 날짜 간의 개월 수 차이 구하기
-- 고용일과 오늘 날짜 차이 구하기
SELECT
	EMPNO ,
	ENAME ,
	HIREDATE ,
	SYSDATE ,
	MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTHS1 ,
	MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTHS2 ,
	TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTHS3
FROM
	EMP e ;
	
-- NEXT_DAY(날짜 데이터, 요일 정보) : 특정 날짜 기준으로 다음에 오는 요일의 날짜 출력
-- LAST_DAY(날짜) : 특정 날짜가 속한 달의 마지막 날짜 출력
SELECT SYSDATE, NEXT_DAY(SYSDATE, '월요일') , LAST_DAY(SYSDATE) 
FROM DUAL ;

-- 데이터 타입
-- NUMBER(숫자), VARCHAR2(문자), DATE(날짜/시간)
-- 자료형 변환 ( 날짜 -> 문자 , 문자 -> 숫자 )

-- NUMBER + 문자형 숫자('숫자') 계산은 가능 : 자동 형변환
SELECT EMPNO , ENAME , EMPNO + '500'
FROM EMP e 
WHERE ENAME = 'FORD';

-- 계산안됨
--SELECT EMPNO , ENAME , EMPNO + 'ABCD'
--FROM EMP e 
--WHERE ENAME = 'FORD';

-- 명시적 형변환
-- TO_CAHR(날짜(숫자) 데이터, '출력되기를 원하는 문자 형태') : 숫자, 날짜 데이터를 문자로 변환
--	주로 날짜 데이터 형식 바꿀 때 사용
-- TO_NUMBER(문자열, '출력될 숫자 형식') : 문자 데이터를 지정한 형식의 숫자 데이터로 변환
-- TO_DATE(문자열, '출력될 날짜 형식') : 문자 데이터를 날짜로 변환

-- Y : 연도, M : 월, D : 일
-- HH : 시간(기본값12), HH24: 시를 24시간으로 표시, AM 또는 PM : 오전, 오후 여부 표시
-- MI : 분, SS : 초
SELECT
	TO_CHAR(SYSDATE, 'YY/MM/DD') ,
	SYSDATE ,
	TO_CHAR(SYSDATE, 'YY/MM/DD HH24:MI:SS AM')
FROM
	DUAL ;
	
SELECT 1300 - '1500', '1300' + 1500
FROM DUAL ;

SELECT '1300' - '1500' --'1,300' + '1,500' 은 안됨
FROM DUAL ;

-- 9: 숫자의 한 자리를 의미함(빈자리를 채우지 않음)
-- 0: 9와 비슷하나 빈 자리를 0으로 채움
SELECT TO_NUMBER('1,300', '999,999') + TO_NUMBER('1,500', '999,999')
FROM DUAL ;

SELECT TO_CHAR(SAL, '999,999.00') AS SAL1,
	TO_CHAR(SAL, '000,999,999.00') AS SAL2
FROM EMP e ;


SELECT TO_DATE('2024-01-24') AS TODATE1,
	TO_DATE('20240124') AS TODATE2
FROM DUAL ;

SELECT TO_DATE('2024-01-24') - TO_DATE('2023-12-31')
-- '2024-01-24' - '2023-12-31' 날짜형식 문자열로는 계산 안 됨
FROM DUAL ;

-- NULL 처리 함수 (NULL을 다른 값으로 변경하는 함수)
-- NULL은 연산이 안 됨 (NULL * 숫자, NULL + 숫자 = NULL)
SELECT EMPNO , ENAME , SAL , COMM , SAL + COMM 
FROM EMP e ;

-- NVL(데이터(NULL인지 검사할 열 이름),데이터가 NULL인 경우 대체할 데이터)
SELECT EMPNO , ENAME , SAL , COMM , SAL + NVL(COMM, 0)
FROM EMP e ;
-- NVL2(데이터, 데이터가 NULL 이 아닌 경우 반환 데이터(계산식), NULL인 경우 대체할 데이터)
SELECT EMPNO , ENAME , SAL , COMM, NVL2(COMM, 'O', 'X')
FROM EMP e ;

-- NVL2
-- COMM 이 NULL이면 연봉 = SAL * 12, NULL이 아니면 연봉 = SAL * 12 + COMM
SELECT EMPNO , ENAME , SAL , COMM, NVL2(COMM, SAL * 12 + COMM, SAL * 12) AS 연봉
FROM EMP e ;


-- JOB 이 MANAGER 라면 SAL * 1.1
-- JOB 이 SALESMAN 이라면 SAL * 1.05
-- JOB 이 ANALYST 라면 SAL
--			나머지 직무는 SAL * 1.03

-- DECODE 함수 CASE 문
-- DECODE(검사할 데이터, 조건1, 조건1이 참일 때 반환할 결과1, 조건2, 결과2, ... 어느 조건에도 불일치한 경우에 반환할 결과 )
SELECT
	EMPNO ,
	ENAME ,
	JOB ,
	SAL ,
	DECODE( JOB, 'MANAGER', SAL * 1.1 , 'SALESMAN', SAL * 1.05 , 'ANALYST', SAL, SAL * 1.03 ) AS UPSAL
FROM
	EMP e ;

-- CASE 데이터 WHEN 조건1 THEN 결과1 WHEN 조건2 THEN 결과2 ... ELSE 결과 END
-- 또는 
-- CASE WHEN 데이터 조건1 THEN 결과 ... ... END
SELECT
	EMPNO ,
	ENAME ,
	JOB ,
	SAL ,
	CASE
		JOB WHEN 'MANAGER' THEN SAL * 1.1
		WHEN 'SALESMAN' THEN SAL * 1.05
		WHEN 'ANALYST' THEN SAL
		ELSE SAL * 1.03
	END AS UPSAL2 ,
	DECODE( JOB, 'MANAGER', SAL * 1.1 , 'SALESMAN', SAL * 1.05 , 'ANALYST', SAL, SAL * 1.03 ) AS UPSAL
FROM
	EMP e ;
	
-- COMM 이 NULL 일 때, 해당사항 없음 출력
-- 			0 일 때, 수당없음 출력
--			>0 일 때, 수당 : COMM 그대로 출력 열 이름 COMMTEXT
SELECT
	EMPNO ,
	ENAME ,
	COMM,
	CASE
		WHEN COMM IS NULL THEN '해당사항 없음'
		WHEN COMM = 0 THEN '수당 없음'
		WHEN COMM > 0 THEN '수당 : ' || COMM
	END AS COMM_TEXT
FROM
	EMP e ;

-- 사원들 평균 근무일수는 21.5일 하루 근무 시간 8시간일 때,
-- 사원들의 하루 급여(DAY_PAY), 시급(TIME_PAY) 출력
-- 하루 급여는 소수점 셋째 자리에서 버리고, 시급은 두 번쨰 소수점에서 반올림
SELECT
	EMPNO ,
	ENAME ,
	SAL,
	TRUNC((SAL / 21.5), 2 )
	AS DAY_PAY,
	ROUND((SAL / 21.5)/8, 1)
	AS TIME_PAY
FROM
	EMP e ;
	
-- 입사일 기준 3개월 후 첫 월요일에 정직원이 됨, 정직원 되는 날짜를 YYYY-MM-DD 형식으로 출력(R_JOB)
-- 추가수당(COMM) 없는 사원은 N/A 로 출력
-- 내가 푼 것
SELECT
	EMPNO ,
	ENAME ,
	HIREDATE,
	TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE, 3), '월요일' ), 'YYYY-MM-DD')
	AS R_JOB,
	CASE
		WHEN COMM IS NULL THEN 'N/A'
		WHEN COMM IS NOT NULL THEN TO_CHAR(COMM)
	END
	AS COMM1
FROM	EMP e ;
-- 선생님이 푼 것
SELECT
	EMPNO ,
	ENAME ,
	HIREDATE,
	NEXT_DAY(ADD_MONTHS(HIREDATE, 3), '월요일' ) AS R_JOB,
	NVL(TO_CHAR(COMM), 'N/A') AS COMM
FROM	EMP e ;


-- 2024-01-25
-- 오라클 함수 실습 3번째
--CASE 함수를 이용할 경우
SELECT
	EMPNO ,
	ENAME ,
	MGR,
	CASE
		WHEN MGR IS NULL THEN '0000'
		WHEN MGR LIKE '75%' THEN '5555'
		WHEN MGR LIKE '76%' THEN '6666'
		WHEN MGR LIKE '77%' THEN '7777'
		WHEN MGR LIKE '78%' THEN '8888'
		ELSE TO_CHAR(MGR)
	END AS chg_mgr
FROM
	EMP e ;

--DECODE 함수를 이용할 경우
SELECT EMPNO , ENAME , MGR, 
DECODE(
	SUBSTR(TO_CHAR(MGR), 1, 2) , NULL, '0000', '75', '5555', '76', '6666', '77', '7777', '78', '8888',
	TO_CHAR(MGR)
	) AS CHG_MGR
FROM
EMP e ;

-- NVL
SELECT
	EMPNO ,
	ENAME ,
	MGR,
	CASE SUBSTR(TO_CAHR(MGR), 1, 2)
		WHEN '00' THEN '0000'
		WHEN '75' THEN '5555'
		WHEN '76' THEN '6666'
		WHEN '77' THEN '7777'
		WHEN '78' THEN '8888'
		ELSE TO_CHAR(MGR)
	END AS chg_mgr
FROM
	EMP e ;
	
-- 다중 행 함수 : 여러 행이 나오는 열을 추가할 수 없음
SELECT SUM(SAL), AVG(SAL), COUNT(SAL), MAX(SAL) , MIN(SAL)
	-- , ENAME 도 표시하려고 하면 오류 남 : 단일 그룹의 그룹 함수가 아닙니다 
FROM EMP e ;

-- 동일한 값은 중복되지 않게 하나만 선택해서 합계 
SELECT SUM(DISTINCT SAL)
FROM EMP e ;
 
-- 입력된 행의 개수 세기
SELECT COUNT(*)
FROM EMP e ;
-- 부서번호가 30인 사원 수 출력
SELECT COUNT(*)
FROM EMP e 
WHERE DEPTNO = 30 ;

-- 부서번호가 30인 사원 중 급여의 최대값 출력
SELECT MAX(SAL)
FROM EMP e 
WHERE DEPTNO = 30 ;

-- 부서번호가 20인 사원의 입사일 중 제일 최근 입사일 조회
SELECT MAX(HIREDATE)
FROM EMP e 
WHERE DEPTNO = 20 ;
-- 부서번호가 20인 사원의 입사일 중 제일 오래된 입사일 조회
SELECT MIN(HIREDATE)
FROM EMP e 
WHERE DEPTNO = 20 ;

-- 부서번호가 30인 사원 중 SAL 중복값 제거 후 평균 구하기
SELECT AVG(DISTINCT SAL) AS 급여_평균값  
FROM EMP e 
WHERE DEPTNO = 30 ;

-- 부서별 급여 합계 - 작동은 함
--SELECT '10' AS DEPTNO, SUM(SAL)
--FROM EMP e
--WHERE DEPTNO = 10
--UNION SELECT '20' AS DEPTNO, SUM(SAL)
--FROM EMP e
--WHERE DEPTNO = 20
--UNION SELECT '30' AS DEPTNO, SUM(SAL)
--FROM EMP e
--WHERE DEPTNO = 30;

-- 결과값을 원하는 열로 묶기: GROUP BY

--1. SELECT 열이름
--2. FROM 테이블명
--3. WHERE 조건 나열
--4. GROUP BY 그룹화할 열 이름... <- NEW! (옵션: HAVING)
--5. ORDER BY 정렬
-- 실행 순서
-- 2 -> 3 -> 4-1 GROUP BY -> 4-2 HAVING -> 1 -> 5

-- GROUP BY 표현식이 아닙니다. 오류
-- GROUP BY 옆에 오는 컬럼만 SELECT 절에 사용 가능
-- 	(다른 테이블과 조인해서 다른 테이블의 열을 표시하려면 써야함)

SELECT DEPTNO , SUM(SAL)
FROM EMP e 
GROUP BY DEPTNO ;

-- 부서별 급여 평균
SELECT DEPTNO , AVG(SAL) 
FROM EMP e 
GROUP BY DEPTNO ;

-- 부서번호, 직무별 급여 평균
SELECT DEPTNO , JOB, AVG(SAL)
FROM EMP e 
GROUP BY DEPTNO , JOB
ORDER BY DEPTNO ;

-- HAVING 은 GROUP BY 절에 조건을 추가할 때 사용함
-- 부서별 직책의 평균 급여가 2000 이상인 사원들의 부서, 직책별 평균급여
-- (GROUP BY ~    HAVING ~	)		/	SELECT (열이름) ...
SELECT DEPTNO , JOB, AVG(SAL)
FROM EMP e 
GROUP BY DEPTNO , JOB HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO , JOB ASC ;


SELECT DEPTNO , JOB, AVG(SAL)
FROM EMP e 
WHERE SAL <= 3000 -- <- 먼저 월급을 기준으로 평균에 포함할 사원을 제한함 
GROUP BY DEPTNO , JOB HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO , JOB ASC ;

-- 같은 직무에 종사하는 인원이 3명 이상인 직무와 인원수 조회
SELECT JOB , COUNT(EMPNO)
FROM EMP e 
GROUP BY JOB HAVING COUNT(EMPNO) >= 3
ORDER BY JOB ;

-- 사원들의 입사연도를 기준으로 부셔별 몇명 입사했는지 조회
SELECT SUBSTR(TO_CHAR(HIREDATE, 'YYYY-MM-DD'), 1 , 4 ) AS 입사년도, DEPTNO , COUNT(EMPNO)
FROM EMP e 
GROUP BY SUBSTR(TO_CHAR(HIREDATE, 'YYYY-MM-DD'), 1 , 4 ), DEPTNO
ORDER BY SUBSTR(TO_CHAR(HIREDATE, 'YYYY-MM-DD'), 1 , 4 ), DEPTNO ASC ;
-- TO_CHAR(HIREDATE, 'YYYY')로 요약가능


-- JOIN 여러 테이블을 하나의 테이블처럼 쓰기 위해 사용			<== 중요!!!
--1) 내부 조인 (일치하는 값이 있는 경우-교집합)

-- EMP 와 DEPT 조인
SELECT *
FROM EMP e , DEPT d 
WHERE E.DEPTNO = D.DEPTNO ;

-- 오류 / 열의 정의가 애매함. DEPTNO 가 두 테이블 열이름으로 중복됨
-- JOIN 할 때 두 테이블에 동일한 열 이름이 존재하는 경우
--SELECT ENAME, SAL, DEPTNO , DNAME , LOC 
--FROM EMP e , DEPT d 
--WHERE E.DEPTNO = D.DEPTNO ;

SELECT E.ENAME, E.SAL, E.DEPTNO , D.DNAME , D.LOC 
FROM EMP e , DEPT d 
WHERE E.DEPTNO = D.DEPTNO ;

-- WHERE 절이 없는 경우, 오류가 나진 않지만 조인 조건이 없을때 나올 수 있는 모든 조합이 출력됨
--SELECT E.ENAME, E.SAL, E.DEPTNO , D.DNAME , D.LOC 
--FROM EMP e , DEPT d 

-- 출력할 데이터 조건을 추가할 때 (비표준)
SELECT E.ENAME, E.SAL, E.DEPTNO , D.DNAME , D.LOC 
FROM EMP e , DEPT d 
WHERE E.DEPTNO = D.DEPTNO AND E.SAL >= 3000 ;

-- SQL-99 표준구문 ( JOIN ~ ON ~ )
SELECT E.ENAME, E.SAL, E.DEPTNO , D.DNAME , D.LOC 
FROM EMP e JOIN DEPT d ON E.DEPTNO = D.DEPTNO 
-- FROM EMP e INNER JOIN DEPT d ON E.DEPTNO = D.DEPTNO 으로도 표현 가능
WHERE E.SAL >= 3000 ;

-- EMP 테이블 과 SALGRADE 테이블을 연결
SELECT *
FROM EMP e, SALGRADE s
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL ;

SELECT *
FROM EMP e INNER JOIN SALGRADE s ON E.SAL BETWEEN S.LOSAL AND S.HISAL ;

-- EMP와 EMP 조인
SELECT E.EMPNO, E.ENAME, E.MGR, E2.ENAME AS MGR_NAME
FROM EMP e , EMP e2 
WHERE E.MGR = E2.EMPNO ;

--2) 외부 조인
-- 외부 조인은 일치하지 않은 데이터도 나오게 함.
-- 데이터 기준을 왼쪽으로 할 건지 오른쪽으로 할 건지 정해야 함
	-- (1) 왼쪽 외부 조인 : LEFT OUTER JOIN ~ ON ~
	-- (2) 오른쪽 외부 조인 RIGHT OUTER JOIN ~ ON ~

SELECT E.EMPNO, E.ENAME, E.MGR, E2.ENAME AS MGR_NAME
FROM EMP e LEFT OUTER JOIN EMP e2 ON E.MGR = E2.EMPNO ; -- E.MGR을 기준으로 정함

SELECT E.EMPNO, E.ENAME, E.MGR, E2.ENAME AS MGR_NAME
FROM EMP e RIGHT OUTER JOIN EMP e2 ON E.MGR = E2.EMPNO ; -- E2.EMPNO 가 기준

-- 각 부서별 평균급여, 최대급여, 최소급여, 사원 수
-- 열 순서 부서번호, 부서명, 평균급여, 최대급여, 최소급여, 사원 수
SELECT E.DEPTNO , D.DNAME , AVG(E.SAL), MAX(E.SAL) , MIN(E.SAL), COUNT(*)
FROM EMP e JOIN DEPT d ON E.DEPTNO = D.DEPTNO 
GROUP BY E.DEPTNO, D.DNAME ;

-- 세 개의 테이블 조인
SELECT
	*
FROM
	EMP e1
JOIN EMP e2 ON
	E1.EMPNO = E2.EMPNO
JOIN EMP e3 ON
	E2.EMPNO = E3.EMPNO ;
	
-- 모든 부서 정보와 사원 정보를 부서번호, 사원 이름 순으로 정렬해서
-- 부서번호, 부서명, 사원번호, 사원명, 직무, 급여 출력(DEPT 테이블 기준)
SELECT D.DEPTNO , D.DNAME , E.EMPNO , E.ENAME , E.JOB , E.SAL 
FROM DEPT d LEFT OUTER JOIN EMP e ON D.DEPTNO = E.DEPTNO
ORDER BY D.DEPTNO ASC , E.ENAME ASC ;
-- 테이블명 좌우 바꾸고 RIGHT OUTER JOIN 으로 바꾸면 값이 동일함
SELECT D.DEPTNO , D.DNAME , E.EMPNO , E.ENAME , E.JOB , E.SAL 
FROM EMP E RIGHT OUTER JOIN DEPT d ON D.DEPTNO = E.DEPTNO
ORDER BY D.DEPTNO ASC , E.ENAME ASC ;

-- 모든 부서 정보와 사원 정보를 부서번호, 사원 이름 순으로 정렬해서
-- 부서번호, 부서명, 사원번호, 사원명, 직무, 급여, LOSA, HISAL, GRADE 출력
-- (DEPT 테이블 기준)
SELECT
	D.DEPTNO ,
	D.DNAME ,
	E.EMPNO ,
	E.ENAME ,
	E.JOB ,
	E.SAL ,
	S.LOSAL ,
	S.HISAL ,
	S.GRADE
FROM
	DEPT d
LEFT OUTER JOIN EMP e ON
	D.DEPTNO = E.DEPTNO
LEFT OUTER JOIN SALGRADE s ON
	E.SAL BETWEEN S.LOSAL AND S.HISAL
ORDER BY
	D.DEPTNO ASC ,
	E.ENAME ASC ;