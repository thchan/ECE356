DROP PROCEDURE IF EXISTS Test_ResetDB;
DELIMITER @@
CREATE PROCEDURE Test_ResetDB ()
BEGIN
/* resets the database to the initial state described in Section 3 */

    DROP TABLE IF EXISTS Review;
    DROP TABLE IF EXISTS Friend;
    DROP TABLE IF EXISTS Friend;
    DROP TABLE IF EXISTS WorksAt;
    DROP TABLE IF EXISTS WorkAddress;
    DROP TABLE IF EXISTS SpecializesIn;
    DROP TABLE IF EXISTS Doctor;
    DROP TABLE IF EXISTS Patient;
    DROP TABLE IF EXISTS User;    
    DROP TABLE IF EXISTS Specialization;

    
    CREATE TABLE User (
        user_alias	VARCHAR(40) PRIMARY KEY,
        first_name	VARCHAR(40) NOT NULL,
        last_name	VARCHAR(40) NOT NULL,
        email_address	VARCHAR(40) NOT NULL,
        password_hash   VARCHAR(256) NOT NULL,
        password_salt   VARCHAR(64) NOT NULL
    );

    CREATE TABLE Doctor (
        d_alias		VARCHAR(40) PRIMARY KEY,
        user_alias	VARCHAR(40) NOT NULL,
        gender		VARCHAR(6) NOT NULL,
        license_year    INTEGER(4) NOT NULL,
        FOREIGN KEY (user_alias) REFERENCES User(user_alias)
    );

    CREATE TABLE Patient (
        p_alias 		VARCHAR(40) PRIMARY KEY,
        user_alias		VARCHAR(40) NOT NULL,
        home_address_province	VARCHAR(40) NOT NULL,
        home_address_city	VARCHAR(40) NOT NULL,
        FOREIGN KEY (user_alias) REFERENCES User(user_alias)
    );

    CREATE TABLE Review (
        review_id               INT PRIMARY KEY AUTO_INCREMENT,
        p_alias                 VARCHAR(40) NOT NULL,
        d_alias                 VARCHAR(40) NOT NULL,
        rating			FLOAT NOT NULL,
        date			DATE NOT NULL,
        comments                VARCHAR(1000) NOT NULL,
        FOREIGN KEY (p_alias) REFERENCES Patient(p_alias),
        FOREIGN KEY (d_alias) REFERENCES Doctor(d_alias),
        CONSTRAINT chk_Review_Rating CHECK (rating > -1 AND rating <6)
    );

	CREATE TABLE Friend (
	        p_alias_a               VARCHAR(40) NOT NULL,
	        p_alias_b               VARCHAR(40) NOT NULL,
			flag			BOOLEAN NOT NULL,
	        FOREIGN KEY (p_alias_a) REFERENCES Patient(p_alias),
	        FOREIGN KEY (p_alias_b) REFERENCES Patient(p_alias),
			CONSTRAINT friendID PRIMARY KEY(p_alias_a,p_alias_b)
	);

    CREATE TABLE WorkAddress (
        location_id    INT PRIMARY KEY AUTO_INCREMENT,
        address        VARCHAR(40) NOT NULL,
        city           VARCHAR(40) NOT NULL,
        province       VARCHAR(40) NOT NULL,
        postal_code    VARCHAR(7) NOT NULL
    );   
    INSERT INTO WorkAddress VALUES ('1', '1 Elizabeth Street', 'Waterloo', 'Ontario', 'N2L2W8');
    INSERT INTO WorkAddress VALUES ('2', '2 Aikenhead Street', 'Kitchener', 'Ontario', 'N2P1K2');
    INSERT INTO WorkAddress VALUES ('3', '1 Jane Street', 'Waterloo', 'Ontario', 'N2L2W8');
    INSERT INTO WorkAddress VALUES ('4', '2 Amniotic Street', 'Kitchener', 'Ontario', 'N2P2K5');
    INSERT INTO WorkAddress VALUES ('5', '1 Mary Street', 'Cambridge', 'Ontario', 'N2L1A2');
    INSERT INTO WorkAddress VALUES ('6', '1 Jack Street', 'Guelph', 'Ontario', 'N2L1G2');
    INSERT INTO WorkAddress VALUES ('7', '1 Heart Street', 'Waterloo', 'Ontario', 'N2P2W5');
    INSERT INTO WorkAddress VALUES ('8', '1 Beth Street', 'Cambridge', 'Ontario', 'N2L1C2');
    INSERT INTO WorkAddress VALUES ('9', '1 Cutter Street', 'Kitchener', 'Ontario', 'N2P2K5');


    CREATE TABLE WorksAt (
        d_alias         VARCHAR(40) NOT NULL,
        location_id     INT,
        FOREIGN KEY (d_alias) REFERENCES Doctor(d_alias),
        FOREIGN KEY (location_id) REFERENCES WorkAddress(location_id),
        CONSTRAINT worksAtID PRIMARY KEY(d_alias,location_id)
    );
   
    CREATE TABLE Specialization (
        spec_id         INT PRIMARY KEY AUTO_INCREMENT,
        spec_name       VARCHAR(40) NOT NULL
    );
    INSERT INTO Specialization VALUES (1, 'allergologist');
    INSERT INTO Specialization VALUES (2, 'naturopath');
    INSERT INTO Specialization VALUES (3, 'obstetrician');
    INSERT INTO Specialization VALUES (4, 'gynecologist');
    INSERT INTO Specialization VALUES (5, 'cardiologist');
    INSERT INTO Specialization VALUES (6, 'surgeon');
    INSERT INTO Specialization VALUES (7, 'psychiatrist');
    

    CREATE TABLE SpecializesIn (
        d_alias         VARCHAR(40) NOT NULL,
        spec_id         INT,
        FOREIGN KEY (d_alias) REFERENCES Doctor(d_alias),
        FOREIGN KEY (spec_id) REFERENCES Specialization(spec_id),
        CONSTRAINT specializesInID PRIMARY KEY(d_alias,spec_id)
    );


    INSERT INTO User VALUES ('doc_aiken','John','Aikenhead','aiken@head.com', SHA2('doc_aiken', 256), 'test');
    INSERT INTO Doctor VALUES ('doc_aiken','doc_aiken', 'male', 1990);
    INSERT INTO WorksAt VALUES ('doc_aiken', 1);
    INSERT INTO WorksAt VALUES ('doc_aiken', 2);
    INSERT INTO SpecializesIn VALUES ('doc_aiken', 1);
    INSERT INTO SpecializesIn VALUES ('doc_aiken', 2);
    

    INSERT INTO User VALUES ('doc_amnio','Jane','Amniotic','obgyn_clinic@rogers.com', SHA2('doc_amnio', 256), 'test');
    INSERT INTO Doctor VALUES ('doc_amnio','doc_amnio', 'female', 2005);
    INSERT INTO WorksAt VALUES ('doc_amnio', 3);
    INSERT INTO WorksAt VALUES ('doc_amnio', 4);
    INSERT INTO SpecializesIn VALUES ('doc_amnio', 3);
    INSERT INTO SpecializesIn VALUES ('doc_amnio', 4);

    INSERT INTO User VALUES ('doc_umbilical','Mary','Umbilical','obgyn_clinic@rogers.com', SHA2('doc_umbilical', 256), 'test');
    INSERT INTO Doctor VALUES ('doc_umbilical','doc_umbilical', 'female', 2006);
    INSERT INTO WorksAt VALUES ('doc_umbilical', 4);
    INSERT INTO WorksAt VALUES ('doc_umbilical', 5);
    INSERT INTO SpecializesIn VALUES ('doc_umbilical', 2);
    INSERT INTO SpecializesIn VALUES ('doc_umbilical', 3);

    INSERT INTO User VALUES ('doc_heart','Jack','Hearty','jack@healthyheart.com', SHA2('doc_heart', 256), 'test');
    INSERT INTO Doctor VALUES ('doc_heart','doc_heart', 'male', 1980);
    INSERT INTO WorksAt VALUES ('doc_heart', 6);
    INSERT INTO WorksAt VALUES ('doc_heart', 7);
    INSERT INTO SpecializesIn VALUES ('doc_heart', 5);
    INSERT INTO SpecializesIn VALUES ('doc_heart', 6);

    INSERT INTO User VALUES ('doc_cutter','Beth','Cutter','beth@tummytuck.com', SHA2('doc_cutter', 256), 'test');
    INSERT INTO Doctor VALUES ('doc_cutter','doc_cutter', 'female', 2014);
    INSERT INTO WorksAt VALUES ('doc_cutter', 8);
    INSERT INTO WorksAt VALUES ('doc_cutter', 9);
    INSERT INTO SpecializesIn VALUES ('doc_cutter', 6);
    INSERT INTO SpecializesIn VALUES ('doc_cutter', 7);



    INSERT INTO User VALUES ('pat_bob','Bob','Bobberson','thebobbersons@sympatico.ca', SHA2('pat_bob', 256), 'test');
    INSERT INTO Patient VALUES ('pat_bob', 'pat_bob', 'Ontario', 'Waterloo');

    INSERT INTO User VALUES ('pat_peggy','Peggy','Bobberson','thebobbersons@sympatico.ca', SHA2('pat_peggy', 256), 'test');
    INSERT INTO Patient VALUES ('pat_peggy', 'pat_peggy', 'Ontario', 'Waterloo');
    
    INSERT INTO User VALUES ('pat_homer','Homer','Homerson','homer@rogers.com', SHA2('pat_homer', 256), 'test');
    INSERT INTO Patient VALUES ('pat_homer', 'pat_homer', 'Ontario', 'Kitchener');

    INSERT INTO User VALUES ('pat_kate','Kate','Homerson','kate@hello.com', SHA2('pat_kate', 256), 'test');
    INSERT INTO Patient VALUES ('pat_kate', 'pat_kate', 'Ontario', 'Cambridge');  

    INSERT INTO User VALUES ('pat_anne','Anne','MacDonald','anne@gmail.com', SHA2('pat_anne', 256), 'test');
    INSERT INTO Patient VALUES ('pat_anne', 'pat_anne', 'Ontario', 'Guelph');

    

END @@
DELIMITER;

---Test Procedure---
--CALL Test_ResetDB();

