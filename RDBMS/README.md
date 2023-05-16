# Relational DataBase

> 여러 사람이 공유하여 사용할 목적으로 체계화해 통합, 관리하는 데이터의 집합

- RDBMS
  - (Relational DataBase Management System)
  - 관계형 데이터 베이스
  - **데이터(Entitiy)들의 관계**를 정의하여 접근하기 쉽게 만든 DB
- NoSQL
  - (Not only SQL)
    - (**S**tructured **Q**uery **L**anguage)
  - 비 정형 데이터
  - 형태가 정해저 있지 않은 형태의 데이터를 저장
  - 데이터 간의 관계를 정의하지 않음
  - **대용량 데이터를 저장하는 용이**



## 개념

- Entity
  - DB에 저장하려는 현실상의 개념 /객체
  - table
- Attribute
  - entity의 속성
  - column
- Tuple
  - entitiy의 값
  - row



## KEY

> 키(key): 식별자(Identifier)
>
> > 튜플을 식별(검색, 정렬 등) 할 때 사용

슈퍼키

- Super key / Composite key
- 복합키
- 유일성을 만족하는 속성

후보키

- Candidate key
- 유일성과 최소성을 만족하는 속성

**기본키**

- Primary key
- 후보키 중 선택된 키

외래키

- (Foreign key)
- 다른 테이블의 칼럼이나 기본키를 참조

대체키

- Alternate key
- 후보키 중 선택되지 않은 나머지 키



## SQL

> Structured Query Language
>
> > 구조화 된 질의 언어

- DDL
- DML
- DCL



### DDL

> Data Definition Language
>
> 데이터 정의 언어

- CREATE

  - 테이블, 뷰(view), 프로시저(procedure) 등을 생성

  - ```SQL
    -- 테이블 생성
    CREATE TABLE 테이블 (    
        컬럼 DATA_TYPE(SIZE),    ...,    
        CONSTRAINT 제약조건 제약조건 (컬럼)
    );
    
    -- 뷰 생성
    CREATE VIEW 뷰명 AS SLQ문(SELECT문);
    
    -- 복제
    cREATE tABLE 새로운 테이블 AS SELECT 컬럼명(원하는컬럼 OR 전체'*') FROM 테이블
    ```

- ALTER

  - 테이블, 뷰, 프로시저 등을 수정

  - ADD 

    - 컬럼 추가

  - DROP

    - 컬럼 삭제

  - MODIFY

    - 컬럼 수정

  - ```sql
    -- 컬럼 수정
    ALTER TABLE 테이블 (ADD | DROP | MODIFY) 컬럼 DATA_TYPE
    ```

- DROP

  - 테이블, 뷰, 프로시저 등을 삭제

  - ```sql
    -- 테이블 삭제
    DROP TABLE 테이블
    ```



### DML

>Data Manipulation Language
>
>데이터 조작 언어

- SELECT

  - 데이터 읽기

  - ```SQL
    -- 테이블 에서 컬럼 조회
    -- 조건을 넣어 조회할 경우 WHERE 사용
    SELECT 컬럼 FROM 테이블 (WHERE 조건);
    
    -- 테이블에서 정렬컬럼의 값으로 정렬 후 컬럼 조회(ASC: 오름차순 / DESC: 내림차순)
    SELECT 컬럼 FROM 테이블 ORDER BY 정렬컬럼 (ASC|DESC);
    
    -- 테이블에서 정렬컬럼의 값으로 그룹화 시킨 후 컬럼 조회
    -- 조건을 사용하여 그룹화 할 경우 WHERE|HAVING 사용
    -- 그룹화 후 집계함수에 조건을 줄 경우 HAVING 사용
    SELECT 컬럼 FROM 테이블 (WHERE|HAVING 조건) GROUP BY 정렬컬럼;
    ```

- INSERT

  - 데이터 삽입

  - ```SQL
    -- 테이블의 컬럼에 값 삽입
    INSERT INTO 테이블(컬럼, ...) VALUES(모든|명시된 컬럼의 값);
    ```

- UPDATE

  - 데이터 수정

  - ```sql
    -- 컬럼의 값 수정
    -- 특정 조건의 컬럼의 값을 수정할 경우 WHERE사용
    UPDATE 테이블 SET 컬럼=값, 컬럼=값, ... (WHERE 조건);
    ```

- DELETE

  - 데이터 삭제

  - ```sql
    -- 테이블의 값 삭제
    -- 조건에 맞는 값을 삭제할 경우 WHERE사용
    DELETE FROM 테이블 (WHERE 조건);
    ```



### DCL

> Data Control Language
>
> 데이터 제어 언어

- COMMIT
  - 데이터, 트랜잭션 저장
  - TCL
- ROLLBACK
  - 데이터, 트랜잭션 취소
    - 가장 마지막 COMMIT으로 되돌아감
  - TCL
- GRANT
  - DB 권한 부여
- REVOKE
  - DB 권한 삭제



- TCL
  - Transaction Controll Language
- 각 사용자에게 권한과 역할을 부여하여 보안 유지
  - 시스템 권한
    - 객체 생성, 변경, 소멸 등에 관한 권한
    - .SYS(SYSTEM)이 부여함
    - 기능이 매우 강력하여 일반적으로 관리자만
  - 객체 권한
    - 사용자가 특정 객체에 대한 작업을 수행할 수 있도록 권한 부여
    - 객체 소유자가 부여
  - 역할
    - 권한의 집합
    - 많은 권한을 한 번에 부여하기 위함
- 기본적으로 생성되어 있는 Role
  - CONNECT
    - 접속 권한 등
  - RESOURCE
    - 객체와 관련된 기본 시스템 권한
    - 생성, 수정, 삭제 등
  - DBA
    - DB 관리 권한 등
  - SYSDBA
    - DBA + DB 시작, 종료 권한 등
  - SYSOPER
    - SYSDBA + DB 생성 권한 등
