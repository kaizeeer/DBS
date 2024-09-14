DECLARE @ID BIGINT, 
@LastName VARCHAR(100), 
@FirstName VARCHAR(100), 
@Age INT, 
@Gender VARCHAR(100), 
@Level VARCHAR(100);

DECLARE DIAZRecordsCursor CURSOR FOR SELECT ID, LastName, FirstName, Age, Gender, Level FROM Records;
OPEN DIAZRecordsCursor
FETCH NEXT FROM DIAZRecordsCursor INTO @ID, @LastName, @FirstName, @Age, @Gender, @Level;

WHILE @@FETCH_STATUS = 0
BEGIN
    IF @Age BETWEEN 14 AND 16
		BEGIN
			SET @Level = LOWER('Freshman');
		END
    ELSE IF @Age BETWEEN 17 AND 19
		BEGIN
			SET @Level = LOWER('Sophomore');
		END
    ELSE IF @Age BETWEEN 20 AND 22
		BEGIN
			SET @Level = LOWER('Junior');
		END
    ELSE IF @Age BETWEEN 23 AND 25
		BEGIN
			SET @Level = LOWER('Senior');
		END
    ELSE 
		BEGIN
			SET @Level = LOWER('Unknown');
		END

    PRINT 'ID: ' + CAST(@ID AS VARCHAR(20)) + ' | Name: ' + @FirstName + ' ' + @LastName + ' | Age: ' + CAST(@Age AS VARCHAR(3)) + ' | Gender: ' + @Gender + ' | Level: ' + @Level;
    FETCH NEXT FROM DIAZRecordsCursor INTO @ID, @LastName, @FirstName, @Age, @Gender, @Level;
END

CLOSE DIAZRecordsCursor;
DEALLOCATE DIAZRecordsCursor;