USE Tempdb
DECLARE @l_sql NVARCHAR(MAX) = 'DROP DATABASE '
SELECT @l_sql = @l_sql + STRING_AGG('[' + name + ']',',') FROM sys.databases where name like '%clone%' AND name != 'Config_Clone' AND name NOT LIKE 'SqlCloneTemp%'
PRINT @l_sql
EXEC sp_executesql @l_sql

