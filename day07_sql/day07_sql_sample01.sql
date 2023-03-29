
                        ----문제풀이1----

/*  1. 프로시저 이름 : UPDATE_TEST1
    2. 호출 방법 : EXECUTE UPDATE_TEST1(101, 5);
    3. 결과 : ENROL 테이블의 SUB_NO가 101인 학생들의 GRADE를 5증가
*/

CREATE OR REPLACE PROCEDURE UPDATE_TEST1
    (V_SUB IN ENROL.SUB_NO%TYPE , V_PLUS IN NUMBER)
IS
    V_ENROL ENROL%ROWTYPE;
BEGIN
    UPDATE ENROL
    SET ENR_GRADE = ENR_GRADE + V_PLUS
    WHERE SUB_NO = V_SUB
    ;
    DBMS_OUTPUT.PUT_LINE('학생 : ' || V_ENROL.STU_NO );
    DBMS_OUTPUT.PUT_LINE('점수 : ' || V_ENROL.ENR_GRADE );
END;
/
EXECUTE UPDATE_TEST1(101 , 5)

                        ----문제풀이2----

/*  1. 프로시저 이름 : INSERT_TEST1
    2. 호출 방법 : EXECUTE INSERT_TEST1(20201234 , '홍길동', '기계', 1, C, M);
    3. 결과 : STUDENT 테이블에 STU_NO, STU_NAME, STU_DEPT, STU_GRADE, 
		STU_CLASS, STU_GENDER 순으로 저장 
*/

CREATE OR REPLACE PROCEDURE INSERT_TEST1
    (V_STUNO IN STUDENT.STU_NO%TYPE ,
    V_STU_NAME IN STUDENT.STU_NAME%TYPE ,
    V_STU_DEPT IN STUDENT.STU_DEPT%TYPE ,
    V_STU_GRADE IN STUDENT.STU_GRADE%TYPE ,
    V_STU_CLASS IN STUDENT.STU_CLASS%TYPE ,
    V_STU_GENDER IN STUDENT.STU_GENDER%TYPE)
    
IS
BEGIN 
    INSERT INTO STUDENT (STU_NO , STU_NAME , STU_DEPT , STU_GRADE , STU_CLASS , STU_GENDER)
            VALUES (V_STUNO , V_STU_NAME , V_STU_DEPT , V_STU_GRADE , V_STU_CLASS , V_STU_GENDER);
            
    DBMS_OUTPUT.PUT_LINE('학번 : ' || V_STUNO);
    DBMS_OUTPUT.PUT_LINE('이름 : ' || V_STU_NAME);
    DBMS_OUTPUT.PUT_LINE('학과 : ' || V_STU_DEPT);
    DBMS_OUTPUT.PUT_LINE('등급 : ' || V_STU_GRADE);
    DBMS_OUTPUT.PUT_LINE('클래스 : ' || V_STU_CLASS);
    DBMS_OUTPUT.PUT_LINE('성별 : ' || V_STU_GENDER);
    
END ;
/
EXECUTE INSERT_TEST1(20201234 , '홍길동' , '기계' , 1 , 'C' , 'M');

                        ----문제풀이3----
                        
CREATE OR REPLACE D