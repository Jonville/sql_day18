
                            ---- LOOP �ݺ��� ----
                            
-- �ݺ��ϸ鼭 �����͸� ���� (EMP ���̺� ����)

DECLARE 
    CNT NUMBER := 1000;
BEGIN
    LOOP 
        INSERT INTO EMP (EMPNO, ENAME, DEPTNO)
            VALUES (CNT, 'HONG' || CNT, 40);
        CNT := CNT + 1;
    EXIT WHEN CNT > 1010;   -- ����������� ����� ������ �ʿ� / ���������� �����̶� CNT > 1010        
    END LOOP;
END;
/

SELECT * FROM EMP;

DELETE
FROM EMP
WHERE DEPTNO = 40;

--------------------------------------------------------------------------------

                            ---- ����Ǯ��1 ----
                            
-- �ݺ����� ���� Ȧ���� ¦���� ���� ���ض�
DECLARE 
    CNT NUMBER := 0;
    ODD_SUM NUMBER := 0;
    EVEN_SUM NUMBER := 0;
BEGIN
    LOOP
        IF MOD(CNT , 2) = 0 THEN        -- MOD() �� �������� ���ϴ°� // 5 % 2 == 1 �̰Ŷ� ����
            EVEN_SUM := EVEN_SUM + CNT;
        ELSE
            ODD_SUM := ODD_SUM + CNT;
        END IF;
        
        CNT := CNT + 1;
    
    EXIT WHEN CNT > 100;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE(ODD_SUM);
    DBMS_OUTPUT.PUT_LINE(EVEN_SUM);
END;
/

