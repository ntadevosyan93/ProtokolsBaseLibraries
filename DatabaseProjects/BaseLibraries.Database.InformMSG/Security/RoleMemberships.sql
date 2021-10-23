EXECUTE sp_addrolemember @rolename = N'db_securityadmin', @membername = N'st1';


GO
EXECUTE sp_addrolemember @rolename = N'db_securityadmin', @membername = N'st2';


GO
EXECUTE sp_addrolemember @rolename = N'db_owner', @membername = N'st1';


GO
EXECUTE sp_addrolemember @rolename = N'db_owner', @membername = N'st2';


GO
EXECUTE sp_addrolemember @rolename = N'db_owner', @membername = N'Inform_User';


GO
EXECUTE sp_addrolemember @rolename = N'db_denydatawriter', @membername = N'st1';


GO
EXECUTE sp_addrolemember @rolename = N'db_denydatawriter', @membername = N'st2';


GO
EXECUTE sp_addrolemember @rolename = N'db_denydatareader', @membername = N'st1';


GO
EXECUTE sp_addrolemember @rolename = N'db_denydatareader', @membername = N'st2';


GO
EXECUTE sp_addrolemember @rolename = N'db_ddladmin', @membername = N'st1';


GO
EXECUTE sp_addrolemember @rolename = N'db_ddladmin', @membername = N'st2';


GO
EXECUTE sp_addrolemember @rolename = N'db_datawriter', @membername = N'st1';


GO
EXECUTE sp_addrolemember @rolename = N'db_datawriter', @membername = N'st2';


GO
EXECUTE sp_addrolemember @rolename = N'db_datawriter', @membername = N'Inform_User';


GO
EXECUTE sp_addrolemember @rolename = N'db_datareader', @membername = N'st1';


GO
EXECUTE sp_addrolemember @rolename = N'db_datareader', @membername = N'st2';


GO
EXECUTE sp_addrolemember @rolename = N'db_datareader', @membername = N'Inform_User';


GO
EXECUTE sp_addrolemember @rolename = N'db_backupoperator', @membername = N'st1';


GO
EXECUTE sp_addrolemember @rolename = N'db_backupoperator', @membername = N'st2';


GO
EXECUTE sp_addrolemember @rolename = N'db_accessadmin', @membername = N'st1';


GO
EXECUTE sp_addrolemember @rolename = N'db_accessadmin', @membername = N'st2';

