DECLARE @ID BIGINT, 
@LastName VARCHAR(100), 
@FirstName VARCHAR(100), 
@Age INT, 
@Gender VARCHAR(100), 
@Level VARCHAR(100);

DECLARE DIAZRecordsCursor CURSOR FOR
SELECT Id, LastName, FirstName, Age, Gender,
    CASE 
        WHEN Age BETWEEN 14 AND 16 THEN UPPER('Freshman')
        WHEN Age BETWEEN 17 AND 19 THEN UPPER('Sophomore')
        WHEN Age BETWEEN 20 AND 22 THEN UPPER('Junior')
        WHEN Age BETWEEN 23 AND 25 THEN UPPER('Senior')
        ELSE UPPER('Unknown')
    END AS Level
FROM Records

OPEN DIAZRecordsCursor
FETCH NEXT FROM DIAZRecordsCursor INTO @ID, @LastName, @FirstName, @Age, @Gender, @Level;

WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT 'ID: ' + CAST(@ID AS VARCHAR(20)) + ' | Name: ' + @FirstName + ' ' + @LastName + ' | Age: ' + CAST(@Age AS VARCHAR(3)) + ' | Gender: ' + @Gender + ' | Level: ' + @Level;
    FETCH NEXT FROM DIAZRecordsCursor INTO @ID, @LastName, @FirstName, @Age, @Gender, @Level;
END

CLOSE DIAZRecordsCursor;
DEALLOCATE DIAZRecordsCursor;