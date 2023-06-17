# Redgate SQL Provision Demo
## Contents
Four script folders all performing identical steps for that specific database;
* adventureworks
* stackoverflow
* stackoverflow2010
* stackoverflow2013

One folder with general scripts used for demo;
* general-scripts


## Databases
Databases used for the demos were;

* [AdventureWorksDW2017](https://docs.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-2017])
* [StackOverflow](https://www.brentozar.com/archive/2015/10/how-to-download-the-stack-overflow-database-via-bittorrent/)
* [StackOverflow2010](https://www.brentozar.com/archive/2015/10/how-to-download-the-stack-overflow-database-via-bittorrent/)
* [StackOverflow2013](https://www.brentozar.com/archive/2015/10/how-to-download-the-stack-overflow-database-via-bittorrent/)


## Preparation
* Create a service account to be used by SQL Clone
* Add service account to administrators group
* Grant service account sysadmin
* Install SQL Provision
* Upgrade SQL Provision to latest
* Install agent
* Install powershell cmdlets
* Create share for image hosting


## Edit scripts
Some of the scripts are specific to my demo, so you will need to adjust to reflect your own setup. All changes will be consistent in each folder. Changes based on adventureworks folder;

adventureworksDW2017-create-clones.ps1
* Change machinename (line 10)

adventureworksDW2017-create-image.ps1
* Change machinename (line 9)
* Change path (line 11)
* Change path (line 13)
* Change backupfilename (line 17)

adventureworksDW2017-delete-image.ps1
* Change machinename (line 2)

adventureworksDW2017-rebuild-clone-dev2.ps1
* Change machinename (line 2 & 8)

adventureworksDW2017.DMSMaskSet
* Change connection string


## Need more help?
You can contact me [here](https://metricy.uk/)


