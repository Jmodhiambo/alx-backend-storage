-- Create procedure to compute average weighted score for all users
DELIMITER $$

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
        -- Declare variables FIRST
        DECLARE done INT DEFAULT FALSE;
        DECLARE userId INT;
        DECLARE total_weight INT;
        DECLARE weighted_score FLOAT;

        -- Cursor declaration
        DECLARE user_cursor CURSOR FOR SELECT id FROM users;
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

        -- Open cursor
        OPEN user_cursor;

        read_loop: LOOP
                FETCH user_cursor INTO userId;
                IF done THEN
                        LEAVE read_loop;
                END IF;

                -- Calculate total weight and weighted score
                SELECT SUM(p.weight * c.score), SUM(p.weight)
                INTO weighted_score, total_weight
                FROM corrections c
                JOIN projects p ON c.project_id = p.id
                WHERE c.user_id = userId;

                -- Avoid division by zero
                IF total_weight > 0 THEN
                        UPDATE users
                        SET average_score = weighted_score / total_weight
                        WHERE id = userId;
                END IF;
        END LOOP;

        CLOSE user_cursor;
END$$

DELIMITER ;
