-- Email trigger updates valid_email if email has been changed.
DELIMITER //

CREATE TRIGGER email_reset
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    IF NEW.email != OLD.email THEN
        SET NEW.valid_email = 0;
    END IF;
END//

DELIMITER ;
