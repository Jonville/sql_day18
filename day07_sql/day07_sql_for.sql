
                            ---- FOR 반복문 ----
                         --오라클 배열 = TABLE 형--
                    
-- SET SERVEROUTPUT ON; 이친구 실행시켜줘야 출력할수있음 .
-- 부서번호를 받아서 해당 부서의 사람 사번, 이름, 급여정보 출력
CREATE OR REPLACE PROCEDURE LOOP_TEST1
    (P_DEPTNO IN EMP.DEPTNO%TYPE)
IS
    TYPE EMPNO_TABLE IS TABLE OF EMP.EMPNO%TYPE     -- EMPNO%TYPE = STRING[] INT 같은거
    INDEX BY BINARY_INTEGER;                        -- 배열을 담을 클래스라고 생각해라
    
    TYPE ENAME_TABLE IS TABLE OF EMP.ENAME%TYPE     
    INDEX BY BINARY_INTEGER;
    
    TYPE SAL_TABLE IS TABLE OF EMP.SAL%TYPE     
    INDEX BY BINARY_INTEGER;         -- 여기까진 클래스로 선언 이라고 보면됨.
                               
    EMPNO_ARR EMPNO_TABLE;      -- EMPNO_ARR 변수로 배열을 넣어준다.  -- 인스턴스 생성이라 생각
    ENAME_ARR ENAME_TABLE;      -- ENAME_ARR 변수로 배열을 넣어준다.
    SAL_ARR SAL_TABLE;        -- SAL_ARR 변수로 배열을 넣어준다.
    
    i BINARY_INTEGER := 0;       -- i 는 반복문에 쓸 변수
                            -- NUMBER 를 잘 안쓰고 BINARY_INTEGER로 쓴다
                            -- BINARY_INTEGER 저장공간이 작고 빠르다 , 연산속도가 빠름

BEGIN
    -- FOR ~ LOOP ~ END LOOP
    FOR EMP_LIST IN (           --EMP_LIST 는 임시 테이블
                    SELECT EMPNO , ENAME, SAL      
                    FROM EMP
                    WHERE DEPTNO = P_DEPTNO
                    ) LOOP      -- 한바퀴 돌때마다 EMP_LIST 에 하나씩 들어간다
    i := i + 1;     -- !!! SQL 에서는 index 가 1부터 시작한다;;;
                    -- i 가 0부터 시작했기때문에  i := i + 1 을 먼저 선언해준것
    
    EMPNO_ARR(i) := EMP_LIST.EMPNO;     --EMPNO_ARR {7369, 7499, 7521} 이런식으로 담김
    ENAME_ARR(i) := EMP_LIST.ENAME;
    SAL_ARR(i) := EMP_LIST.SAL;
    
    END LOOP;
    
    FOR CNT IN 1..i LOOP     -- 1부터 i에 갈때까지돈다는의미         -- 출력을 위한 FOR 문
        DBMS_OUTPUT.PUT_LINE('사원번호 : ' || EMPNO_ARR(CNT));
        DBMS_OUTPUT.PUT_LINE('사원이름 : ' || ENAME_ARR(CNT));
        DBMS_OUTPUT.PUT_LINE('사원급여 : ' || SAL_ARR(CNT));
        DBMS_OUTPUT.PUT_LINE('---------------------------');

    END LOOP;
END;
/

EXECUTE LOOP_TEST1(10);

--------------------------------------------------------------------------------
    
                            ---- 문제풀이1 ----

-- STUDENT 테이블
-- 프로시저 이름 : LOOP_TEST2
-- EXECUTE LOOP_TEST2('M'); OR EXECUTE LOOP_TEST2('F);
-- 출력결과 : 학번 , 이름, 학과
-- 학과가 전기전자과 면 전자과 로 바꿔서 출력

CREATE OR REPLACE PROCEDURE LOOP_TEST2
    (P_GEN IN STUDENT.STU_GENDER%TYPE)
IS
    TYPE STUNO_TABLE IS TABLE OF STUDENT.STU_NO%TYPE
    INDEX BY BINARY_INTEGER;
    
    TYPE NAME_TABLE IS TABLE OF STUDENT.STU_NAME%TYPE
    INDEX BY BINARY_INTEGER;
    
    TYPE DEPT_TABLE IS TABLE OF STUDENT.STU_DEPT%TYPE
    INDEX BY BINARY_INTEGER;
    
    STUNO_ARR STUNO_TABLE;
    NAME_ARR NAME_TABLE;
    DEPT_ARR DEPT_TABLE;
    
    i BINARY_INTEGER := 0;
    
BEGIN
    FOR STU_LIST IN (
                        SELECT STU_NO , STU_NAME , STU_DEPT
                        FROM STUDENT
                        WHERE STU_GENDER = P_GEN
                     ) LOOP
    i := i + 1;
    
    STUNO_ARR(i) := STU_LIST.STU_NO;
    NAME_ARR(i) := STU_LIST.STU_NAME;
    DEPT_ARR(i) := STU_LIST.STU_DEPT;
    
    END LOOP;
    
    FOR CNT IN 1..i LOOP
        DBMS_OUTPUT.PUT_LINE('학번 : ' || STUNO_ARR(CNT));
        DBMS_OUTPUT.PUT_LINE('이름 : ' || NAME_ARR(CNT));
    IF DEPT_ARR(CNT) = '전기전자' THEN
        DBMS_OUTPUT.PUT_LINE('학과 : 전자 ');
    ELSE
        DBMS_OUTPUT.PUT_LINE('학과 : ' || DEPT_ARR(CNT));
    END IF;
        DBMS_OUTPUT.PUT_LINE('==========================');
        
    END LOOP;

END ;
/

EXECUTE LOOP_TEST2 ('M');
EXECUTE LOOP_TEST2 ('F');