DROP PROCEDURE IF EXISTS Test_AddReview;
DELIMITER @@
CREATE PROCEDURE Test_AddReview
(IN patient_alias VARCHAR(20), IN doctor_alias VARCHAR(20), IN star_rating FLOAT,
IN comments VARCHAR(256))
BEGIN
/* add review by patient_alias for doctor_alias with the given star_rating and comments
fields, assign the current date to the review automatically, assume that star_rating is an
integer multiple of 0.5 (e.g., 1.5, 2.0, 2.5, etc.) */

    INSERT INTO Review (p_alias, d_alias, rating, date, comments)
    VALUES (patient_alias, doctor_alias, star_rating, CURDATE(), comments);

END @@
DELIMITER;


---Test Procedure---
--CALL Test_AddReview('pat_anne', 'doc_amnio', 2.5, "comments");
--select * from Review;