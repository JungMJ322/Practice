-- DROP
--DROP TABLE DEPT; DROP TABLE EMP; DROP TABLE SALGRADE;
-- DEPT 
CREATE TABLE DEPT (
	DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY, 
	DNAME VARCHAR2(14) , 
	LOC VARCHAR2(13) 
);
INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK'); 
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS'); 
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO'); 
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');
-- EMP 
CREATE TABLE EMP(    
	EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY, 
	ENAME VARCHAR2(10), 
	JOB VARCHAR2(9), 
	MGR NUMBER(4), 
	HIREDATE DATE, 
	SAL NUMBER(7,2), 
	COMM NUMBER(7,2),
	DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT
);
INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20); 
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30); 
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20); 
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30); 
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30); 
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10); 
INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10); 
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30); 
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30); 
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20); 
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);


-- SALGRADE 
CREATE TABLE SALGRADE (    
	GRADE NUMBER, 
	LOSAL NUMBER, 
	HISAL NUMBER 
);
INSERT INTO SALGRADE VALUES (1,700,1200); 
INSERT INTO SALGRADE VALUES (2,1201,1400); 
INSERT INTO SALGRADE VALUES (3,1401,2000); 
INSERT INTO SALGRADE VALUES (4,2001,3000); 
INSERT INTO SALGRADE VALUES (5,3001,9999);

-- select
SELECT * FROM DEPT; 
SELECT * FROM EMP; 
SELECT * FROM SALGRADE;


CREATE OR REPLACE VIEW v_emp AS SELECT * FROM emp;

SELECT *FROM v_emp;

CREATE SEQUENCE sequence_test;

SELECT sequence_test.nextval FROM dual;  -- dual 오라클에서 사용하는 임시 테이블
-- 전체복제
CREATE TABLE myemp AS SELECT * FROM emp;  -- 복사

SELECT * FROM myemp;
-- drop table myemp;
-- 원하는 컬럼 복제
CREATE TABLE emps AS SELECT EMPNO,ENAME FROM emp;
SELECT * FROM emps;

-- 구조(컬럼) 복제
CREATE TABLE empall AS SELECT * FROM emp WHERE 1=2;
SELECT * FROM empall;

CREATE TABLE table_notnull01(
   ID CHAR(3) NOT NULL,
   NAME VARCHAR2(20)
);

INSERT INTO table_notnull01 
values(1,'donghe');

INSERT INTO table_notnull01 
values('donghe');

SELECT * from table_notnull01;

CREATE TABLE table_notnull02(
   id char(3),
   name varchar2(20),
   CONSTRAINT tn02_id_nn NOT NULL (id)
);

CREATE TABLE table_unique01(
	id char(3),
	name varchar2(20),
	CONSTRAINT tu02_id_unq UNIQUE (id)
);

CREATE TABLE TABLE_UNIQUE02(
	ID CHAR(3),
	NAME VARCHAR2(20),
	CONSTRAINT TU02_ID_UNQ UNIQUE (ID)
);

CREATE TABLE TABLE_UNIQUE03(
	ID CHAR(3)
	NAME VARCHAR2(20),
	CONSTRAINT U03_ID_UNQ UNIQUE (ID, NAME)
);

INSERT INTO table_unique01
values('200', 'python');

INSERT INTO	table_unique01(name)
values('hadoop');

INSERT INTO	table_unique01(name)
values('spark');

SELECT * FROM table_unique01;

INSERT INTO table_unique02
values('100', 'oracle');

INSERT INTO table_unique02
values('200', 'python');

CREATE TABLE table_unique04(
	id char(4),
	name varchar2(20),
	CONSTRAINT tu04_nm_unq unique(name)
);

INSERT INTO table_unique04 
values('100', 'oracle');

INSERT INTO table_unique04 
values('100', 'python');

INSERT INTO table_unique04 
values('100', 'python');

CREATE TABLE TABLE_PK01(
	ID CHAR(3) PRIMARY KEY,
	NAME VARCHAR2(20)
);

CREATE TABLE TABLE_PK02(
	ID CHAR(3),
	NAME VARCHAR2(20),
	CONSTRAINT TP02_ID_PK PRIMARY KEY (ID)
);

CREATE TABLE TABLE_PK03(
	ID CHAR(3),
	NAME VARCHAR2(20),
	CONSTRAINT TP03_ID_PK PRIMARY KEY (ID, NAME)
);

INSERT INTO table_pk01 
values('100', 'oracle');

INSERT INTO table_pk01
values('200', 'python');

INSERT INTO table_pk01
values('200', 'hadoop');

INSERT INTO table_pk01(name)
values('hadoop')

INSERT INTO table_pk02
values('100', 'oracle');

INSERT INTO table_pk02
values('200', 'python');

INSERT INTO table_pk02 
values('200', 'hadoop');

INSERT INTO table_pk03
values('100', 'oracle');

INSERT INTO table_pk03 
values('100', 'python');

INSERT INTO table_pk03(name)
values('hadoop');

CREATE TABLE TABLE_FK01(
	ID CHAR(3),
	NAME VARCHAR2(20),
	PKID CHAR(3) REFERENCES TABLE_PK01(ID)
);

CREATE TABLE TABLE_FK02(
	id char(3),
	name varchar2(20),
	pkid char(3),
	CONSTRAINT tf02_id_fk FOREIGN KEY (id) REFERENCES table_pk02(id)
);

INSERT INTO table_fk01
values('100', 'oracle', '100');

SELECT * FROM table_fk01;

SELECT * FROM table_pk01;

INSERT INTO table_fk02
values('300', 'hadoop', '200');

SELECT * FROM table_pk02;

CREATE TABLE table_check01(
	id char(3),
	name varchar2(20),
	marriage char(1) check(marriage IN ('Y', 'N'))
);

CREATE table table_check02(
	id char(3),
	name varchar2(20),
	marriage char(1),
	CONSTRAINT tc02_mg_ck CHECK (marriage IN ('Y', 'N'))
);

INSERT INTO table_check01
values('100', 'oracle', 'Y');

INSERT INTO table_check01 
values('200', 'python', 'N');

SELECT * FROM table_check01;

-- Quiz oracle.pdf 22p
-- SIZE가 10인 가변길이 문자형 컬럼 ID와 SIZE가 10인 고정길이 문자형 컬럼 PW를 가진 TEST 테이블을 생성하자.
CREATE TABLE TEST(
	ID VARCHAR2(10),
	PW char(10)
);

-- ===============================연습문제==========================================
-- 사원테이블(EMP)의 모든 구조와 데이터를 복사하여 TEST01 테이블을 생성하자.
CREATE TABLE TEST01 AS SELECT * FROM EMP;

-- 사원테이블에서 사원번호와 이름을 복사하여 TEST02 테이블을 생성하자.
SELECT * FROM TEST02
CREATE TABLE TEST02 AS SELECT EMPNO, ENAME FROM EMP;

-- 사원테이블에서 사원번호의 컬럼명을 M1, 이름의 컬럼명을 M2로 변경 하면서 복사하여 TEST03 테이블을 생성하자.
CREATE TABLE TEST03(M1, M2) AS SELECT EMPNO, ENAME FROM EMP

-- 사원테이블의 구조만 복사하여 TEST04 테이블을 생성하자.
-- 조건이 FALSE가 되도록
CREATE TABLE TEST04 AS SELECT * FROM EMP WHERE 1=2;

-- 부서테이블(DEPT)의 구조만 복사하여 TEST05 테이블을 생성하자.
SELECT * FROM DEPT
CREATE TABLE TEST05 AS SELECT * FROM DEPT WHERE 1=2;

SELECT * FROM emp;
SELECT * FROM dept;


-- =================================bonus========================================
-- union 중복은 제거
SELECT deptno FROM dept UNION SELECT deptno FROM emp;

-- union all 중복 허용
SELECT deptno FROM dept union ALL SELECT deptno FROM emp;

-- 두개의 테이블에서 겹치는 것들만 중복제거하고 보여줌
SELECT deptno FROM dept INTERSECT SELECT deptno FROM emp;

-- 겹치는거 빼고 남은거
SELECT deptno FROM dept MINUS SELECT deptno FROM emp;

-- 컴퓨터 시간(현제 위치나 시간)에 따라 달라짐
SELECT sysdate FROM dual;

SELECT * FROM test01;

-- test01 테이블에서, 이름이 WARD인 사원의 월급을 200으로 바꾸자!
UPDATE test01
SET sal = 2000
WHERE ename = 'WARD';

SELECT * FROM test01;

-- test01 테이블에서, 이름이 WARD인 사원의 직업을 MANAGER로 바꾸고 부서를 20으로 바꾸자!
UPDATE test01 
SET job = 'MANAGER', deptno = '20'
WHERE ename = 'WARD';

SELECT * FROM test01;

-- 두 컬럼의 문자열 값을 하나의 칼럼으로 합쳐줌
SELECT empno || ename FROM emp;

-- 칼럼의 별칭
SELECT empno || ename AS "test" FROM emp;

-- sal과 comm이 합쳐짐(NULL은 연산에 포함되지 않아 NULL이 됨)
SELECT sal + comm FROM emp;
-- =========================================================================


CREATE TABLE emp1 AS SELECT * FROM emp 


-- ===================================연습문제======================================
-- 사원테이블의 모든 데이터를 출력하자.
SELECT * FROM emp;

--사원테이블에서 사원의 이름(ENAME), 사원번호(EMPNO), 월급(SAL)을 출력하자.
SELECT ename, empno, sal FROM emp;

--사원테이블에서 사원의 이름과 연봉을 출력하자.
SELECT ename, sal*12 FROM emp;
-- select ename, sal*12+comm from emp;

--사원테이블에서 사원의 이름, 입사일(HIREDATE), 부서번호(DEPTNO)를 출력하자.
SELECT ename, hiredate, deptno FROM emp;

--사원테이블에서 사원의 이름과, 사원을 관리하고 있는 관리자번호(MGR)를 출력하자.
SELECT ename, mgr FROM emp;

--사원테이블에서 사원의 이름, 월급, 커미션(COMM)을 출력하자.
SELECT ename, sal, comm FROM emp;

--사원테이블의 모든 데이터를 “oo님이 oo에 입사를 하고 oo의 월급을 받습니다.” 형식의 컬럼 하나로 출력하자.
SELECT ename||'님이'||deptno||'에'||HIREDATE||'입사를 하고'||sal||'의 월급을 받습니다.' AS cal FROM emp;

-- 부서테이블(DEPT)의 구조를 출력하자
DESC DEPT;
-- =========================================================================


SELECT * FROM emp;

-- =================================연습문제========================================
--사원테이블에서 사원번호가 ‘7844’인 사원의 사원번호, 이름, 월급을 출력하자.
SELECT empno, ename, sal FROM emp
WHERE empno = 7844;

--사원테이블에서 ‘SMITH’의 사원번호, 이름, 월급을 출력하자.
SELECT empno, ename, sal FROM emp
WHERE ename='SMITH';

--사원테이블에서 입사일이 1980년 12월 17일인 사원의 모든 데이터를 출력하자.
SELECT * FROM emp
WHERE hiredate='1980-12-17';
-- where hiredate='80/12/17' 도 됨
-- to_date('1980/12/17', 'yyyy/mm/dd')

--사원테이블에서 1980년 부터 1982년 사이에 입사한 사원의 이름과 입사일을 출력하자.
SELECT ename, hiredate FROM emp
WHERE '1980-01-01' <= hiredate AND hiredate <= '1982-12-31';
-- 연도 A betwwen B로도 된다

--사원테이블에서 월급이 2000 이하인 사원의 이름과 월급을 출력하자.
SELECT ename, sal FROM emp
WHERE sal <= 2000;

--사원테이블에서 월급이 1000 에서 2000 사이인 사원의 이름과 월급을 출력하자.
SELECT ename, sal FROM emp
WHERE sal >= 1000 AND sal <= 2000;

--사원번호가 7369 이거나, 7499 이거나, 7521인 사원들의 이름과 월급을 출력하자.
SELECT ename, sal FROM emp
WHERE empno=7369 or empno=7499 or empno=7521;
-- where empno in (7369, 7499, 7521) 도 된다
-- =========================================================================


SELECT * from emp;
-- =================================연습문제========================================
-- 사원테이블에서 사원의 이름과 월급을 출력하되, 월급을 내림차순으로 정렬하자.
SELECT ename, sal FROM emp
ORDER BY sal desc;

-- 사원테이블에서 직업별 평균 월급을 출력하되 컬럼 alias를 ‘평균’으로 하고, 평균 월급이 높은 순으로 정렬하자.
SELECT job, avg(sal) FROM emp
GROUP BY job
ORDER BY 2 desc;

-- 사원테이블에서 전체 사원의 평균 월급을 출력하자.
SELECT avg(sal) FROM emp;

-- 사원테이블에서 부서번호가 10인 부서에 근무하고 있는 사원들의 부서번호와 평균 월급을 출력하자.
SELECT deptno, avg(sal) FROM emp
HAVING deptno=10
GROUP BY deptno;

-- 사원테이블에서 직업별 평균 월급을 구하자.
SELECT job, avg(sal) FROM emp
GROUP BY job;

-- 사원테이블에서 10번 부서의 최대 월급을 출력하자.
SELECT deptno, max(sal) FROM emp
where deptno=10
GROUP BY deptno;

-- 사원테이블에서 부서 별 최대 월급을 출력하자.
SELECT deptno, max(sal) FROM emp
GROUP BY deptno;

-- 사원테이블에서 직업별 총 월급을 구하고, 총 월급이 5000 이상인 직업만 출력하자.
SELECT job, sum(sal) FROM emp
HAVING sum(sal) >= 5000
GROUP BY job;

-- 사원테이블에서 부서별 총 월급을 출력하되, 30번 부서를 제외하고, 총 월급이 8000 이상인 부서만, 총 월급이 높은 순으로 정렬하자.
SELECT deptno, sum(sal) FROM emp
WHERE deptno != 30 
GROUP BY deptno
HAVING sum(sal) >= 8000
ORDER BY sum(sal) desc;
-- =========================================================================


SELECT * FROM emp;
SELECT * FROM dept;
SELECT * FROM salgrade;

-- ===================================문제만들기======================================
-- 1. 사원테이블에서 JONES의 이름과 월급(sal), 직업(job)을 출력해라
SELECT ename, sal, job FROM emp
WHERE ename='JONES';

-- 2. 사원테이블에서 사원번호(empno)가 7698인 이름과 월급, 직업을 출력해라
SELECT ename, sal, job FROM emp
WHERE empno='7698';

-- 3. 사원테이블에서 10번 부서(deptno)의 월급 평균을 출력해라
SELECT deptno, avg(sal) FROM emp
WHERE deptno=10
GROUP BY deptno;

-- 4. 사원테이블에서 입사일(hiredate)이 1981년 이전인 사람의 이름과, 직업, 입사일, 부서를 출력해라
SELECT ename, job, hiredate, deptno FROM emp
WHERE hiredate < '1982-01-01';

-- 5. 사원테이블에서 부서가 20인 사람들 중 입사일(hiredate)이 1981년 이전인 사람의 이름과, 직업, 입사일, 부서를 출력해라
SELECT ename, job, hiredate, deptno FROM emp
WHERE deptno=20 AND hiredate < '1982-01-01';

-- 6. 사원테이블에서 1981년도 사람들의 월급 평균을 출력해라
SELECT avg(sal) FROM emp
WHERE hiredate >= '1981-01-01' AND hiredate  <= '1981-12-31'

-- 7. 사원 테이블에서 직업이 SALESMAN인 사람의 이름, 연봉을 출력해라
SELECT ename, sal*12 FROM emp
WHERE job='SALESMAN'

-- 8. 사원 테이블에서 각 직업별 평균을 구해라
SELECT job, avg(sal) FROM emp
GROUP BY job

-- 9. 사원 테이블에서 직업이 MANAGER인 사람의 이름과 직업을 출력해라
SELECT ename, job FROM emp
WHERE job='MANAGER'

-- 10. 사원 테이블에서 직업이 MANAGER인 사람의 월급의 총합을 구해라
SELECT sum(sal) FROM emp
GROUP BY job 
HAVING job='MANAGER'

-- =============================================================
SELECT lpad(ename, 7, '*') FROM EMP;

SELECT rpad(ename, 10, '*') FROM emp;

-- xyz라는 연속적인 str을 삭제하는 것이 아니라 x or y ro z를 왼쪽에서 삭제해 달라
-- 그리고 이게 아닌 str이 나오면 멈춘다. 그 옆에 x,y,z가 또나와도 삭제되지 않는다.
SELECT LTRIM('xyxzyyTech6 327', 'xyz') FROM DUAL;

SELECT rtrim('xyxzyyTech6 327', '0123456789') FROM dual;
SELECT rtrim('xyxzyyTech6 327', '0123456789 ') FROM dual;

-- 문자 `하나` 제거
SELECT trim('x' FROM 'xyxzyyTech6 327') FROM dual;
-- SELECT trim('xy' FROM 'xyxzyyTech6 327') FROM dual;


-- =============================================================
SELECT ename FROM emp;

-- oracle에서는 index가 1부터 시작한다
SELECT ename, substr(ename, 2, 1), substr(ename, -2) FROM emp;

SELECT ename, instr(ename, 'S', 1, 1) FROM emp;

-- 문자열 뒤에서 부터(-1) 'L'이 2번째 나타나는 지점
SELECT ename, instr(ename, 'L', -1, 2) FROM emp;

SELECT instr('abcccva', 'a', -1, 2) FROM dual;
-- 이메일 @찾아서 앞이나 뒤 없앨때 좋을지도

-- =============================================================
-- utf8 일때 한글 3byte
-- LENGTH / LENGTHB

-- ROUND / TRUNC 	지정한 자리에서 반올림 / 버림
-- `.`기준으로 0
SELECT
round(123.456),
round(123.456, 1),
trunc(123.456, 1),
trunc(123.456, -1)
FROM dual;

-- CEIL / FLOOR		올림/버림
SELECT ceil(123.456) FROM dual;

-- SELECT floor(123.456, 1) FROM dual; ,1 못함

SELECT ceil(sal / 1000),
floor(sal / 1000),
sal
FROM emp;

-- =============================================================
-- 입사한 지 20년이 되는 달 		ADD_MONTHS(날짜, 더하려는 개월)
SELECT ename, hiredate, add_months(hiredate, 240) FROM emp;

-- MONTHS_BETWEEN(날짜 1, 날짜 2)
-- 지정 두 날짜의 개월수 반환
SELECT ename, job, hiredate, trunc(MONTHS_BETWEEN('2000/01/01', hiredate)/12) FROM emp
WHERE MONTHS_BETWEEN('2000/01/01', hiredate) > 120; 

-- TO_CHAR 숫자 표현 형식
SELECT 
to_char(1234, '99999') AS q1,
to_char(1234, '00000') AS q2,
to_char(1234, 'l9999') AS q3,
to_char(1234, '9,999') AS q4
FROM dual;

-- to_char 날짜
SELECT 
to_char(sysdate, 'HH24:MI:SS') AS q1,
to_char(sysdate, 'MON DY, YYYY') AS q2,
to_char(sysdate, 'YYYY-FMMM-DD DAY') AS q3,
to_char(sysdate, 'YYYY-MM-DD') AS q4,
to_char(sysdate, 'YEAR, Q') AS q5
FROM dual;

-- to_date  문자 => 날짜
SELECT to_date('20100101', 'YYYYMMDD') FROM dual;
SELECT to_char(to_date('20100101', 'YYYYMMDD'), 'yyyy, mon') FROM dual;
SELECT to_char(to_date('210830 143001', 'yymmdd hh24miss'),
				'yy-mm-dd pm fmhh:mi:ss')
FROM dual;

-- to_number
SELECT hiredate FROM emp;

SELECT sysdate FROM dual; 		-- 현제 date형태 보기

SELECT ename,
TO_NUMBER(substr(hiredate, 1, 2)) AS 년도,
TO_NUMBER(substr(hiredate, 4, 2)) AS 월
FROM Emp

SELECT ename,
to_number(to_char(hiredate, 'yy')) AS 년도,
to_number(to_char(hiredate, 'mm')) AS 월
FROM emp

-- decode, case when
-- 사원 테이블에서 직업이 MANAGER인 사원 0
SELECT ename, job, decode(job, 'MANAGER', '0') FROM emp;

-- 월급이 1000보다 작음 초급, 2000보다 작음 2000, 위의 2개가 아니면 고급
SELECT ename, sal, CASE WHEN sal <= 1000 THEN '초급'
		WHEN sal <= 2000 THEN '중급' ELSE '고급' END
FROM emp;

-- 사원 테이블에서 직업이 MANAGER인 사원은 1, SALESMAN 인 사원은 2, 아니면 0 을 출력하자.
-- 해당 값이 같다/다르다만 비교한다면 decode가 편하다
SELECT ename, job,
decode(job, 'MANAGER', '1', 'SALESMAN', 2, 0) AS DECODE
FROM emp;

SELECT job, CASE WHEN job='MANAGER' THEN 1 WHEN job='SALESMAN' THEN 2 ELSE 0 END AS test FROM emp;

-- 집계함수
SELECT comm, nvl(comm, 0) FROM emp;
SELECT count(comm), count(nvl(comm, 0)) FROM emp;
-- 연산에서 NULL은 제외! 			NULL과의 연산은 NULL이 되서
-- 집계함수에 조건문을 사용시 -> where대신 having사용

-- 사원의 연봉 출력(comm 생각!)
SELECT sal * 12 + nvl(comm, 0) FROM emp;

-- 그룹함수
SELECT job, deptno, avg(sal) FROM EMP
GROUP BY rollup(job, deptno);

SELECT job, deptno, avg(sal) FROM emp
GROUP BY cube(job, deptno);

-- grouping sets 원하는 구룹들에 추가로 보고싶다
SELECT job, deptno, avg(sal) FROM EMP
GROUP BY GROUPING SETS(rollup(job, deptno), deptno);

-- =============================================================
-- rowid / rownum
CREATE TABLE rowtest(
	NO number
);

INSERT INTO rowtest
values(111);

INSERT INTO rowtest
values(222);

INSERT INTO rowtest
values(333);

SELECT * FROM rowtest;

SELECT rowid, rownum, NO FROM rowtest;
-- ROWID 해당row(tuble)의 내부적인 고유 식별자
-- ROWNUM excel같은거 자동으로 잡히는 숫자(위에서부터 몇번째)

--DELETE FROM rowtest WHERE NO = 222;

-- Top N Query
-- rownum은 처음 insert한 순서대로 고정되어 있음
SELECT ename, sal, rownum 
FROM (SELECT ename, sal, rownum FROM emp ORDER BY sal DESC)	--가상 table(정렬되어있는 상태의)
WHERE rownum <= 3;											--rownum은 우리가 제어하는 것이 아닌 oracle 내부적으로 제어

SELECT ename, sal, rn
FROM (SELECT ename, sal, rownum AS rn 
	 FROM (SELECT ename, sal, rownum FROM emp ORDER BY sal DESC))
WHERE rn >= 3 AND rn <= 5;
-- 월급 많이 받는 순서대로 3등부터 5등까지

-- 순위함수
SELECT ename, sal,
	rank() over(ORDER BY sal desc) AS RANK,					--동일 순위 포함하고(9,9) 그다음순위(10) 생략
	dense_rank() over(ORDER BY sal desc) AS dense,			--동일 순위 포함하고(9,9) 그다음순위(10) 인정
	row_number() over(ORDER BY sal desc) AS rownb			--같더라도 순위를 매김
FROM emp;

-- ===========================================================================
--사원테이블에서 사원의 이름을 첫글자는 대문자로, 나머지는 소문자로 출력하자.
SELECT ename, replace(ename, substr(ename, 2), lower(substr(ename, 2))) AS ename2 FROM emp;
-- select upper(substr(ename, 1, 1)) || lower(substr(ename, 2)) from emp;
-- select initcap(ename) from emp; 		--첫번째 대문자, 그다음부터 소문자로 자동 치환

--사원테이블에서 사원의 이름을 출력하고, 이름의 두번째 글자부터 네번째 글자까지만 출력하자.
SELECT ename, substr(ename, 2, 3) FROM emp;

--사원테이블에서 사원 이름과 근무일수(고용일 ~ 현재 날짜)를 출력하자. (한달을 30일로 계산)
SELECT ename, sysdate-hiredate, trunc(months_between(sysdate,hiredate)*30) AS num FROM emp;

--사원테이블에서 각 사원 이름의 철자 개수를 출력하자.
SELECT ename, length(ename) FROM emp;

--사원테이블에서 사원의 이름이 M으로 시작하는 사원들의 이름을 출력하자.
SELECT ename FROM emp
--WHERE substr(ename, 1, 1)='M';
where ename like 'M%';				--LIKE condition

-- ========================================================================
-- subquery( Nested Select )

-- SINGLE ROW SUBQUERY
-- JONES 보다 더 많은 월급을 받는 사원의 이름과 월급을 출력하자
SELECT ename, sal
FROM emp
WHERE sal > (SELECT sal FROM emp WHERE ename = 'JONES')

-- MULTI ROW SUBQUERY
-- 부하직원이 없는 사원의 사원번호와 이름을 출력하자
SELECT empno, ename FROM emp
--WHERE empno != (SELECT nvl(mgr, 0) FROM emp);		-- (select)는 여러항목이고 empno는 한항목이기 때문에 비교할 수없음
WHERE empno NOT IN (SELECT nvl(mgr, 0) FROM emp);

--MULTI COLUMN SUBQUERY 한번에 같이 비교(조건이 같은경우에만 한번에 쓸수 있음)
-- 직업이 ‘SALESMAN’인 사원과 같은 부서에서 근무하고
-- 직업이 ‘SALESMAN’인 사원과 같은 월급을 받는 사원들의 이름, 월급, 부서번호를 출력하자
SELECT ename, sal, deptno FROM emp
WHERE (deptno, sal) IN (SELECT deptno, sal FROM emp WHERE job = 'SALESMAN');

--INLINE VIEW 		결과가 가상테이블로 사용
-- 자기 부서의 평균 월급보다 더 많은 월급을 받는 사원들의 이름, 월급, 부서번호, 부서별 평균 월급을 출력하자
SELECT e.ename, e.sal, mydept.deptno, mydept.myavg 
FROM emp e, (SELECT deptno, avg(sal) AS myavg FROM emp GROUP BY deptno) mydept 
WHERE e.deptno = mydept.deptno AND e.sal > mydept.myavg;

--======================================subquery=========================================================
SELECT * FROM emp;
SELECT * FROM dept;
--문제가 subquery를 사용하는 문제인거 같음 문제를 먼저 나눠야 한다.
--‘CHICAGO’에서 근무하는 사원들과 같은 부서에서 근무하는 사원의 이름과 월급을 출력하자.
SELECT e.ename, e.sal
FROM emp e, (SELECT deptno, loc FROM dept WHERE loc='CHICAGO') loc
WHERE e.deptno = loc.deptno;

SELECT ename, sal FROM emp
WHERE deptno = (SELECT deptno FROM dept WHERE loc = 'CHICAGO');

--관리자의 이름이 ‘KING’인 사원의 이름과 월급을 출력하자.
-- join
SELECT e.ename, e.sal
FROM emp e, (SELECT ename, empno FROM emp WHERE ename='KING') mgr
WHERE e.mgr = mgr.empno;

-- subquery
SELECT ename, sal FROM emp
WHERE mgr = (SELECT empno FROM emp WHERE ename = 'KING');

--전체 사원 중, 20번 부서의 사원 중 가장 많은 월급을 받는 사원보다 더 많은 월급을 받는 사원들의 이름과 월급을 출력하자.
SELECT e.ename, e.sal FROM emp e,
	(SELECT sal 
	FROM (SELECT ename, sal, deptno, rank() OVER(ORDER BY sal DESC) AS RAN
		FROM emp WHERE deptno='20')
		WHERE ran = 1) ran
WHERE  ran.sal < e.sal;

SELECT ename, sal
FROM emp
WHERE sal > 

--전체 사원 중, 직업이 ‘SALESMAN’인 사원 중 가장 많은 월급을 받는 사원보다 더 많은 월급을 받는 사원들의 이름과 월급을 출력하되,
--MAX()함수를 사용하지 말자. (ANY(=여러항목 마다 or), ALL(=여러항목 마다 and) 연산자)
SELECT e.ename, e.sal FROM emp e,
	(SELECT sal 
	FROM (SELECT ename, sal, rank() OVER(ORDER BY sal DESC) AS RAN
		FROM emp WHERE job='SALESMAN')
		WHERE ran = 1) ran
WHERE  ran.sal < e.sal;

--‘BLAKE’가 근무하는 부서의 위치(LOC)를 출력하자.
SELECT d.loc FROM dept d,
	(SELECT ename, deptno FROM emp WHERE ename='BLAKE') en
WHERE en.deptno = d.deptno;

--이름에 ’S’가 들어가는 사원과 동일한 부서에서 근무하는 사원 중, 자신의 월급이 전체 사원의 평균 월급보다 많은 사원들의
--사원번호, 이름, 월급을 출력하자.x
SELECT e.empno, e.ename, e.sal 
FROM (SELECT empno, ename, sal FROM emp WHERE ename LIKE '%S%') subS,
 	(SELECT avg(sal) AS avg FROM emp) avgsal, emp e
WHERE subS.sal > avgsal.avg;

--사원번호가 7369인 사원과 같은 직업이고, 월급이 7876인 사원보다 많이 받는 사원의 이름과 직업을 출력하자.x
SELECT * FROM emp;

SELECT e.ename, e.job 
FROM emp e,
	(SELECT empno, ename, sal FROM emp
	WHERE empno = 7369) no73,
WHERE e.sal > no73.sal;

--===================================================================================================
SELECT * FROM emp;
SELECT * FROM salgrade;

--non equi
SELECT *
FROM emp e JOIN salgrade sg ON (e.sal BETWEEN sg.losal AND sg.hisal);

--slef join
SELECT 사원.ename, 사원.empno, 관리자.ename, 관리자.empno
FROM emp 사원, emp 관리자
WHERE 사원.mgr = 관리자.empno(+);

SELECT 사원.ename, 사원.empno, 관리자.ename, 관리자.empno
FROM emp 사원 LEFT OUTER JOIN emp 관리자 ON (사원.mgr = 관리자.empno);

--=========================================join======================================================
SELECT * FROM emp;
SELECT * FROM dept;
SELECT * FROM salgrade;

--사원들의 이름, 부서번호, 부서이름을 출력하자.
SELECT e.ename, e.deptno, de.dname
FROM emp e, dept de
WHERE e.deptno = de.deptno;

--‘DALLAS’에서 근무하는 사원의 이름, 직업, 부서번호, 부서이름을 출력하자.
SELECT e.ename, e.job, e.deptno, de.dname
FROM emp e, dept de
WHERE e.deptno = de.deptno AND de.loc = 'DALLAS'

SELECT e.ename, e.job, e.deptno, d.dname FROM emp e JOIN dept d on(e.deptno = d.deptno) WHERE d.loc='DALLAS'

SELECT ename, job, deptno, dname FROM emp JOIN dept using(deptno) WHERE loc = 'DALLAS'

--이름에 ‘A’가 들어가는 사원들의 이름과 부서이름을 출력하자.
SELECT e.ename, de.dname
FROM emp e, dept de 
WHERE e.ename LIKE '%A%' AND e.deptno = de.deptno;

SELECT e.ename, de.dname FROM emp e JOIN dept de ON (e.deptno = de.deptno) WHERE e.ename LIKE '%A%';

SELECT ename, dname FROM emp JOIN dept using(deptno) WHERE ename LIKE '%A%';

--사원의 이름과 부서이름, 월급을 출력하되, 월급이 3000 이상인 사원들만 출력하자.
SELECT e.ename, de.dname, e.sal
FROM emp e, dept de
WHERE e.deptno = de.deptno AND e.sal >= 3000;

SELECT e.ename, de.dname, e.sal FROM emp e JOIN dept de on(e.deptno = de.deptno) where e.sal >= 3000;

SELECT ename, dname, sal FROM emp JOIN dept USING(deptno) where sal >= 3000;

--사원테이블과 급여테이블(SALGRADE)에서 커미션이 책정된 사원들의 사원번호, 이름, 연봉, 연봉+커미션, 급여등급(GRADE)을 출력하자.
SELECT e.empno, e.sal*12, e.sal*12+nvl(e.comm, 0), sg.grade
FROM emp e, salgrade sg
WHERE (e.sal BETWEEN sg.losal AND sg.HISAL)
	AND comm IS NOT null;

SELECT e.empno, e.ename, e.sal*12, e.sal*12+nvl(e.comm, 0), sg.grade
FROM emp e JOIN salgrade sg ON e.sal BETWEEN sg.losal AND sg.hisal
AND comm IS NOT null;

--부서번호가 10번인 사원들의 부서번호, 부서이름, 사원이름, 월급, 급여등급을 출력하자.
SELECT e.deptno, de.dname, e.ename, e.sal, sg.grade
FROM emp e, salgrade sg, dept de
WHERE (e.sal BETWEEN sg.losal AND sg.hisal) 
	AND e.deptno = de.deptno 
	AND e.deptno = 10;

SELECT deptno, dname, ename, sal, grade
FROM dept JOIN emp using(deptno) JOIN salgrade ON (sal BETWEEN losal AND hisal)
WHERE deptno = 10;

--부서번호가 10번이거나 20번인 사원들의 부서번호, 부서이름, 사원이름, 급여등급을 출력하되,
--부서번호가 낮은 순으로, 월급이 높은 순으로 출력하자.
SELECT e.deptno, de.dname, e.ename, sg.grade
FROM emp e, salgrade sg, dept de
WHERE (e.sal BETWEEN sg.losal AND sg.hisal) 
	AND e.deptno = de.deptno 
	AND (e.deptno = 10 OR e.deptno = 20)		-- WHERE deptno IN(10, 20)
ORDER BY e.deptno ASC, e.sal DESC;

SELECT deptno, dname, ename, grade
FROM emp JOIN dept using(deptno) JOIN salgrade ON (sal BETWEEN losal AND hisal)
WHERE deptno = 10 OR deptno = 20
ORDER BY deptno ASC, sal DESC;

--사원번호와 이름, 관리자의 사원번호와 관리자이름을 출력하자.
SELECT e.empno, e.ename, mgr.empno, mgr.ename
FROM emp e, emp mgr
WHERE e.mgr = mgr.empno(+);

SELECT e.empno, e.ename, mgr.empno, mgr.ename
FROM emp e JOIN emp mgr ON (e.mgr = mgr.empno(+));

--부서이름, 위치, 각 부서의 사원수, 평균 월급을 출력하자.
SELECT de.dname, de.loc, e2.con, e2.av
FROM dept de,
	(SELECT deptno, count(deptno) AS con, avg(sal) AS av
	FROM emp GROUP BY deptno) e2
WHERE de.deptno = e2.deptno(+);

SELECT dname, loc, con, av
FROM dept LEFT outer join 
	(SELECT deptno, count(deptno) AS con, avg(sal) AS av FROM emp GROUP BY deptno)
	using(deptno);

SELECT dname, loc, count(*), avg(sal)
FROM emp JOIN dept using(deptno)
GROUP BY dname, loc;

SELECT de.dname, de.loc, count(*), avg(sal)
FROM dept de, emp e
WHERE e.deptno = de.deptno
GROUP BY de.dname, de.loc;

--===================================================================================
SELECT * FROM emp;
SELECT * FROM dept;
SELECT * FROM salgrade;

--1. 사원 테이블(emp)에서 1분기에 입사(hiredate)한 사람의 사원번호, 이름, 직업, 입사일을 출력해라
SELECT empno, ename, job, hiredate
FROM emp
WHERE to_char(hiredate, 'q') = 1;

--2. 사원 테이블에서 JONES의 근속일을 구해라(1달은 30일로 한다.)
SELECT trunc(months_between(sysdate, hiredate)) FROM emp WHERE ename = 'JONES';

--3. 사원 테이블에서 SALES에 근무하는 사람들의 사원번호, 이름, 직업, 연봉을 출력해라
SELECT empno, ename, job, sal
FROM emp
WHERE deptno = 
	(SELECT deptno FROM dept WHERE dname = 'SALES');

--4. 사원 테이블에서 NEW YORK에 근무하면서 월급이 1000이상인 사람의 사원번호, 이름, 직업을 출력해라
SELECT empno, ename, job
FROM emp
WHERE sal > 1000 AND
	deptno = (SELECT deptno FROM dept WHERE loc = 'NEW YORK');

--5. 연봉(comm포함) 이 30000이상인 사람의 사원번호, 이름, 직업, 연봉을 출력해라
SELECT empno, ename, job, ye
FROM emp  JOIN (SELECT empno, sal*12+nvl(comm, 0)AS ye FROM emp) using(empno)
WHERE ye >= 30000;

--6. 연봉(comm포함)이 30000이상인 사람의 사원번호, 이름, 직업, 부서명을 출력해라
SELECT empno, ename, job, dname
FROM emp JOIN (SELECT empno, sal*12+nvl(comm,0) AS ye FROM emp) using(empno)
	JOIN dept USING (deptno)
WHERE ye >= 30000;

--7. 사수가 없는 사람의 사원번호, 이름, 직업, 사수 사원번호, 부서명을 출력해라
SELECT e.empno, e.ename, e.job, e.mgr, d.dname
FROM emp e left OUTER JOIN emp mgr ON (e.mgr = mgr.empno)
	JOIN dept d ON (e.deptno = d.deptno)
WHERE e.mgr IS NULL

--8. 월급이 2000이상이고 NEW YORK에서 일하는 사람의 사원번호, 이름, 직업, 부서명을 출력해라
SELECT empno, ename, job, dname
FROM emp JOIN dept USING (deptno)
WHERE sal > 2000 AND loc = 'NEW YORK';

--9. 월급 등급이 3등급 이상인 사람의 이름 직업, 부서명, 일하는 지역을 출력해라
SELECT ename, job, dname, loc
FROM emp JOIN salgrade ON (sal BETWEEN losal AND hisal)
	JOIN dept USING (deptno)
WHERE grade >= 3;

--10. 각 부서별 평균이 가장 높은 부서 사람들의 이름, 직업, 월급, 월급 등급을 출력하라
SELECT e.ename, e.job, e.sal, grade
FROM emp e JOIN salgrade ON (sal BETWEEN losal AND hisal)
	JOIN dept d on (e.deptno = d.deptno), 
	(SELECT deptno, avg
	FROM (SELECT avg(sal) AS avg, deptno
		FROM emp GROUP BY deptno 
		ORDER BY avg desc)
	WHERE rownum = 1) st
WHERE e.deptno = st.deptno;
	




