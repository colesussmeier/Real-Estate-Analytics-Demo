use retsdb;

load data local infile 'C:/Users/Steve/Documents/Real Estate Analytics/data/site/ZHVI_Update_April24_1yr.csv'
into table zhvi
fields terminated by ','
ignore 1 rows;

load data local infile 'C:/Users/Steve/Documents/Real Estate Analytics/data/site/Redfin_Update_April24_1yr.csv'
into table redfin
fields terminated by ','
ignore 1 rows;


