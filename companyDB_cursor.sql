
USE companyDB;
GO

DECLARE @ssn CHAR(9), @salary DECIMAL(10,2)

DECLARE salary_cursor CURSOR FOR
    SELECT Ssn, Salary FROM EMPLOYEE

OPEN salary_cursor

FETCH NEXT FROM salary_cursor INTO @ssn, @salary

WHILE @@FETCH_STATUS = 0
BEGIN
    IF @salary < 3000
        UPDATE EMPLOYEE SET Salary = Salary * 1.10 WHERE Ssn = @ssn
    ELSE
        UPDATE EMPLOYEE SET Salary = Salary * 1.20 WHERE Ssn = @ssn

    FETCH NEXT FROM salary_cursor INTO @ssn, @salary
END

CLOSE salary_cursor
DEALLOCATE salary_cursor
