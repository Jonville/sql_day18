
                            ---- WHILE 반복문 ----
                            
-- WHILE 문은 조건이 TRUE 일 동안 반복한다.

DECLARE 
    CNT NUMBER := 0;
    ODD_SUM NUMBER := 0;
    EVEN_SUM NUMBER := 0;
BEGIN
    WHILE CNT <= 100 LOOP        -- CNT가 100이되기까지 반복
        IF MOD(CNT , 2) = 0 THEN        -- MOD() 는 나머지값 구하는것 // 5 % 2 == 1 이거랑 같음
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

                            ---- 문제풀이1 ----
                            
-- 반복을 하면서 EMP테이블에 데이터를 삽입 
            --(EMPNO, ENAME - 'HONG' + CNT, DEPTNO - 40)
-- 시퀀스 (PL_SQL) - 1000부터 시작하는 시퀀스 만들기
-- EMPNO 값은 시퀀스로 채우기
-- CNT 는 1부터 시작해서 10번 반복

CREATE SEQUENCE PL_SEQ   -- PL_SEQ 라고 시퀀스 지정
INCREMENT BY 1   -- 한번 실행 할때마다 N씩증가
START WITH 1000    -- N부터 시작한다는 의미 / 시작값
MINVALUE 1000      --최소값
MAXVALUE 9999   -- 최대값
--CYCLE           -- 1 부터 1000 까지 한바퀴 돌고 또 돌건지
NOCYCLE         --  말건지
;

DECLARE 
    CNT NUMBER := 1;
BEGIN
    LOOP 
        INSERT INTO EMP (EMPNO, ENAME, DEPTNO)
            VALUES (PL_SEQ.NEXTVAL, 'HONG' || CNT, 40);
        CNT := CNT + 1;
    EXIT WHEN CNT > 10;   -- 빠져나가라는 명시적 선언이 필요 / 빠져나가는 시점이라 CNT > 1010        
    END LOOP;
END;
/

SELECT * FROM EMP;

DELETE FROM EMP WHERE DEPTNO = '40';