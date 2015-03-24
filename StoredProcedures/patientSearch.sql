DROP PROCEDURE IF EXISTS Test_PatientSearch;
DELIMITER @@
CREATE PROCEDURE Test_PatientSearch
(IN province VARCHAR(20), IN city VARCHAR(20), OUT num_matches INT)
BEGIN
/* returns in num_matches the total number of patients in the given province and city */

    SELECT count(distinct PatientData.p_alias) INTO num_matches
    FROM PatientData
    WHERE home_address_province = province AND home_address_city = city;

END @@
DELIMITER;

---Test Procedure---
--CALL Test_PatientSearch("Ontario", "Waterloo",@num_matches);
--SELECT @num_matches;
