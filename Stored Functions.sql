SELECT 'SHIVANI JAIN' AS 'NAME SPACE' ;

Use stormtrooper_java;

DROP FUNCTION IF EXISTS sumString;
DELIMITER //
CREATE FUNCTION sumString(R VARCHAR (100))
RETURNS INT


BEGIN
    DECLARE N INT;   
    DECLARE I INT;
    DECLARE A INT;
    DECLARE SUM INT;

    SET N = LENGTH(R);
    SET I = 0;
    SET A = 0;
    SET SUM = 0;     

    WHILE I <= N DO
        SET A = MOD(R,10);
        SET SUM = SUM + A;
        SET R = R / 10;
        SET I = I + 1;
    END WHILE;
RETURN SUM;

END //
DELIMITER ;

SELECT  sumString('123456789') AS 'SUM STRING' ;


DROP FUNCTION IF EXISTS SumCharachters;
DELIMITER //
CREATE FUNCTION SumCharachters(R VARCHAR(100))
RETURNS INT

BEGIN 
	DECLARE  N INT;   
    DECLARE I INT;
    DECLARE A CHAR(50);
    DECLARE SUM INT;

    SET N = LENGTH(R);
    SET I = 0;
    SET SUM = 0;     

    WHILE I <= N DO
        SET A = SUBSTR(R,I,1);
        IF A  = 'X' THEN
        		SET SUM = 1 + SUM;
        ELSEIF A = 'Y' THEN
        		SET SUM = 2 + SUM;
        ELSE
        		SET SUM = SUM;
        END IF;
		SET I = I + 1;
    END WHILE;
RETURN SUM;
END //
DELIMITER ;

SELECT SumCharachters('XYCCVXYXYXCBB') AS 'SUM CHARACTERS';


DROP FUNCTION IF EXISTS verifyCode;
DELIMITER //
CREATE FUNCTION verifyCode(R VARCHAR(100))
RETURNS INT

BEGIN 
	DECLARE N INT;   
    DECLARE I INT;
    DECLARE A CHAR(50);
    DECLARE SUM1 INT;
    DECLARE SUM2 INT;
    DECLARE SUM INT;

    SET N = LENGTH(R);
    SET I = 0;
    SET SUM = 0;
    SET SUM1 = 0;
    SET SUM2 = 0;


    WHILE I <= N DO
        SET A = SUBSTR(R,I,1);
        IF A  = 'A' THEN
        		SET SUM1 = 1 + SUM1;
        ELSEIF A = 'D' THEN
        		SET SUM2 = 2 + SUM2;
        ELSE
        		SET SUM1 = SUM1;
        		SET SUM2 = SUM2;
        END IF;

        SET I = I + 1;

    END WHILE;

    IF SUM1 < 3 AND SUM2 > 2 THEN
        	SET SUM = 1;
     ELSE 
        	SET SUM = 0;
     END IF;

RETURN SUM;
END //
DELIMITER ;

SELECT 	verifyCode('AFTDYADXXDPQDEF') AS 'VERIFY CODE';

DROP FUNCTION IF EXISTS testForSequence;
DELIMITER //

CREATE FUNCTION testForSequence(R VARCHAR(100), S VARCHAR(100))
RETURNS INT

BEGIN

	DECLARE A VARCHAR(10);
	DECLARE B VARCHAR(10);
	DECLARE SUM INT;

	
	SET A = SUBSTR(R,1,5);
	SET B = SUBSTR(REVERSE(S),1,3);

	IF A='AXYZB' AND B ='LLL' THEN
		SET SUM = 1;
	ELSE
		SET SUM = 0;
	END IF;

	RETURN SUM;


END //
 DELIMITER ;

 SELECT testForSequence('AXYZBUIOKS','LBLYYYPLLL') AS 'TEST FOR SEQUENCE';
















