-- scott 권한 부여
GRANT CONNECT, resource TO scott;
GRANT CREATE VIEW TO SCOTT;

-- 데이터를 저장할 수 있는 저장공간 할당
ALTER USER SCOTT DEFAULT TABLESPACE USERS;
ALTER USER SCOTT TEMPORARY TABLESPACE TEMP;
ALTER USER scott quota 10m ON users;

alter session set "_oracle_scrpit"=true;