DROP PROCEDURE IF EXISTS Test_DoctorSearch;
DELIMITER @@
CREATE PROCEDURE Test_DoctorSearch
(IN gender VARCHAR(20), IN city VARCHAR(20), IN specialization VARCHAR(20), IN
num_years_licensed INT, OUT num_matches INT)
BEGIN
/* returns in num_matches the total number of doctors that match exactly on all the given
criteria: gender ('male' or 'female'), city, specialization, and number of years licensed */

    SELECT count(distinct DoctorData.d_alias) INTO num_matches
    FROM DoctorData
    WHERE DoctorData.gender = gender
    AND DoctorData.city = city
    AND DoctorData.spec_name = specialization
    AND DoctorData.license_year = YEAR(CURDATE()) - num_years_licensed;

END @@
DELIMITER;

---Test Procedure---
--CALL Test_DoctorSearch('female', 'Waterloo', 'obstetrician', 10, @num_matches);
--select @num_matches;
