CREATE DATABASE IronDB;
USE IronDB;
CREATE TABLE Students (
StudentID int,
 Name varchar(255), 
 CourseID int
 );
 CREATE TABLE Teachers(
 TeacherID int,
 Name varchar(255),
 Surname varchar(255)
 );
 CREATE TABLE Course(
 CourseID int,
 Title varchar(255),
 Form  varchar(255),
 TeacherID int,
 ); 
 ALTER TABLE Course
MODIFY TeacherID INT;
INSERT INTO Course(CourseID,Title,Form,TeacherID)
VALUES (111, "DA", "Fulltime",1),
(112, "WEB", "Partime", 2),
(113, "UIUX", "Fulltime", 3);

UPDATE Course
SET Form = "Fulltime"
WHERE CourseID = 112;

INSERT INTO Course(CourseID,Title,Form,TeacherID)
VALUES (114, "DA", "Partime",1),
(115, "WEB", "Partime", 2),
(116, "UIUX", "Partime", 3);

SELECT * FROM Course;
SELECT Title, Form FROM Course
WHERE Title="DA";

SELECT Title, TeacherID FROM Course
WHERE Form="Fulltime"
Order by title desc;

Select Title, count(Title) FROM Course
group by Title;

USE Task_M1_W1_D1;
SELECT prime_genre, count(id_1) From TasK_M1_W1_D1.applestore
group by prime_genre
order by count(id_1) DESC;

Select prime_genre from applestore
group by prime_genre;

create database Apple;
create table Apple.a as select * from TasK_M1_W1_D1.applestore;

select prime_genre, sum(rating_count_tot) as total_ratings
From apple.a
group by prime_genre 
order by total_ratings desc limit 10;

select prime_genre, count(id_1) as total_apps
From apple.a
group by prime_genre 
order by total_apps;

select track_name, rating_count_tot
from apple.a
order by rating_count_tot desc;

select track_name, user_rating
from apple.a
order by user_rating desc limit 10;

select prime_genre, sum(rating_count_tot) as total_ratings
From apple.a
group by prime_genre 
order by total_ratings desc limit 10;

select track_name, rating_count_tot, user_rating
from apple.a
order by rating_count_tot desc, user_rating desc limit 3;

select track_name, rating_count_tot, user_rating, price
from apple.a
order by price desc;

select track_name, rating_count_tot, user_rating, price
from apple.a
order by user_rating desc;

Select avg(price),user_rating
From apple.a
group by user_rating
order by user_rating desc;
