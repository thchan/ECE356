DROP PROCEDURE IF EXISTS Test_DoctorSearchFriendReview;
DELIMITER @@
CREATE PROCEDURE Test_DoctorSearchFriendReview
(IN patient_alias VARCHAR(20), IN review_keyword VARCHAR(20), OUT num_matches INT)
BEGIN
/* returns in num_matches the total number of doctors who have been reviewed by friends of
the given patient, and where at least one of the reviews for that doctor (not necessarily
written by a friend) contains the given keyword (case-sensitive) */


SELECT count(distinct Review.d_alias) INTO num_matches
FROM Review
WHERE Review.p_alias in (
                            SELECT Friend.p_alias_b AS friends
                            FROM Friend
                            WHERE (Friend.p_alias_a = patient_alias AND Friend.flag = true)
                            UNION
                            SELECT Friend.p_alias_a AS friends
                            FROM Friend
                            WHERE (Friend.p_alias_b = patient_alias AND Friend.flag = true)
                        )
                        AND Review.comments LIKE BINARY CONCAT('%', review_keyword, '%');

END @@
DELIMITER;

---Test Procedure---
/*
CALL Test_DoctorSearchFriendReview('pat_peggy', 'nice', @num_matches);
select @num_matches
select * from Friend;
select * from Review;
INSERT INTO Friend VALUES ('pat_bob', 'pat_kate', true);
INSERT INTO Friend VALUES ('pat_anne', 'pat_bob', true);
INSERT INTO Friend VALUES ('pat_homer', 'pat_bob', false);
*/