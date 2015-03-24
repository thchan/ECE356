DROP PROCEDURE IF EXISTS Test_AreFriends;
DELIMITER @@
CREATE PROCEDURE Test_AreFriends
(IN patient_alias_1 VARCHAR(20), IN patient_alias_2 VARCHAR(20), OUT are_friends INT)
BEGIN
/* returns 1 in are_friends if patient_alias_1 and patient_alias_2 are friends, 0 otherwise */

    SET are_friends = 0;

    IF EXISTS (SELECT *
               FROM Friend 
               WHERE ((Friend.p_alias_a = patient_alias_1 AND Friend.p_alias_b = patient_alias_2 AND Friend.flag = true)
               OR (Friend.p_alias_a = patient_alias_2 AND Friend.p_alias_b = patient_alias_1 AND Friend.flag = true)))
    THEN SET are_friends = 1;
    END IF;

END @@
DELIMITER;

---Test Procedure---
--CALL Test_AreFriends('pat_anne', 'pat_bob', @are_friends);
--CALL Test_AreFriends('pat_bob', 'pat_anne', @are_friends);
--select @are_friends;
--select * from Friend;