CREATE PROCEDURE sp_GetBookBorrowerDetails
AS
    SELECT Books.booktitle, Authors.first_name, Authors.last_name
	FROM Books, Authors, Borrowers
GO;