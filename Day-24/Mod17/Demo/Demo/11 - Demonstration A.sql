-- Demonstration A

-- Step 1: Open a new query window to the TSQL database
USE TSQL;
GO

-- Step 2: Raise a custom error with RAISERROR
RAISERROR (N'%s %d %s',
10,  --0-10  Informational    11-16 For errors 17-25 system/serious errors
1,  ---State
N'Error number:',
123,
N'- No action needed')

/*
%s  ---- 'Error Number'
%d --- 123
%s --- '- No action needed'
*/

--Capture @@ERROR into a variable
DECLARE @ErrorValue int;
RAISERROR (N'%s %d %s',
10,
1,
N'Error number:',
123,
N'- No action needed');
SET @ErrorValue = @@ERROR;
IF @ErrorValue <> 0
PRINT 'Error=' + CAST(@ErrorValue AS VARCHAR(8));

--Create a custom error message
sp_addmessage 50001, 10, N'%s %d %s'

--Use a custom error message
RAISERROR (50001,
10,
1,
N'Error number:',
123,
N'- No action needed')