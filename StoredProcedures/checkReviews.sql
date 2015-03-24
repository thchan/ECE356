DROP PROCEDURE IF EXISTS Test_CheckReviews;
DELIMITER @@
CREATE PROCEDURE Test_CheckReviews
(IN doctor_alias VARCHAR(20), OUT avg_star FLOAT, OUT num_reviews INT)
BEGIN
/* returns the average star rating and total number of reviews for the given doctor alias */

    SELECT count(*) INTO num_reviews
    FROM Review
    WHERE Review.d_alias = doctor_alias;

    SELECT AVG(rating) INTO avg_star
    FROM Review 
    WHERE Review.d_alias = doctor_alias;

END @@
DELIMITER;

---Test Procedure---
--CALL Test_CheckReviews('doc_aiken', @avg_star, @num_reviews);
--select @avg_star, @num_reviews;



