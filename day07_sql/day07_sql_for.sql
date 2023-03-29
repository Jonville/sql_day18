
                            ---- FOR �ݺ��� ----
                         --����Ŭ �迭 = TABLE ��--
                    
-- SET SERVEROUTPUT ON; ��ģ�� ���������� ����Ҽ����� .
-- �μ���ȣ�� �޾Ƽ� �ش� �μ��� ��� ���, �̸�, �޿����� ���
CREATE OR REPLACE PROCEDURE LOOP_TEST1
    (P_DEPTNO IN EMP.DEPTNO%TYPE)
IS
    TYPE EMPNO_TABLE IS TABLE OF EMP.EMPNO%TYPE     -- EMPNO%TYPE = STRING[] INT ������
    INDEX BY BINARY_INTEGER;                        -- �迭�� ���� Ŭ������� �����ض�
    
    TYPE ENAME_TABLE IS TABLE OF EMP.ENAME%TYPE     
    INDEX BY BINARY_INTEGER;
    
    TYPE SAL_TABLE IS TABLE OF EMP.SAL%TYPE     
    INDEX BY BINARY_INTEGER;         -- ������� Ŭ������ ���� �̶�� �����.
                               
    EMPNO_ARR EMPNO_TABLE;      -- EMPNO_ARR ������ �迭�� �־��ش�.  -- �ν��Ͻ� �����̶� ����
    ENAME_ARR ENAME_TABLE;      -- ENAME_ARR ������ �迭�� �־��ش�.
    SAL_ARR SAL_TABLE;        -- SAL_ARR ������ �迭�� �־��ش�.
    
    i BINARY_INTEGER := 0;       -- i �� �ݺ����� �� ����
                            -- NUMBER �� �� �Ⱦ��� BINARY_INTEGER�� ����
                            -- BINARY_INTEGER ��������� �۰� ������ , ����ӵ��� ����

BEGIN
    -- FOR ~ LOOP ~ END LOOP
    FOR EMP_LIST IN (           --EMP_LIST �� �ӽ� ���̺�
                    SELECT EMPNO , ENAME, SAL      
                    FROM EMP
                    WHERE DEPTNO = P_DEPTNO
                    ) LOOP      -- �ѹ��� �������� EMP_LIST �� �ϳ��� ����
    i := i + 1;     -- !!! SQL ������ index �� 1���� �����Ѵ�;;;
                    -- i �� 0���� �����߱⶧����  i := i + 1 �� ���� �������ذ�
    
    EMPNO_ARR(i) := EMP_LIST.EMPNO;     --EMPNO_ARR {7369, 7499, 7521} �̷������� ���
    ENAME_ARR(i) := EMP_LIST.ENAME;
    SAL_ARR(i) := EMP_LIST.SAL;
    
    END LOOP;
    
    FOR CNT IN 1..i LOOP     -- 1���� i�� �����������ٴ��ǹ�         -- ����� ���� FOR ��
        DBMS_OUTPUT.PUT_LINE('�����ȣ : ' || EMPNO_ARR(CNT));
        DBMS_OUTPUT.PUT_LINE('����̸� : ' || ENAME_ARR(CNT));
        DBMS_OUTPUT.PUT_LINE('����޿� : ' || SAL_ARR(CNT));
        DBMS_OUTPUT.PUT_LINE('---------------------------');

    END LOOP;
END;
/

EXECUTE LOOP_TEST1(10);

--------------------------------------------------------------------------------
    
                            ---- ����Ǯ��1 ----

-- STUDENT ���̺�
-- ���ν��� �̸� : LOOP_TEST2
-- EXECUTE LOOP_TEST2('M'); OR EXECUTE LOOP_TEST2('F);
-- ��°�� : �й� , �̸�, �а�
-- �а��� �������ڰ� �� ���ڰ� �� �ٲ㼭 ���

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
        DBMS_OUTPUT.PUT_LINE('�й� : ' || STUNO_ARR(CNT));
        DBMS_OUTPUT.PUT_LINE('�̸� : ' || NAME_ARR(CNT));
    IF DEPT_ARR(CNT) = '��������' THEN
        DBMS_OUTPUT.PUT_LINE('�а� : ���� ');
    ELSE
        DBMS_OUTPUT.PUT_LINE('�а� : ' || DEPT_ARR(CNT));
    END IF;
        DBMS_OUTPUT.PUT_LINE('==========================');
        
    END LOOP;

END ;
/

EXECUTE LOOP_TEST2 ('M');
EXECUTE LOOP_TEST2 ('F');