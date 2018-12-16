DROP DATABASE IF EXISTS Cinema;
CREATE DATABASE Cinema;

USE Cinema;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS Building;
CREATE TABLE Building(
building_ID INT NOT NULL,
building_Address VARCHAR(50),
PRIMARY KEY (building_ID)
);

DROP TABLE IF EXISTS Customer;
CREATE TABLE Customer(
customer_ID INT NOT NULL,
customer_Phone INT(8) UNIQUE,
customer_Email VARCHAR(50) UNIQUE,
customer_Fname VARCHAR(25),
customer_Lname VARCHAR(25),
PRIMARY KEY (customer_ID)
);

#Collective unique booking_seat_ID and booking_Movie_ID to ensure people cannot book the same seat for the same movie
DROP TABLE IF EXISTS Booking;
CREATE TABLE Booking(
booking_ID INT NOT NULL AUTO_INCREMENT,
booking_Seat_ID INT,
booking_Shows_ID INT,
booking_Customer_ID INT,
UNIQUE (booking_Seat_ID, booking_Shows_ID),
PRIMARY KEY (booking_ID),
FOREIGN KEY (booking_Shows_ID) REFERENCES Shows(shows_ID),
FOREIGN KEY (booking_Customer_ID) REFERENCES Customer(customer_ID),
FOREIGN KEY (booking_Seat_ID) REFERENCES Seat(seat_ID)
);

DROP TABLE IF EXISTS Room;
CREATE TABLE Room(
room_ID INT NOT NULL AUTO_INCREMENT,
room_Nr INT,
room_Building_ID INT,
room_Type VARCHAR(25),
PRIMARY KEY (room_ID),
FOREIGN KEY (room_Building_ID) REFERENCES Building(building_ID)
);

#seat_type is an integer, could be 1-4 1 beign standard 2 'standalone' 3 beign VIP chair and 4 for wheel chairs
#collective unique on seat_Nr, seat_Row and seat_Room_ID to make sure seat 1 row 1 cannot occure more than once in each room.
DROP TABLE IF EXISTS Seat;
CREATE TABLE Seat(
seat_ID INT NOT NULL AUTO_INCREMENT,
seat_Nr INT,
seat_Row INT,
seat_Room_ID INT,
seat_Type INT,
PRIMARY KEY (seat_ID),
UNIQUE(seat_Nr, seat_Row, seat_Room_ID),
FOREIGN KEY (seat_Room_ID) REFERENCES Room(room_ID)
);

DROP TABLE IF EXISTS Movie;
CREATE TABLE Movie(
movie_ID INT NOT NULL AUTO_INCREMENT,
movie_Title VARCHAR(50),
movie_Runtime INT,
movie_Esrb_rating VARCHAR(15),
movie_Room_ID INT,
PRIMARY KEY (movie_ID),
FOREIGN KEY (movie_Room_ID) REFERENCES Room(room_ID)
);

#To ensure that the same room does not have a double bnooking 
DROP TABLE IF EXISTS Shows;
CREATE TABLE Shows(
shows_ID INT NOT NULL,
shows_Movie_ID INT,
shows_Room_ID INT,
shows_Date DATE,
shows_Start_Time TIME,
shows_End_Time TIME,
shows_Price INT,
PRIMARY KEY (shows_ID),
FOREIGN KEY (shows_Movie_ID) REFERENCES Movie(movie_ID),
FOREIGN KEY (shows_Room_ID) REFERENCES Room(room_ID)
);

SET FOREIGN_KEY_CHECKS = 1;


