USE master

IF DB_ID ('BiblioteksDatabase') IS NOT NULL
BEGIN 
	ALTER DATABASE BiblioteksDatabase SET SINGLE_USER WITH ROLLBACK IMMEDIATE
	DROP DATABASE BiblioteksDatabase
END

CREATE DATABASE BiblioteksDatabase

USE BiblioteksDatabase

--CREATE THE BOOKS TABLE WITH INFORMATION
CREATE TABLE Books
(
bookID INT IDENTITY(1,1) PRIMARY KEY,
booktitle NVARCHAR(255) NOT NULL,
publisher NVARCHAR(255) NOT NULL,
publisher_date DATE NOT NULL
);

--CREATE THE AUTHORS TABLE WITH INFORMATION
CREATE TABLE Authors
(
AuthorsID INT IDENTITY(1,1) PRIMARY KEY,
first_name NVARCHAR(255) NOT NULL,
last_name NVARCHAR(255) NOT NULL,
email NVARCHAR(250) NOT NULL
);

--CREATE THE BORROWERS TABLE WITH INFORMATION
CREATE TABLE Borrowers
(
BorrowerID INT IDENTITY(1,1) PRIMARY KEY,
first_name NVARCHAR(255) NOT NULL,
last_name NVARCHAR(255) NOT NULL,
email NVARCHAR(250) NOT NULL
);

--INSERTING DATA INTO THE BOOKS TABLE
INSERT INTO Books
VALUES ('Harry Potter and the Philosopher''s Stone', 'Bloomsbury Publishing', '1997-06-26');
INSERT INTO Books
VALUES ('To Kill a Mockingbird', 'Harper Lee', '1960-06-11');
INSERT INTO Books 
VALUES ('The Great Gatsby', 'F.Scott Fitzgerald', '1925-04-10');
INSERT INTO Books
VALUES ('Pride and Prejudice', 'Jane Austen', '1813-01-28');
INSERT INTO Books
VALUES ('The Catcher in the Rye', 'J.D. Salinger', '1951-06-16');

--INSERTING DATA INTO THE AUTHORS TABLE
INSERT INTO Authors 
VALUES ('J.K.', 'Rowling', 'jkrowling@gmail.com');
INSERT INTO Authors
VALUES ('Harper', 'Lee', 'harperlee@gmail.com');
INSERT INTO Authors
VALUES ('F.Scott', 'Fitzgerald', 'fscottfitzgerald@gmail.com');
INSERT INTO Authors
VALUES ('Jane', 'Austen', 'janeausten@gmail.com');
INSERT INTO Authors
VALUES ('J.D.', 'Salinger', 'jdsalinger@gmail.com');

--INSERTING DATA INTO THE BORROWERS TABLE
INSERT INTO Borrowers
VALUES ('John', 'Smith', 'johnsmith@example.com');
INSERT INTO Borrowers
VALUES ('Emma', 'Johnson', 'emmajohnson@example.com');
INSERT INTO Borrowers
VALUES ('Michael', 'Brown', 'michaelbrown@example.com');
INSERT INTO Borrowers 
VALUES ('Sophia', 'Davis', 'sophiadavis@example.com');
INSERT INTO Borrowers 
VALUES ('William', 'Wilson', 'williamwilson@example.com');

--SHOWS ALL TABLES IN RESULTS
SELECT * FROM Books;
SELECT * FROM Authors;
SELECT * FROM Borrowers;

--SHOWS ALL THE INFORMATION IN ONE TABLE, WHICH BORROWER LEND WHICH BOOK FROM WHICH ACTOR
SELECT booktitle, a.first_name, a.last_name, a.email, bo.first_name, bo.last_name, bo.email
FROM Books b
JOIN Authors a ON b.bookID = a.AuthorsID
JOIN Borrowers bo ON b.bookID = bo.BorrowerID;

--SHOWS THE AMOUNT OF BOOKS PUBLISHED IN EACH YEAR SINCE 1800 AND THE NUMBER OF BOOKS PUBLISHED IN THAT DECADE
SELECT FLOOR(YEAR(publisher_date)/10)*10 AS decade, COUNT(*) AS num_books
FROM Books
WHERE YEAR(publisher_date) >= 1800
GROUP BY FLOOR(YEAR(publisher_date)/10)*10;

EXEC sp_GetBookBorrowerDetails;