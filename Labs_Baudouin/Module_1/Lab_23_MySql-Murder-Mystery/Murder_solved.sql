SELECT *
FROM crime_scene_report
WHERE date=20180115 AND type='murder' AND city = 'SQL City';

/* Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". 
The second witness, named Annabel, lives somewhere on "Franklin Ave".*/

SELECT *
FROM person p
WHERE p.address_street_name='Northwestern Dr'
order by address_number; 

-- 89906	Kinsey Erickson	510019	309	Northwestern Dr	635287661

SELECT *
FROM person p
WHERE p.address_street_name='Franklin Ave' AND name LIKE '%Annabel%'
order by address_number;              

-- 16371	Annabel Miller	490173	103	Franklin Ave	318771143

SELECT transcript
FROM interview
WHERE person_id = 16371;

/*I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January 
the 9th.*/

SELECT c.membership_id, c.check_in_date, c.check_in_time, c.check_out_time, m.person_id, m.name
FROM get_fit_now_check_in c
LEFT JOIN get_fit_now_member m
ON c.membership_id=m.id AND (check_in_time<=1700 AND check_out_time>=1600);
WHERE c.check_in_date = 20180109

/*membership_id	check_in_date	check_in_time	check_out_time	person_id	name
48Z7A	20180109	1600	1730	28819	Joe Germuska
48Z55	20180109	1530	1700	67318	Jeremy Bowers
90081	20180109	1600	1700	16371	Annabel Miller*/

SELECT transcript
FROM interview 
WHERE person_id=67318;

/* I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67").
 She has red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 
 3 times in December 2017*/
 
SELECT p.name, p.id,l.id AS licence, p.ssn, i.annual_income
FROM drivers_license l
LEFT JOIN person p
ON l.id=p.license_id
LEFT JOIN income i
ON p.ssn=i.ssn
WHERE 
	l.hair_color = 'red'
	AND l.gender = 'female'
	AND l.car_make = 'Tesla'
    AND l.height BETWEEN 65 AND 67;; 
    
/*
name				id		licence		ssn			annual_income
Miranda Priestly	99716	202298		987756388	310000
Regina George		90700	291182		337169072	null
Red Korb			78881	918773		961388910	278000

 S*/

SELECT * 
FROM facebook_event_checkin
WHERE person_id=99716;

/*
person_id	event_id	event_name				date
99716		1143		SQL Symphony Concert	20171206
99716		1143		SQL Symphony Concert	20171212
99716		1143		SQL Symphony Concert	20171229
*/

INSERT INTO solution VALUES (1, 'Miranda Priestly');
        
        SELECT value FROM solution;
/*Congrats, you found the brains behind the murder! 
Everyone in SQL City hails you as the greatest SQL detective of all time. 
Time to break out the champagne!*/
