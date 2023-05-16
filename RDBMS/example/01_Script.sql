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

SELECT sequence_test.nextval FROM dual;  -- dual ����Ŭ���� ����ϴ� �ӽ� ���̺�
-- ��ü����
CREATE TABLE myemp AS SELECT * FROM emp;  -- ����

SELECT * FROM myemp;
-- drop table myemp;
-- ���ϴ� �÷� ����
CREATE TABLE emps AS SELECT EMPNO,ENAME FROM emp;
SELECT * FROM emps;

-- ����(�÷�) ����
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
-- SIZE�� 10�� �������� ������ �÷� ID�� SIZE�� 10�� �������� ������ �÷� PW�� ���� TEST ���̺��� ��������.
CREATE TABLE TEST(
	ID VARCHAR2(10),
	PW char(10)
);

-- ===============================��������==========================================
-- ������̺�(EMP)�� ��� ������ �����͸� �����Ͽ� TEST01 ���̺��� ��������.
CREATE TABLE TEST01 AS SELECT * FROM EMP;

-- ������̺��� �����ȣ�� �̸��� �����Ͽ� TEST02 ���̺��� ��������.
SELECT * FROM TEST02
CREATE TABLE TEST02 AS SELECT EMPNO, ENAME FROM EMP;

-- ������̺��� �����ȣ�� �÷����� M1, �̸��� �÷����� M2�� ���� �ϸ鼭 �����Ͽ� TEST03 ���̺��� ��������.
CREATE TABLE TEST03(M1, M2) AS SELECT EMPNO, ENAME FROM EMP

-- ������̺��� ������ �����Ͽ� TEST04 ���̺��� ��������.
-- ������ FALSE�� �ǵ���
CREATE TABLE TEST04 AS SELECT * FROM EMP WHERE 1=2;

-- �μ����̺�(DEPT)�� ������ �����Ͽ� TEST05 ���̺��� ��������.
SELECT * FROM DEPT
CREATE TABLE TEST05 AS SELECT * FROM DEPT WHERE 1=2;

SELECT * FROM emp;
SELECT * FROM dept;


-- =================================bonus========================================
-- union �ߺ��� ����
SELECT deptno FROM dept UNION SELECT deptno FROM emp;

-- union all �ߺ� ���
SELECT deptno FROM dept union ALL SELECT deptno FROM emp;

-- �ΰ��� ���̺��� ��ġ�� �͵鸸 �ߺ������ϰ� ������
SELECT deptno FROM dept INTERSECT SELECT deptno FROM emp;

-- ��ġ�°� ���� ������
SELECT deptno FROM dept MINUS SELECT deptno FROM emp;

-- ��ǻ�� �ð�(���� ��ġ�� �ð�)�� ���� �޶���
SELECT sysdate FROM dual;

SELECT * FROM test01;

-- test01 ���̺���, �̸��� WARD�� ����� ������ 200���� �ٲ���!
UPDATE test01
SET sal = 2000
WHERE ename = 'WARD';

SELECT * FROM test01;

-- test01 ���̺���, �̸��� WARD�� ����� ������ MANAGER�� �ٲٰ� �μ��� 20���� �ٲ���!
UPDATE test01 
SET job = 'MANAGER', deptno = '20'
WHERE ename = 'WARD';

SELECT * FROM test01;

-- �� �÷��� ���ڿ� ���� �ϳ��� Į������ ������
SELECT empno || ename FROM emp;

-- Į���� ��Ī
SELECT empno || ename AS "test" FROM emp;

-- sal�� comm�� ������(NULL�� ���꿡 ���Ե��� �ʾ� NULL�� ��)
SELECT sal + comm FROM emp;
-- =========================================================================


CREATE TABLE emp1 AS SELECT * FROM emp 


-- ===================================��������======================================
-- ������̺��� ��� �����͸� �������.
SELECT * FROM emp;

--������̺��� ����� �̸�(ENAME), �����ȣ(EMPNO), ����(SAL)�� �������.
SELECT ename, empno, sal FROM emp;

--������̺��� ����� �̸��� ������ �������.
SELECT ename, sal*12 FROM emp;
-- select ename, sal*12+comm from emp;

--������̺��� ����� �̸�, �Ի���(HIREDATE), �μ���ȣ(DEPTNO)�� �������.
SELECT ename, hiredate, deptno FROM emp;

--������̺��� ����� �̸���, ����� �����ϰ� �ִ� �����ڹ�ȣ(MGR)�� �������.
SELECT ename, mgr FROM emp;

--������̺��� ����� �̸�, ����, Ŀ�̼�(COMM)�� �������.
SELECT ename, sal, comm FROM emp;

--������̺��� ��� �����͸� ��oo���� oo�� �Ի縦 �ϰ� oo�� ������ �޽��ϴ�.�� ������ �÷� �ϳ��� �������.
SELECT ename||'����'||deptno||'��'||HIREDATE||'�Ի縦 �ϰ�'||sal||'�� ������ �޽��ϴ�.' AS cal FROM emp;

-- �μ����̺�(DEPT)�� ������ �������
DESC DEPT;
-- =========================================================================


SELECT * FROM emp;

-- =================================��������========================================
--������̺��� �����ȣ�� ��7844���� ����� �����ȣ, �̸�, ������ �������.
SELECT empno, ename, sal FROM emp
WHERE empno = 7844;

--������̺��� ��SMITH���� �����ȣ, �̸�, ������ �������.
SELECT empno, ename, sal FROM emp
WHERE ename='SMITH';

--������̺��� �Ի����� 1980�� 12�� 17���� ����� ��� �����͸� �������.
SELECT * FROM emp
WHERE hiredate='1980-12-17';
-- where hiredate='80/12/17' �� ��
-- to_date('1980/12/17', 'yyyy/mm/dd')

--������̺��� 1980�� ���� 1982�� ���̿� �Ի��� ����� �̸��� �Ի����� �������.
SELECT ename, hiredate FROM emp
WHERE '1980-01-01' <= hiredate AND hiredate <= '1982-12-31';
-- ���� A betwwen B�ε� �ȴ�

--������̺��� ������ 2000 ������ ����� �̸��� ������ �������.
SELECT ename, sal FROM emp
WHERE sal <= 2000;

--������̺��� ������ 1000 ���� 2000 ������ ����� �̸��� ������ �������.
SELECT ename, sal FROM emp
WHERE sal >= 1000 AND sal <= 2000;

--�����ȣ�� 7369 �̰ų�, 7499 �̰ų�, 7521�� ������� �̸��� ������ �������.
SELECT ename, sal FROM emp
WHERE empno=7369 or empno=7499 or empno=7521;
-- where empno in (7369, 7499, 7521) �� �ȴ�
-- =========================================================================


SELECT * from emp;
-- =================================��������========================================
-- ������̺��� ����� �̸��� ������ ����ϵ�, ������ ������������ ��������.
SELECT ename, sal FROM emp
ORDER BY sal desc;

-- ������̺��� ������ ��� ������ ����ϵ� �÷� alias�� ����ա����� �ϰ�, ��� ������ ���� ������ ��������.
SELECT job, avg(sal) FROM emp
GROUP BY job
ORDER BY 2 desc;

-- ������̺��� ��ü ����� ��� ������ �������.
SELECT avg(sal) FROM emp;

-- ������̺��� �μ���ȣ�� 10�� �μ��� �ٹ��ϰ� �ִ� ������� �μ���ȣ�� ��� ������ �������.
SELECT deptno, avg(sal) FROM emp
HAVING deptno=10
GROUP BY deptno;

-- ������̺��� ������ ��� ������ ������.
SELECT job, avg(sal) FROM emp
GROUP BY job;

-- ������̺��� 10�� �μ��� �ִ� ������ �������.
SELECT deptno, max(sal) FROM emp
where deptno=10
GROUP BY deptno;

-- ������̺��� �μ� �� �ִ� ������ �������.
SELECT deptno, max(sal) FROM emp
GROUP BY deptno;

-- ������̺��� ������ �� ������ ���ϰ�, �� ������ 5000 �̻��� ������ �������.
SELECT job, sum(sal) FROM emp
HAVING sum(sal) >= 5000
GROUP BY job;

-- ������̺��� �μ��� �� ������ ����ϵ�, 30�� �μ��� �����ϰ�, �� ������ 8000 �̻��� �μ���, �� ������ ���� ������ ��������.
SELECT deptno, sum(sal) FROM emp
WHERE deptno != 30 
GROUP BY deptno
HAVING sum(sal) >= 8000
ORDER BY sum(sal) desc;
-- =========================================================================


SELECT * FROM emp;
SELECT * FROM dept;
SELECT * FROM salgrade;

-- ===================================���������======================================
-- 1. ������̺��� JONES�� �̸��� ����(sal), ����(job)�� ����ض�
SELECT ename, sal, job FROM emp
WHERE ename='JONES';

-- 2. ������̺��� �����ȣ(empno)�� 7698�� �̸��� ����, ������ ����ض�
SELECT ename, sal, job FROM emp
WHERE empno='7698';

-- 3. ������̺��� 10�� �μ�(deptno)�� ���� ����� ����ض�
SELECT deptno, avg(sal) FROM emp
WHERE deptno=10
GROUP BY deptno;

-- 4. ������̺��� �Ի���(hiredate)�� 1981�� ������ ����� �̸���, ����, �Ի���, �μ��� ����ض�
SELECT ename, job, hiredate, deptno FROM emp
WHERE hiredate < '1982-01-01';

-- 5. ������̺��� �μ��� 20�� ����� �� �Ի���(hiredate)�� 1981�� ������ ����� �̸���, ����, �Ի���, �μ��� ����ض�
SELECT ename, job, hiredate, deptno FROM emp
WHERE deptno=20 AND hiredate < '1982-01-01';

-- 6. ������̺��� 1981�⵵ ������� ���� ����� ����ض�
SELECT avg(sal) FROM emp
WHERE hiredate >= '1981-01-01' AND hiredate  <= '1981-12-31'

-- 7. ��� ���̺��� ������ SALESMAN�� ����� �̸�, ������ ����ض�
SELECT ename, sal*12 FROM emp
WHERE job='SALESMAN'

-- 8. ��� ���̺��� �� ������ ����� ���ض�
SELECT job, avg(sal) FROM emp
GROUP BY job

-- 9. ��� ���̺��� ������ MANAGER�� ����� �̸��� ������ ����ض�
SELECT ename, job FROM emp
WHERE job='MANAGER'

-- 10. ��� ���̺��� ������ MANAGER�� ����� ������ ������ ���ض�
SELECT sum(sal) FROM emp
GROUP BY job 
HAVING job='MANAGER'

-- =============================================================
SELECT lpad(ename, 7, '*') FROM EMP;

SELECT rpad(ename, 10, '*') FROM emp;

-- xyz��� �������� str�� �����ϴ� ���� �ƴ϶� x or y ro z�� ���ʿ��� ������ �޶�
-- �׸��� �̰� �ƴ� str�� ������ �����. �� ���� x,y,z�� �ǳ��͵� �������� �ʴ´�.
SELECT LTRIM('xyxzyyTech6 327', 'xyz') FROM DUAL;

SELECT rtrim('xyxzyyTech6 327', '0123456789') FROM dual;
SELECT rtrim('xyxzyyTech6 327', '0123456789 ') FROM dual;

-- ���� `�ϳ�` ����
SELECT trim('x' FROM 'xyxzyyTech6 327') FROM dual;
-- SELECT trim('xy' FROM 'xyxzyyTech6 327') FROM dual;


-- =============================================================
SELECT ename FROM emp;

-- oracle������ index�� 1���� �����Ѵ�
SELECT ename, substr(ename, 2, 1), substr(ename, -2) FROM emp;

SELECT ename, instr(ename, 'S', 1, 1) FROM emp;

-- ���ڿ� �ڿ��� ����(-1) 'L'�� 2��° ��Ÿ���� ����
SELECT ename, instr(ename, 'L', -1, 2) FROM emp;

SELECT instr('abcccva', 'a', -1, 2) FROM dual;
-- �̸��� @ã�Ƽ� ���̳� �� ���ٶ� ��������

-- =============================================================
-- utf8 �϶� �ѱ� 3byte
-- LENGTH / LENGTHB

-- ROUND / TRUNC 	������ �ڸ����� �ݿø� / ����
-- `.`�������� 0
SELECT
round(123.456),
round(123.456, 1),
trunc(123.456, 1),
trunc(123.456, -1)
FROM dual;

-- CEIL / FLOOR		�ø�/����
SELECT ceil(123.456) FROM dual;

-- SELECT floor(123.456, 1) FROM dual; ,1 ����

SELECT ceil(sal / 1000),
floor(sal / 1000),
sal
FROM emp;

-- =============================================================
-- �Ի��� �� 20���� �Ǵ� �� 		ADD_MONTHS(��¥, ���Ϸ��� ����)
SELECT ename, hiredate, add_months(hiredate, 240) FROM emp;

-- MONTHS_BETWEEN(��¥ 1, ��¥ 2)
-- ���� �� ��¥�� ������ ��ȯ
SELECT ename, job, hiredate, trunc(MONTHS_BETWEEN('2000/01/01', hiredate)/12) FROM emp
WHERE MONTHS_BETWEEN('2000/01/01', hiredate) > 120; 

-- TO_CHAR ���� ǥ�� ����
SELECT 
to_char(1234, '99999') AS q1,
to_char(1234, '00000') AS q2,
to_char(1234, 'l9999') AS q3,
to_char(1234, '9,999') AS q4
FROM dual;

-- to_char ��¥
SELECT 
to_char(sysdate, 'HH24:MI:SS') AS q1,
to_char(sysdate, 'MON DY, YYYY') AS q2,
to_char(sysdate, 'YYYY-FMMM-DD DAY') AS q3,
to_char(sysdate, 'YYYY-MM-DD') AS q4,
to_char(sysdate, 'YEAR, Q') AS q5
FROM dual;

-- to_date  ���� => ��¥
SELECT to_date('20100101', 'YYYYMMDD') FROM dual;
SELECT to_char(to_date('20100101', 'YYYYMMDD'), 'yyyy, mon') FROM dual;
SELECT to_char(to_date('210830 143001', 'yymmdd hh24miss'),
				'yy-mm-dd pm fmhh:mi:ss')
FROM dual;

-- to_number
SELECT hiredate FROM emp;

SELECT sysdate FROM dual; 		-- ���� date���� ����

SELECT ename,
TO_NUMBER(substr(hiredate, 1, 2)) AS �⵵,
TO_NUMBER(substr(hiredate, 4, 2)) AS ��
FROM Emp

SELECT ename,
to_number(to_char(hiredate, 'yy')) AS �⵵,
to_number(to_char(hiredate, 'mm')) AS ��
FROM emp

-- decode, case when
-- ��� ���̺��� ������ MANAGER�� ��� 0
SELECT ename, job, decode(job, 'MANAGER', '0') FROM emp;

-- ������ 1000���� ���� �ʱ�, 2000���� ���� 2000, ���� 2���� �ƴϸ� ���
SELECT ename, sal, CASE WHEN sal <= 1000 THEN '�ʱ�'
		WHEN sal <= 2000 THEN '�߱�' ELSE '���' END
FROM emp;

-- ��� ���̺��� ������ MANAGER�� ����� 1, SALESMAN �� ����� 2, �ƴϸ� 0 �� �������.
-- �ش� ���� ����/�ٸ��ٸ� ���Ѵٸ� decode�� ���ϴ�
SELECT ename, job,
decode(job, 'MANAGER', '1', 'SALESMAN', 2, 0) AS DECODE
FROM emp;

SELECT job, CASE WHEN job='MANAGER' THEN 1 WHEN job='SALESMAN' THEN 2 ELSE 0 END AS test FROM emp;

-- �����Լ�
SELECT comm, nvl(comm, 0) FROM emp;
SELECT count(comm), count(nvl(comm, 0)) FROM emp;
-- ���꿡�� NULL�� ����! 			NULL���� ������ NULL�� �Ǽ�
-- �����Լ��� ���ǹ��� ���� -> where��� having���

-- ����� ���� ���(comm ����!)
SELECT sal * 12 + nvl(comm, 0) FROM emp;

-- �׷��Լ�
SELECT job, deptno, avg(sal) FROM EMP
GROUP BY rollup(job, deptno);

SELECT job, deptno, avg(sal) FROM emp
GROUP BY cube(job, deptno);

-- grouping sets ���ϴ� ����鿡 �߰��� ����ʹ�
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
-- ROWID �ش�row(tuble)�� �������� ���� �ĺ���
-- ROWNUM excel������ �ڵ����� ������ ����(���������� ���°)

--DELETE FROM rowtest WHERE NO = 222;

-- Top N Query
-- rownum�� ó�� insert�� ������� �����Ǿ� ����
SELECT ename, sal, rownum 
FROM (SELECT ename, sal, rownum FROM emp ORDER BY sal DESC)	--���� table(���ĵǾ��ִ� ������)
WHERE rownum <= 3;											--rownum�� �츮�� �����ϴ� ���� �ƴ� oracle ���������� ����

SELECT ename, sal, rn
FROM (SELECT ename, sal, rownum AS rn 
	 FROM (SELECT ename, sal, rownum FROM emp ORDER BY sal DESC))
WHERE rn >= 3 AND rn <= 5;
-- ���� ���� �޴� ������� 3����� 5�����

-- �����Լ�
SELECT ename, sal,
	rank() over(ORDER BY sal desc) AS RANK,					--���� ���� �����ϰ�(9,9) �״�������(10) ����
	dense_rank() over(ORDER BY sal desc) AS dense,			--���� ���� �����ϰ�(9,9) �״�������(10) ����
	row_number() over(ORDER BY sal desc) AS rownb			--������ ������ �ű�
FROM emp;

-- ===========================================================================
--������̺��� ����� �̸��� ù���ڴ� �빮�ڷ�, �������� �ҹ��ڷ� �������.
SELECT ename, replace(ename, substr(ename, 2), lower(substr(ename, 2))) AS ename2 FROM emp;
-- select upper(substr(ename, 1, 1)) || lower(substr(ename, 2)) from emp;
-- select initcap(ename) from emp; 		--ù��° �빮��, �״������� �ҹ��ڷ� �ڵ� ġȯ

--������̺��� ����� �̸��� ����ϰ�, �̸��� �ι�° ���ں��� �׹�° ���ڱ����� �������.
SELECT ename, substr(ename, 2, 3) FROM emp;

--������̺��� ��� �̸��� �ٹ��ϼ�(����� ~ ���� ��¥)�� �������. (�Ѵ��� 30�Ϸ� ���)
SELECT ename, sysdate-hiredate, trunc(months_between(sysdate,hiredate)*30) AS num FROM emp;

--������̺��� �� ��� �̸��� ö�� ������ �������.
SELECT ename, length(ename) FROM emp;

--������̺��� ����� �̸��� M���� �����ϴ� ������� �̸��� �������.
SELECT ename FROM emp
--WHERE substr(ename, 1, 1)='M';
where ename like 'M%';				--LIKE condition

-- ========================================================================
-- subquery( Nested Select )

-- SINGLE ROW SUBQUERY
-- JONES ���� �� ���� ������ �޴� ����� �̸��� ������ �������
SELECT ename, sal
FROM emp
WHERE sal > (SELECT sal FROM emp WHERE ename = 'JONES')

-- MULTI ROW SUBQUERY
-- ���������� ���� ����� �����ȣ�� �̸��� �������
SELECT empno, ename FROM emp
--WHERE empno != (SELECT nvl(mgr, 0) FROM emp);		-- (select)�� �����׸��̰� empno�� ���׸��̱� ������ ���� ������
WHERE empno NOT IN (SELECT nvl(mgr, 0) FROM emp);

--MULTI COLUMN SUBQUERY �ѹ��� ���� ��(������ ������쿡�� �ѹ��� ���� ����)
-- ������ ��SALESMAN���� ����� ���� �μ����� �ٹ��ϰ�
-- ������ ��SALESMAN���� ����� ���� ������ �޴� ������� �̸�, ����, �μ���ȣ�� �������
SELECT ename, sal, deptno FROM emp
WHERE (deptno, sal) IN (SELECT deptno, sal FROM emp WHERE job = 'SALESMAN');

--INLINE VIEW 		����� �������̺�� ���
-- �ڱ� �μ��� ��� ���޺��� �� ���� ������ �޴� ������� �̸�, ����, �μ���ȣ, �μ��� ��� ������ �������
SELECT e.ename, e.sal, mydept.deptno, mydept.myavg 
FROM emp e, (SELECT deptno, avg(sal) AS myavg FROM emp GROUP BY deptno) mydept 
WHERE e.deptno = mydept.deptno AND e.sal > mydept.myavg;

--======================================subquery=========================================================
SELECT * FROM emp;
SELECT * FROM dept;
--������ subquery�� ����ϴ� �����ΰ� ���� ������ ���� ������ �Ѵ�.
--��CHICAGO������ �ٹ��ϴ� ������ ���� �μ����� �ٹ��ϴ� ����� �̸��� ������ �������.
SELECT e.ename, e.sal
FROM emp e, (SELECT deptno, loc FROM dept WHERE loc='CHICAGO') loc
WHERE e.deptno = loc.deptno;

SELECT ename, sal FROM emp
WHERE deptno = (SELECT deptno FROM dept WHERE loc = 'CHICAGO');

--�������� �̸��� ��KING���� ����� �̸��� ������ �������.
-- join
SELECT e.ename, e.sal
FROM emp e, (SELECT ename, empno FROM emp WHERE ename='KING') mgr
WHERE e.mgr = mgr.empno;

-- subquery
SELECT ename, sal FROM emp
WHERE mgr = (SELECT empno FROM emp WHERE ename = 'KING');

--��ü ��� ��, 20�� �μ��� ��� �� ���� ���� ������ �޴� ������� �� ���� ������ �޴� ������� �̸��� ������ �������.
SELECT e.ename, e.sal FROM emp e,
	(SELECT sal 
	FROM (SELECT ename, sal, deptno, rank() OVER(ORDER BY sal DESC) AS RAN
		FROM emp WHERE deptno='20')
		WHERE ran = 1) ran
WHERE  ran.sal < e.sal;

SELECT ename, sal
FROM emp
WHERE sal > 

--��ü ��� ��, ������ ��SALESMAN���� ��� �� ���� ���� ������ �޴� ������� �� ���� ������ �޴� ������� �̸��� ������ ����ϵ�,
--MAX()�Լ��� ������� ����. (ANY(=�����׸� ���� or), ALL(=�����׸� ���� and) ������)
SELECT e.ename, e.sal FROM emp e,
	(SELECT sal 
	FROM (SELECT ename, sal, rank() OVER(ORDER BY sal DESC) AS RAN
		FROM emp WHERE job='SALESMAN')
		WHERE ran = 1) ran
WHERE  ran.sal < e.sal;

--��BLAKE���� �ٹ��ϴ� �μ��� ��ġ(LOC)�� �������.
SELECT d.loc FROM dept d,
	(SELECT ename, deptno FROM emp WHERE ename='BLAKE') en
WHERE en.deptno = d.deptno;

--�̸��� ��S���� ���� ����� ������ �μ����� �ٹ��ϴ� ��� ��, �ڽ��� ������ ��ü ����� ��� ���޺��� ���� �������
--�����ȣ, �̸�, ������ �������.x
SELECT e.empno, e.ename, e.sal 
FROM (SELECT empno, ename, sal FROM emp WHERE ename LIKE '%S%') subS,
 	(SELECT avg(sal) AS avg FROM emp) avgsal, emp e
WHERE subS.sal > avgsal.avg;

--�����ȣ�� 7369�� ����� ���� �����̰�, ������ 7876�� ������� ���� �޴� ����� �̸��� ������ �������.x
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
SELECT ���.ename, ���.empno, ������.ename, ������.empno
FROM emp ���, emp ������
WHERE ���.mgr = ������.empno(+);

SELECT ���.ename, ���.empno, ������.ename, ������.empno
FROM emp ��� LEFT OUTER JOIN emp ������ ON (���.mgr = ������.empno);

--=========================================join======================================================
SELECT * FROM emp;
SELECT * FROM dept;
SELECT * FROM salgrade;

--������� �̸�, �μ���ȣ, �μ��̸��� �������.
SELECT e.ename, e.deptno, de.dname
FROM emp e, dept de
WHERE e.deptno = de.deptno;

--��DALLAS������ �ٹ��ϴ� ����� �̸�, ����, �μ���ȣ, �μ��̸��� �������.
SELECT e.ename, e.job, e.deptno, de.dname
FROM emp e, dept de
WHERE e.deptno = de.deptno AND de.loc = 'DALLAS'

SELECT e.ename, e.job, e.deptno, d.dname FROM emp e JOIN dept d on(e.deptno = d.deptno) WHERE d.loc='DALLAS'

SELECT ename, job, deptno, dname FROM emp JOIN dept using(deptno) WHERE loc = 'DALLAS'

--�̸��� ��A���� ���� ������� �̸��� �μ��̸��� �������.
SELECT e.ename, de.dname
FROM emp e, dept de 
WHERE e.ename LIKE '%A%' AND e.deptno = de.deptno;

SELECT e.ename, de.dname FROM emp e JOIN dept de ON (e.deptno = de.deptno) WHERE e.ename LIKE '%A%';

SELECT ename, dname FROM emp JOIN dept using(deptno) WHERE ename LIKE '%A%';

--����� �̸��� �μ��̸�, ������ ����ϵ�, ������ 3000 �̻��� ����鸸 �������.
SELECT e.ename, de.dname, e.sal
FROM emp e, dept de
WHERE e.deptno = de.deptno AND e.sal >= 3000;

SELECT e.ename, de.dname, e.sal FROM emp e JOIN dept de on(e.deptno = de.deptno) where e.sal >= 3000;

SELECT ename, dname, sal FROM emp JOIN dept USING(deptno) where sal >= 3000;

--������̺�� �޿����̺�(SALGRADE)���� Ŀ�̼��� å���� ������� �����ȣ, �̸�, ����, ����+Ŀ�̼�, �޿����(GRADE)�� �������.
SELECT e.empno, e.sal*12, e.sal*12+nvl(e.comm, 0), sg.grade
FROM emp e, salgrade sg
WHERE (e.sal BETWEEN sg.losal AND sg.HISAL)
	AND comm IS NOT null;

SELECT e.empno, e.ename, e.sal*12, e.sal*12+nvl(e.comm, 0), sg.grade
FROM emp e JOIN salgrade sg ON e.sal BETWEEN sg.losal AND sg.hisal
AND comm IS NOT null;

--�μ���ȣ�� 10���� ������� �μ���ȣ, �μ��̸�, ����̸�, ����, �޿������ �������.
SELECT e.deptno, de.dname, e.ename, e.sal, sg.grade
FROM emp e, salgrade sg, dept de
WHERE (e.sal BETWEEN sg.losal AND sg.hisal) 
	AND e.deptno = de.deptno 
	AND e.deptno = 10;

SELECT deptno, dname, ename, sal, grade
FROM dept JOIN emp using(deptno) JOIN salgrade ON (sal BETWEEN losal AND hisal)
WHERE deptno = 10;

--�μ���ȣ�� 10���̰ų� 20���� ������� �μ���ȣ, �μ��̸�, ����̸�, �޿������ ����ϵ�,
--�μ���ȣ�� ���� ������, ������ ���� ������ �������.
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

--�����ȣ�� �̸�, �������� �����ȣ�� �������̸��� �������.
SELECT e.empno, e.ename, mgr.empno, mgr.ename
FROM emp e, emp mgr
WHERE e.mgr = mgr.empno(+);

SELECT e.empno, e.ename, mgr.empno, mgr.ename
FROM emp e JOIN emp mgr ON (e.mgr = mgr.empno(+));

--�μ��̸�, ��ġ, �� �μ��� �����, ��� ������ �������.
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

--1. ��� ���̺�(emp)���� 1�б⿡ �Ի�(hiredate)�� ����� �����ȣ, �̸�, ����, �Ի����� ����ض�
SELECT empno, ename, job, hiredate
FROM emp
WHERE to_char(hiredate, 'q') = 1;

--2. ��� ���̺��� JONES�� �ټ����� ���ض�(1���� 30�Ϸ� �Ѵ�.)
SELECT trunc(months_between(sysdate, hiredate)) FROM emp WHERE ename = 'JONES';

--3. ��� ���̺��� SALES�� �ٹ��ϴ� ������� �����ȣ, �̸�, ����, ������ ����ض�
SELECT empno, ename, job, sal
FROM emp
WHERE deptno = 
	(SELECT deptno FROM dept WHERE dname = 'SALES');

--4. ��� ���̺��� NEW YORK�� �ٹ��ϸ鼭 ������ 1000�̻��� ����� �����ȣ, �̸�, ������ ����ض�
SELECT empno, ename, job
FROM emp
WHERE sal > 1000 AND
	deptno = (SELECT deptno FROM dept WHERE loc = 'NEW YORK');

--5. ����(comm����) �� 30000�̻��� ����� �����ȣ, �̸�, ����, ������ ����ض�
SELECT empno, ename, job, ye
FROM emp  JOIN (SELECT empno, sal*12+nvl(comm, 0)AS ye FROM emp) using(empno)
WHERE ye >= 30000;

--6. ����(comm����)�� 30000�̻��� ����� �����ȣ, �̸�, ����, �μ����� ����ض�
SELECT empno, ename, job, dname
FROM emp JOIN (SELECT empno, sal*12+nvl(comm,0) AS ye FROM emp) using(empno)
	JOIN dept USING (deptno)
WHERE ye >= 30000;

--7. ����� ���� ����� �����ȣ, �̸�, ����, ��� �����ȣ, �μ����� ����ض�
SELECT e.empno, e.ename, e.job, e.mgr, d.dname
FROM emp e left OUTER JOIN emp mgr ON (e.mgr = mgr.empno)
	JOIN dept d ON (e.deptno = d.deptno)
WHERE e.mgr IS NULL

--8. ������ 2000�̻��̰� NEW YORK���� ���ϴ� ����� �����ȣ, �̸�, ����, �μ����� ����ض�
SELECT empno, ename, job, dname
FROM emp JOIN dept USING (deptno)
WHERE sal > 2000 AND loc = 'NEW YORK';

--9. ���� ����� 3��� �̻��� ����� �̸� ����, �μ���, ���ϴ� ������ ����ض�
SELECT ename, job, dname, loc
FROM emp JOIN salgrade ON (sal BETWEEN losal AND hisal)
	JOIN dept USING (deptno)
WHERE grade >= 3;

--10. �� �μ��� ����� ���� ���� �μ� ������� �̸�, ����, ����, ���� ����� ����϶�
SELECT e.ename, e.job, e.sal, grade
FROM emp e JOIN salgrade ON (sal BETWEEN losal AND hisal)
	JOIN dept d on (e.deptno = d.deptno), 
	(SELECT deptno, avg
	FROM (SELECT avg(sal) AS avg, deptno
		FROM emp GROUP BY deptno 
		ORDER BY avg desc)
	WHERE rownum = 1) st
WHERE e.deptno = st.deptno;
	




