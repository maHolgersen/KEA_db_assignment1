USE cinema;

#For whatever reason MySQL does not support CHECK constraints
ALTER TABLE Customer
ADD CONSTRAINT checkEmail CHECK (customer_Email = '%_@__%.__%');

#For whatever reason MySQL does not support CHECK constraints
ALTER TABLE Customer
ADD CONSTRAINT checkPhone CHECK (customer_Phone BETWEEN 10000000 AND 99999999);

#For whatever reason MySQL does not suppoer CHECK constraints
ALTER TABLE Shows
ADD CONSTRAINT checkShowTime CHECK (shows_Start_Time NOT BETWEEN 
	(SELECT shows_Start_Time AS st FROM cinema.Shows WHERE Shows.Shows_Room_ID = shows_Room_ID AND Shows.shows_Date = shows_Date) 
	AND 
	(SELECT shows_End_Time AS et FROM cinema.Shows WHERE Shows.shows_Room_ID = shows_Room_ID AND Shows.shows_Date = shows_Date));

#Trigger to check the format of the email and phone number of a new customer
DROP TRIGGER IF EXISTS before_customer_insert;
DELIMITER //
CREATE TRIGGER before_customer_insert
BEFORE INSERT ON Customer
FOR EACH ROW
	BEGIN
		IF (NEW.customer_Email NOT LIKE '%_@__%.__%') 
			THEN
				SET NEW.customer_ID = NULL;
			END IF;
		IF (NEW.customer_Phone NOT BETWEEN 10000000 AND 99999999)
			THEN
				SET NEW.customer_ID = NULL;
			END IF;
    END //
DELIMITER ;

#Tigger to check if the new show overlaps in time with any other show on that day //THIS TRIGGER DOES NOT WORK 100%//
#This trigger will only check on the 1st returned show
DROP TRIGGER IF EXISTS before_shows_insert;
DELIMITER //
CREATE TRIGGER before_shows_insert
BEFORE INSERT ON Shows
FOR EACH ROW
	BEGIN
		DECLARE done INT DEFAULT FALSE;
		DECLARE st, et TIME DEFAULT '00:00:00';
		DECLARE cur CURSOR FOR SELECT shows_Start_Time, shows_End_Time FROM Shows WHERE shows_Date = NEW.shows_Date;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
		OPEN cur;
			read_loop: LOOP
				FETCH  cur INTO st, et;
			
				IF done THEN
					LEAVE read_loop;
				END IF;
        
				IF (NEW.shows_Start_Time BETWEEN st AND et) 
					THEN
						SIGNAL SQLSTATE '45000'
						SET MESSAGE_TEXT = 'new show conflicts with another show';
				END IF;
				IF (NEW.shows_End_Time BETWEEN st AND et)
					THEN
						SIGNAL SQLSTATE '45000'
						SET MESSAGE_TEXT = 'new show conflicts with another show';
				END IF;
            END LOOP;
		CLOSE cur;
	END //
DELIMITER ;

#Procedure to populate seats, called with 3 ints, seatCount for how meny seats pr row, seatRow for how meny rows and seatRoom for wich room.
DROP PROCEDURE IF EXISTS cinema.populateSeats;
DELIMITER //
CREATE PROCEDURE populateSeats(seatCount INT, seatRows INT, seatRoom INT)
BEGIN
	DECLARE sCount, sRow INT DEFAULT 1;
		WHILE sCount <= seatCount AND sRow <= seatRows
		DO
			INSERT INTO Seat(seat_Nr, seat_Row, seat_Room_ID, seat_Type)
			VALUES(sCount, sRow, seatRoom, 1);
			IF (sCount = seatCount) 
				THEN
					SET sRow = sRow + 1;
                    SET sCount = 1;
			END IF;
            SET sCount = sCount + 1;
        END WHILE;
END //
DELIMITER ;
