-- Function: SafeDiv(a INT, b INT) - divides a by b or returns 0 if b is 0
DELIMITER $$

CREATE FUNCTION SafeDiv(a INT, b INT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
        IF b = 0 THEN
                RETURN 0;
        ELSE
                RETURN a / b;
        END IF;
END$$

DELIMITER ;
