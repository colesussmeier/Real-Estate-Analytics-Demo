CREATE SCHEMA retsdb;

USE retsdb;

CREATE TABLE zhvi_processed(
`Date` DATE NOT NULL,
ZHVI INT,
ZipCode CHAR(5) NOT NULL,
SizeRank INT,
State CHAR(2),
City VARCHAR(40),
Metro VARCHAR(100),
CountyName VARCHAR(60),
Location VARCHAR(50),

PRIMARY KEY (ZipCode, `Date`)
);

show databases;

show variables like "local_infile";

load data local infile 'C:/Users/user0/Desktop/ReactApps/backend procedures/ZHVI_September22_Processed.tsv'
into table zhvi_processed
fields terminated by '\t'
ignore 1 rows;

select * from zhvi_processed;

select * from zhvi_processed
where ZipCode = '10516';

select ZHVI, `Date`, location
from zhvi 
left join locations
on zhvi.ZipCode = locations.ZipCode
where zhvi.ZipCode = '10516';

CREATE TABLE redfin(
`Date` DATE NOT NULL,
ZipCode CHAR(5) NOT NULL,
MedianSalePrice INT,
MedianListPrice INT,
HomesSold INT,
PendingSales INT,
NewListings INT,
Inventory INT,

PRIMARY KEY (ZipCode, `Date`)
);

load data local infile 'C:/Users/user0/Desktop/ReactApps/backend procedures/RedfinPreprocessed.csv'
into table redfin
fields terminated by ','
ignore 1 rows;

# not all key values in redfin exist in zhvi or locations. Have to ignore foreign key checks to get this to work.
set foreign_key_checks = 1;

ALTER TABLE redfin
ADD FOREIGN KEY (ZipCode, `Date`) REFERENCES zhvi(ZipCode, `Date`),
ADD FOREIGN KEY (ZipCode) REFERENCES locations(ZipCode);




