CREATE TABLE zhvi LIKE zhvi_processed;

INSERT INTO zhvi SELECT * FROM zhvi_processed;

ALTER TABLE zhvi
DROP COLUMN SizeRank,
DROP COLUMN State,
DROP COLUMN City,
DROP COLUMN Metro,
DROP COLUMN CountyName,
DROP COLUMN Location;

DROP TABLE zhvi_processed;

select * from locations;


CREATE TABLE locations(
ZipCode CHAR(5) NOT NULL,
SizeRank INT,
State CHAR(2),
City VARCHAR(40),
Metro VARCHAR(100),
CountyName VARCHAR(60),
Location VARCHAR(50),
PRIMARY KEY (ZipCode)
);

load data local infile 'C:/Users/user0/Desktop/ReactApps/backend procedures/locations_third_nf.tsv'
into table locations
fields terminated by '\t'
ignore 1 rows;

ALTER TABLE locations
ADD FOREIGN KEY (ZipCode) REFERENCES zhvi(ZipCode);


