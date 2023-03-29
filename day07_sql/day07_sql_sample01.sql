
                        ----����Ǯ��1----

/*  1. ���ν��� �̸� : UPDATE_TEST1
    2. ȣ�� ��� : EXECUTE UPDATE_TEST1(101, 5);
    3. ��� : ENROL ���̺��� SUB_NO�� 101�� �л����� GRADE�� 5����
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
    DBMS_OUTPUT.PUT_LINE('�л� : ' || V_ENROL.STU_NO );
    DBMS_OUTPUT.PUT_LINE('���� : ' || V_ENROL.ENR_GRADE );
END;
/
EXECUTE UPDATE_TEST1(101 , 5)

                        ----����Ǯ��2----

/*  1. ���ν��� �̸� : INSERT_TEST1
    2. ȣ�� ��� : EXECUTE INSERT_TEST1(20201234 , 'ȫ�浿', '���', 1, C, M);
    3. ��� : STUDENT ���̺� STU_NO, STU_NAME, STU_DEPT, STU_GRADE, 
		STU_CLASS, STU_GENDER ������ ���� 
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
            
    DBMS_OUTPUT.PUT_LINE('�й� : ' || V_STUNO);
    DBMS_OUTPUT.PUT_LINE('�̸� : ' || V_STU_NAME);
    DBMS_OUTPUT.PUT_LINE('�а� : ' || V_STU_DEPT);
    DBMS_OUTPUT.PUT_LINE('��� : ' || V_STU_GRADE);
    DBMS_OUTPUT.PUT_LINE('Ŭ���� : ' || V_STU_CLASS);
    DBMS_OUTPUT.PUT_LINE('���� : ' || V_STU_GENDER);
    
END ;
/
EXECUTE INSERT_TEST1(20201234 , 'ȫ�浿' , '���' , 1 , 'C' , 'M');

                        ----����Ǯ��3----
                        
CREATE OR REPLACE D