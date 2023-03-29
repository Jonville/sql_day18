
                            ---- LOOP 반복문 ----
                            
-- 반복하면서 데이터를 삽입 (EMP 테이블에 삽입)

DECLARE 
    CNT NUMBER := 1000;
BEGIN
    LOOP 
        INSERT INTO EMP (EMPNO, ENAME, DEPTNO)
            VALUES (CNT, 'HONG' || CNT, 40);
        CNT := CNT + 1;
    EXIT WHEN CNT > 1010;   -- 빠져나가라는 명시적 선언이 필요 / 빠져나가는 시점이라 CNT > 1010        
    END LOOP;
END;
/

SELECT * FROM EMP;

DELETE
FROM EMP
WHERE DEPTNO = 40;

--------------------------------------------------------------------------------

                            ---- 문제풀이1 ----
                            
-- 반복문을 통해 홀수와 짝수의 합을 구해라
DECLARE 
    CNT NUMBER := 0;
    ODD_SUM NUMBER := 0;
    EVEN_SUM NUMBER := 0;
BEGIN
    LOOP
        IF MOD(CNT , 2) = 0 THEN        -- MOD() 는 나머지값 구하는것 // 5 % 2 == 1 이거랑 같음
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

