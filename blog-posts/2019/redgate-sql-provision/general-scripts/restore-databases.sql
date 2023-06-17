USE [master]
RESTORE DATABASE [StackOverflow] 
FROM  DISK = N'G:\Backups\StackOverflow.bak' WITH  FILE = 1,  
MOVE N'StackOverflow_1' TO N'G:\Data\StackOverflow001.mdf',  
MOVE N'StackOverflow_2' TO N'G:\Data\StackOverflow002.ndf',  
MOVE N'StackOverflow_3' TO N'G:\Data\StackOverflow003.ndf',  
MOVE N'StackOverflow_4' TO N'G:\Data\StackOverflow004.ndf',  
MOVE N'StackOverflow_log' TO N'G:\Data\StackOverflow.ldf',  NOUNLOAD,  STATS = 5

GO

RESTORE DATABASE [StackOverflow2010] 
FROM  DISK = N'G:\Backups\StackOverflow2010.bak' WITH  FILE = 1,  
MOVE N'StackOverflow2010' TO N'G:\Data\StackOverflow2010.mdf',  
MOVE N'StackOverflow2010_log' TO N'G:\Data\StackOverflow2010.ldf',  NOUNLOAD,  STATS = 5

GO

RESTORE DATABASE [StackOverflow2013] 
FROM  DISK = N'G:\Backups\StackOverflow2013.bak' WITH  FILE = 1,  
MOVE N'StackOverflow2013_1' TO N'G:\Data\StackOverflow2013001.mdf',  
MOVE N'StackOverflow2013_2' TO N'G:\Data\StackOverflow2013002.ndf',  
MOVE N'StackOverflow2013_3' TO N'G:\Data\StackOverflow2013003.ndf',  
MOVE N'StackOverflow2013_4' TO N'G:\Data\StackOverflow2013004.ndf',  
MOVE N'StackOverflow2013_log' TO N'G:\Data\StackOverflow2013.ldf',  NOUNLOAD,  STATS = 5

GO



