DROP PROCEDURE IF EXISTS Test_ConfirmFriendRequest;
DELIMITER @@
CREATE PROCEDURE Test_ConfirmFriendRequest
(IN requestor_alias VARCHAR(20), IN requestee_alias VARCHAR(20))
BEGIN
/* add friendship between requestor_alias and requestee_alias, assuming that friendship was
requested previously */

UPDATE Friend SET Friend.flag = true WHERE (Friend.p_alias_a = requestor_alias AND Friend.p_alias_b = requestee_alias AND Friend.flag = false) OR (Friend.p_alias_a = requestee_alias AND Friend.p_alias_b = requestor_alias AND Friend.flag = false);

END @@
DELIMITER;

---Test Procedure---
--CALL Test_ConfirmFriendRequest('pat_anne', 'pat_bob', );
--CALL Test_ConfirmFriendRequest('pat_anne', 'pat_bob');
--select * from Friend;


