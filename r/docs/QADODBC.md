# ODBC for QAD
## Windows

No ODBC setup required.  See R documentation for set.qad.connection and example connection.## Mac / Nix

### Install unixODBC
 
If you're using macports:

	$ sudo port install unixODBC  

If you are using brew:

	$ brew install unixODBC
	
### Install FreeTDS
 
If you're using macports:

	$ sudo port install freetds +mssql +odbc  

If you're using brew:

	$ brew install freetds --with-unixodbc --with-msssql
 
 
### Add ODBC configuration

``` 
~/.odbc.ini:
[qadDSN]  
Driver = /opt/local/lib/libtdsodbc.so  
Servername = qad  
Trace = No  
Database = qai  
Schema = db_datareader  
``` 

> **NOTE**: The driver location for **mapports** is ``/opt/local/lib/libtdsodbc.so`` and ``/usr/local/lib/libtdsodbc.so`` for **brew**.  Adjust the Driver setting accordingly.
 
### Add FreeTDS configuration
 
 ```
~/.freetds.conf
[qad]  
host = NY-RANDD-A02.tlr.thomson.com  
port = 1433  
tds version = 8.0  
client charset = UTF-8  
``` 

> **NOTE**: NY-RANDD-A02.tlr.thomson.com - is an exmaple hostname, your hostname will be different.

### Test connection
 
Start SQL shell:

	$ isql -v qadDSN <LOGINNAME> <PASSWORD>  
 
Execute a query:

```
SELECT TOP 5 OwnInfo.OwnerName,OwnSecInfo.SecName,OwnHoldDet.QtrDate,OwnHoldDet.SharesHeld,OwnHoldDet.ValueHeld FROM OwnHoldDet INNER JOIN OwnInfo ON OwnHoldDet.OwnerCode = OwnInfo.OwnerCode LEFT OUTER JOIN OwnSecInfo ON OwnHoldDet.SecurityCode = OwnSecInfo.SecurityCode;  
 
Should return something like:
OwnerName	SecName	QtrDate	SharesHeld	ValueHeld
AR Asset Management, Inc.	AMR Corp	1998-12-31 00:00:00.000	11500	682813
AR Asset Management, Inc.	AMR Corp	1998-12-31 00:00:00.000	11500	682813
AR Asset Management, Inc.	AMR Corp	1999-03-31 00:00:00.000	11500	673469
AR Asset Management, Inc.	AMR Corp	1999-03-31 00:00:00.000	11500	673469
AR Asset Management, Inc.	AMR Corp	1999-06-30 00:00:00.000	11500	784875
``` 
 
Connect from R
 
In shell:

	$ export ODBCINI=~/.odbc.ini  
	$ R  
 
In R:

	> library(RODBC)  
	> conn <- odbcConnect("qadDSN", "<LOGINNAME>", "<PASSWORD>", readOnlyOptimize=TRUE)  
 
## References
 
* [Accessing MS SQL Server from Mac OS X (or Linux): FreeTDS, unixODBC, RODBC, R](http://blog.nguyenvq.com/2010/05/16/freetds-unixodbc-rodbc-r/)
