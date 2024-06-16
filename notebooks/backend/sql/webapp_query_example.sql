SELECT * FROM redfin
left join zhvi
on redfin.ZipCode = zhvi.ZipCode and redfin.Date = zhvi.Date
where zhvi.ZipCode = '10516';

select * from zhvi 
where ZipCode = '10516';

SELECT * FROM zhvi
left join redfin
on redfin.ZipCode = zhvi.ZipCode and redfin.Date = zhvi.Date
where zhvi.ZipCode = '10516';