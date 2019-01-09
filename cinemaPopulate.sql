USE cinema;

INSERT INTO Building(building_ID, building_Address)
VALUES	(1, "Address 1"),
		(2, "Address 2"),
		(3, "Adderess 3");

INSERT INTO Customer(customer_ID, customer_Phone, customer_Email, customer_Fname, customer_Lname)
VALUES	(1, 11111111, "wick@Email.com", "John", "Wick"),
		(2, 22222222, "brucewayne@Email.com", "Bruce", "Wayne"),
		(3, 33333333, "batman@Email.com", "Bat", "Man");

INSERT INTO Room(room_Nr, room_Type, room_Building_ID)
VALUES	(1, "building_one_3D", 1),
		(2, "building_one_Normal", 1),
		(3, "building_one_DolbySound", 1),
		(1, "building_two_3D", 2),
		(2, "building_two_Normal", 2),
		(3, "building_two_DolbySound", 2),
		(1, "building_three_3D", 3),
		(2, "building_three_Normal", 3),
		(3, "building_three_DolbySound", 3);

INSERT INTO Esrb(esrb_ID, esrb_Rating)
values	(1, "Everyone"),
		(2, "Teen"),
		(3, "Mature");

#Populating
INSERT INTO Movie(movie_Title, movie_Runtime, movie_Esrb_rating)
VALUES	("Avengers: Infinity War", 149, 2),
		("Batman", 119, 3),
		("My little pony", 85, 1),
		("American psycho", 90, 3);

#Populating shows table
INSERT INTO Shows(shows_Movie_ID, shows_Room_ID, shows_Date, shows_Start_Time, shows_End_Time, shows_Price)
VALUES	(1, 1, '2019-01-29', '15:00:00', '16:00:00', 99),
		(2, 1, '2019-03-12', '16:30:00', '17:50:00', 99),
		(2, 2, '2019-03-19', '16:30:00', '17:50:00', 99),
		(3, 4, '2019-02-15', '15:00:00', '16:00:00', 99),
		(2, 3, '2019-03-16', '16:30:00', '17:50:00', 99),
		(3, 5, '2019-02-24', '16:30:00', '17:50:00', 99),
		(1, 6, '2019-02-21', '15:00:00', '16:00:00', 99),
		(2, 7, '2019-01-18', '16:30:00', '17:50:00', 99),
		(3, 8, '2019-01-17', '16:30:00', '17:50:00', 99),
		(1, 9, '2019-02-04', '15:00:00', '16:00:00', 99),
		(2, 9, '2019-01-20', '16:30:00', '17:50:00', 99),
		(3, 2, '2019-01-24', '16:30:00', '17:50:00', 99);

#Populating seats, nr of seats, nr of rows and room id.    
CALL populateSeats(5, 5, 1);
CALL populateSeats(10, 7, 2);
CALL populateSeats(9, 8, 3);
CALL populateSeats(8, 6, 4);
CALL populateSeats(7, 5, 5);
CALL populateSeats(18, 3, 6);
CALL populateSeats(20, 1, 7);
CALL populateSeats(10, 5, 8);
CALL populateSeats(7, 8, 9);

#populating to bookings table
INSERT INTO Booking(booking_Seat_Nr, booking_Seat_Row, booking_Room_ID, booking_Shows_ID, booking_customer_ID)
VALUES	(3, 1, 2,  3, 2),
		(5, 1, 2, 3, 2);
