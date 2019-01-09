

#SELECT Seat.seat_Row AS sr, Seat.seat_Nr AS sn FROM cinema.Seat WHERE seat_ID = (SELECT booking_Seat_ID FROM Booking);

#SELECT * FROM cinema.Booking;
SELECT * FROM cinema.Shows INNER JOIN cinema.Booking ON shows_ID = booking_Shows_ID;

#Fetch all shows and the shows
SELECT * FROM cinema.Movie INNER JOIN cinema.Shows ON movie_ID = shows_Movie_ID;

#Trying to insert Show with conflicting start time with another show
INSERT INTO Shows(shows_Movie_ID, shows_Room_ID, shows_Date, shows_Start_Time, shows_End_Time, shows_Price)
VALUES	(1, 1, '2019-01-29', '15:30:00', '16:30:00', 99);