DROP PROCEDURE IF EXISTS Test_DoctorSearchStarRating;
DELIMITER @@
CREATE PROCEDURE Test_DoctorSearchStarRating
(IN avg_star_rating FLOAT, OUT num_matches INT)
BEGIN
/* returns in num_matches the total number of doctors whose average star rating is equal to
or greater than the given threshold */

    SELECT COUNT(*) INTO num_matches
    FROM ( SELECT AVG(rating) as avg_rating from Doctor natural join Review
           GROUP BY Doctor.d_alias) as newTable
    WHERE avg_rating >= avg_star_rating;

END @@
DELIMITER;

---Test Procedure---
--CALL Test_DoctorSearchStarRating(1, @num_matches);

