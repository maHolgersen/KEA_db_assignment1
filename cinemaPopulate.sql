USE cinema;



INSERT INTO Building(building_ID, building_Address)
VALUES(1, "Some Address 44");

INSERT INTO Customer(customer_ID, customer_Phone, customer_Email, customer_Fname, customer_Lname)
VALUES(1, 11111111, "wick@Email.com", "John", "Wick"),
	(2, 22222222, "brucewayne@Email.com", "Bruce", "Wayne"),
	(3, 33333333, "batman@Email.com", "Bat", "Man");

INSERT INTO Room(room_Nr, room_Type, room_Building_ID)
VALUES(1, "3D", 1),
	(2, "Normal", 1),
    (3, "DolbySound", 1);

INSERT INTO Movie(movie_Title, movie_Runtime, movie_Esrb_rating)
VALUES("Avengers: Infinity War", 149, "Teen"),
	("Batman", 119, "Mature"),
    ("My little pony", 85, "Everyone"),
    ("American psycho", 90, "Mature");

INSERT INTO Shows(shows_ID, shows_Movie_ID, shows_Room_ID, shows_Date, shows_Start_Time, shows_End_Time, shows_Price)
VALUES(1, 1, 1, '2018-12-24', '15:00:00', '16:00:00', 99),
	(2, 2, 1, '2018-12-24', '16:30:00', '17:50:00', 99),
	(3, 2, 2, '2018-12-24', '16:30:00', '17:50:00', 99);
    
CALL populateSeats(10, 8, 1);
CALL populateSeats(10, 8, 2);
CALL populateSeats(10, 8, 3);

INSERT INTO Booking(booking_Seat_ID, booking_Shows_ID, booking_customer_ID)
VALUES (24, 2,  3),
	(26, 2, 3);
