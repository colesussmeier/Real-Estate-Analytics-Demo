CREATE TABLE YoY22(
ZipCode CHAR(5) NOT NULL,
YoY decimal(5,2),
PRIMARY KEY (ZipCode)
);

load data local infile 'C:/Users/user0/Desktop/ReactApps/backend procedures/YoY22.csv'
into table YoY22
fields terminated by ','
ignore 1 rows;

ALTER TABLE locations
ADD FOREIGN KEY (ZipCode) REFERENCES YoY22(ZipCode);