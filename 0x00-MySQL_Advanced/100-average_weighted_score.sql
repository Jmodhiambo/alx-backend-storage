-- Create procedure to compute average weighted score for a given user
DELIMITER $$

CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN user_id INT)
BEGIN
    DECLARE total_weight INT DEFAULT 0;
    DECLARE weighted_score FLOAT DEFAULT 0;

    -- Calculate total weighted score and sum of weights
    SELECT
        SUM(c.score * p.weight),
        SUM(p.weight)
    INTO
        weighted_score,
        total_weight
    FROM
        corrections c
        JOIN projects p ON c.project_id = p.id
    WHERE
        c.user_id = user_id;

    -- Avoid division by zero
    IF total_weight > 0 THEN
        UPDATE users
        SET average_score = weighted_score / total_weight
        WHERE id = user_id;
    ELSE
        UPDATE users
        SET average_score = 0
        WHERE id = user_id;
    END IF;
END$$

DELIMITER ;
