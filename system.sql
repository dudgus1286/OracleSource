-- scott 권한 부여
GRANT CONNECT, resource TO scott;
GRANT CREATE VIEW TO SCOTT;

-- 데이터를 저장할 수 있는 저장공간 할당
ALTER USER SCOTT DEFAULT TABLESPACE USERS;
ALTER USER SCOTT TEMPORARY TABLESPACE TEMP;
ALTER USER scott quota 10m ON users;

alter session set "_oracle_scrpit"=true;


-- 2024-01-30
-- DBA 권한을 가진 사용자만 사용자를 생성하고 권한 부여 가능
-- SYSTEM, sys as sysdba

-- CREATE USER 아이디 IDENTIFIED BY 비밀번호 ;
-- test 유저 생성
-- 공통 사용자 또는 롤 이름이 부적합합니다 / 21c XE 버전 요구사항: 아이디 앞에 c## 접두사 붙이기
CREATE USER c##test IDENTIFIED BY test ;

-- 사용자한테 권한 부여
-- SESSION, CREATE(USER, TABLE, SEQUENCE, VIEW ... )
-- 권한 그룹 => 롤
-- CONNECT, RESOURCE
-- CONNECT(SESSION, CREATE TABLE, CREATE VIEW ... )
-- RESOURCE(SEQUENCE, 프로시저, 테이블 ... )

-- GRANT 권한이름, ... TO 사용자아이디
-- GRANT 룰이름, ... TO 사용자아이디
GRANT CONNECT, RESOURCE TO C##TEST ;


CREATE USER c##test2 IDENTIFIED BY test
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP
QUOTA 10M ON USERS
;
-- 동일한 내용
--ALTER USER 아이디 DEFAULT TABLESPACE USERS;
--ALTER USER 아이디 TEMPORARY TABLESPACE TEMP;
--ALTER USER 아이디 quota 10m ON users;

GRANT CONNECT, RESOURCE TO C##TEST2 ;

-- REVOKE 취소할권한이름1, ... FROM 아이디

-- 비밀번호 변경
--ALTER USER 아이디 IDENTIFIED BY 변경할비밀번호 ;
ALTER USER C##TEST2 IDENTIFIED BY test ;