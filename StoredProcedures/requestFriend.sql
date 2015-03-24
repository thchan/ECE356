DROP PROCEDURE IF EXISTS Test_RequestFriend;
DELIMITER @@
CREATE PROCEDURE Test_RequestFriend
(IN requestor_alias VARCHAR(20), IN requestee_alias VARCHAR(20))
BEGIN
/* add friendship request from requestor_alias to requestee_alias */


IF NOT EXISTS (SELECT *
           FROM Friend
           WHERE((Friend.p_alias_a = requestor_alias AND Friend.p_alias_b = requestee_alias) 
           OR (Friend.p_alias_a = requestee_alias AND Friend.p_alias_b = requestor_alias)))
THEN INSERT INTO Friend VALUES (requestor_alias, requestee_alias, false);
END IF;

END @@
DELIMITER;

---Test Procedure---
--CALL Test_RequestFriend('pat_anne', 'pat_bob');
--select * from Friend;

INSERT INTO Friend VALUES ('pat_bob', 'pat_homer', false);