
                            ---- WHILE �ݺ��� ----
                            
-- WHILE ���� ������ TRUE �� ���� �ݺ��Ѵ�.

DECLARE 
    CNT NUMBER := 0;
    ODD_SUM NUMBER := 0;
    EVEN_SUM NUMBER := 0;
BEGIN
    WHILE CNT <= 100 LOOP        -- CNT�� 100�̵Ǳ���� �ݺ�
        IF MOD(CNT , 2) = 0 THEN        -- MOD() �� �������� ���ϴ°� // 5 % 2 == 1 �̰Ŷ� ����
            EVEN_SUM := EVEN_SUM + CNT;
        ELSE
            ODD_SUM := ODD_SUM + CNT;
        END IF;
        
        CNT := CNT + 1;
    
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE(ODD_SUM);
    DBMS_OUTPUT.PUT_LINE(EVEN_SUM);
END;
/

--------------------------------------------------------------------------------

                            ---- ����Ǯ��1 ----
                            
-- �ݺ��� �ϸ鼭 EMP���̺� �����͸� ���� 
            --(EMPNO, ENAME - 'HONG' + CNT, DEPTNO - 40)
-- ������ (PL_SQL) - 1000���� �����ϴ� ������ �����
-- EMPNO ���� �������� ä���
-- CNT �� 1���� �����ؼ� 10�� �ݺ�

CREATE SEQUENCE PL_SEQ   -- PL_SEQ ��� ������ ����
INCREMENT BY 1   -- �ѹ� ���� �Ҷ����� N������
START WITH 1000    -- N���� �����Ѵٴ� �ǹ� / ���۰�
MINVALUE 1000      --�ּҰ�
MAXVALUE 9999   -- �ִ밪
--CYCLE           -- 1 ���� 1000 ���� �ѹ��� ���� �� ������
NOCYCLE         --  ������
;

DECLARE 
    CNT NUMBER := 1;
BEGIN
    LOOP 
        INSERT INTO EMP (EMPNO, ENAME, DEPTNO)
            VALUES (PL_SEQ.NEXTVAL, 'HONG' || CNT, 40);
        CNT := CNT + 1;
    EXIT WHEN CNT > 10;   -- ����������� ����� ������ �ʿ� / ���������� �����̶� CNT > 1010        
    END LOOP;
END;
/

SELECT * FROM EMP;

DELETE FROM EMP WHERE DEPTNO = '40';