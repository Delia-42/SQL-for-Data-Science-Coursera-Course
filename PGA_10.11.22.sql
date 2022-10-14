Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:
	
i. Attribute table = 10000  

SELECT Count(*) Total_Attribute_Records 
  FROM attribute

ii. Business table = 10000

Select Count(*) Total_Business_Records
  FROM Business
  
  
iii. Category table = 10000

SELECT Count(*) Total_Category_Records
  FROM Category
  
iv. Checkin table = 10000

SELECT Count(*) Total_Checkin_Records
  FROM checkin
  
  
v. elite_years table = 10000

SELECT Count(*) Total_EliteYears_Records
  FROM elite_years
  
vi. friend table = 10000

SELECT Count(*) Total_Friend_Records
  FROM friend
  
vii. hours table = 10000

SELECT Count(*) Total_Hours_Records
  FROM hours
  
viii. photo table = 10000

SELECT Count(*) Total_Photo_Records
  FROM photo
  
ix. review table = 10000

SELECT Count(*) Total_Review_Records
  FROM review
  
x. tip table = 10000

SELECT Count(*) Total_Tip_Records
  FROM tip
  
  
xi. user table = 10000

SELECT Count(*) Total_User_Records
  FROM user
	


2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

i. Business = 10000

SELECT COUNT(DISTINCT id) Total_Distinct_Records
  FROM business
  
ii. Hours = 1562

SELECT COUNT(DISTINCT business_id) Total_Distinct_Records
  FROM hours
  
iii. Category = 2643

SELECT COUNT(DISTINCT business_id) Total_Distinct_Records
  FROM category
  
iv. Attribute = 1115

SELECT COUNT(DISTINCT business_id) Total_Distinct_Records
  FROM attribute
  
v. Review = 9581

SELECT COUNT(DISTINCT user_id) Total_Distinct_Records
  FROM review

vi. Checkin = 493

SELECT COUNT(DISTINCT business_id) Total_Distinct_Records
  FROM checkin
  
vii. Photo =6493

SELECT COUNT(DISTINCT business_id) Total_Distinct_Records
  FROM photo
  
viii. Tip = 537

SELECT COUNT(DISTINCT user_id) Total_Distinct_Records
  FROM tip
  
ix. User = 10000

SELECT COUNT(DISTINCT id) Total_Distinct_Records
  FROM user
  
x. Friend = 9415

SELECT COUNT(DISTINCT friend_id) Total_Distinct_Records
  FROM friend
  
xi. Elite_years = 2780

SELECT COUNT(DISTINCT user_id) Total_Distinct_Records
  FROM elite_years

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	



3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: No
	
	
	SQL code used to arrive at answer:
	SELECT *
      FROM user
     WHERE coalesce(id, name, review_count, yelping_since, useful, funny, cool, fans, average_stars, compliment_hot, compliment_more, compliment_profile, compliment_cute, compliment_list, compliment_note, compliment_plain, compliment_cool, compliment_funny, compliment_writer, compliment_photos) IS NULL
	

	
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	i. Table: Review, Column: Stars
	
		min: 1		max: 5		avg: 4.0 (Rounded)
		
	SELECT MIN(Stars) Minimum_Stars
      FROM review
	  
	SELECT MAX(Stars) Maximum_Stars
      FROM review

	SELECT ROUND(AVG(Stars)) Average_Stars
      FROM review	
	  
	  
	ii. Table: Business, Column: Stars
	
		min: 1		max: 5		avg: 4.0 (Rounded)
	
    SELECT MIN(Stars) Minimum_Stars
      FROM business
	
	SELECT MAX(Stars) Maximum_Stars
      FROM business
	
	SELECT ROUND(AVG(Stars)) Average_Stars
      FROM business
	  
	iii. Table: Tip, Column: Likes
	
		min: 0		max: 2		avg: .0144 --> Rounded = 0.0
		
	SELECT MIN(likes) Minimum_Likes
      FROM tip
	  
	SELECT MAX(likes) Maximum_Likes
      FROM tip
	  
	SELECT AVG(likes) Average_Likes
      FROM tip
	  
	iv. Table: Checkin, Column: Count
	
		min: 1		max: 53		avg: 2.0 (Rounded)

    SELECT MIN(count) Minimum_Count
      FROM checkin
	
	SELECT MAX(count) Maximum_Count
      FROM checkin

	SELECT ROUND(AVG(count)) Average_Count
      FROM checkin
	  
	v. Table: User, Column: Review_count
	
		min: 0		max: 2000		avg: 24.29995
		
    SELECT MIN(review_count) Minimum_review_count
      FROM user
	  
    SELECT MAX(review_count) Maximum_review_count
      FROM user
	  
	SELECT AVG(review_count) Average_review_count
      FROM user

5. List the cities with the most reviews in descending order:
	
	Top 5 Cities with the most reviews
	
	| Las Vegas 
    | Phoenix    
    | Toronto  
    | Scottsdale 
    | Charlotte

	SQL code used to arrive at answer:
	
	SELECT DISTINCT city, count(review_count)
      FROM business
     GROUP BY city
     ORDER BY count(review_count) DESC
     LIMIT 5
	
	Copy and Paste the Result Below:
	
    | Las Vegas  |                1561 |
    | Phoenix    |                1001 |
    | Toronto    |                 985 |
    | Scottsdale |                 497 |
    | Charlotte  |                 468 |

	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer: 

SELECT stars, COUNT(stars) Distribution_of_star_ratings
  FROM business
 WHERE city = 'Avon'
 GROUP BY stars

Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):

 +-------+------------------------------+
| stars | Distribution_of_star_ratings |
+-------+------------------------------+
|   1.5 |                            1 |
|   2.5 |                            2 |
|   3.5 |                            3 |
|   4.0 |                            2 |
|   4.5 |                            1 |
|   5.0 |                            1 |
+-------+------------------------------+


ii. Beachwood

SQL code used to arrive at answer:

SELECT stars, COUNT(stars) Distribution_of_star_ratings
  FROM business
 WHERE city = 'Beachwood'
 GROUP BY stars

Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):

+-------+------------------------------+
| stars | Distribution_of_star_ratings |
+-------+------------------------------+
|   2.0 |                            1 |
|   2.5 |                            1 |
|   3.0 |                            2 |
|   3.5 |                            2 |
|   4.0 |                            1 |
|   4.5 |                            2 |
|   5.0 |                            5 |
+-------+------------------------------+		


7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:
	SELECT name, review_count
      FROM user
     ORDER BY review_count DESC
     LIMIT 3
		
	Copy and Paste the Result Below:
	
+--------+--------------+
| name   | review_count |
+--------+--------------+
| Gerald |         2000 |
| Sara   |         1629 |
| Yuri   |         1339 |
+--------+--------------+


8. Does posing more reviews correlate with more fans? No

	Please explain your findings and interpretation of the results:
	
	Well, Eric has a review count of 1,116, but only has 16 fans.  However,Christine has a review count of 930, and has 173 fans.  

SELECT name, review_count, fans
  FROM user
 ORDER BY review_count DESC, fans 
 LIMIT 10
+-----------+--------------+------+
| name      | review_count | fans |
+-----------+--------------+------+
| Gerald    |         2000 |  253 |
| Sara      |         1629 |   50 |
| Yuri      |         1339 |   76 |
| .Hon      |         1246 |  101 |
| William   |         1215 |  126 |
| Harald    |         1153 |  311 |
| eric      |         1116 |   16 |
| Roanna    |         1039 |  104 |
| Mimi      |          968 |  497 |
| Christine |          930 |  173 |
+-----------+--------------+------+
	
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer:  There are more reviews with the word 'love'

	
	SQL code used to arrive at answer:
	
SELECT *
  FROM review
 WHERE text LIKE 'love%'
--------------------------------- 
SELECT *
  FROM review
 WHERE text LIKE 'hate%'
	
	
10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:
	
SELECT name, fans
  FROM 
    (SELECT name, review_count, fans
       FROM user
      ORDER BY review_count DESC
      LIMIT 10)
ORDER BY fans DESC
	
	Copy and Paste the Result Below:

+-----------+------+
| name      | fans |
+-----------+------+
| Mimi      |  497 |
| Harald    |  311 |
| Gerald    |  253 |
| Christine |  173 |
| William   |  126 |
| Roanna    |  104 |
| .Hon      |  101 |
| Yuri      |   76 |
| Sara      |   50 |
| eric      |   16 |
+-----------+------+	
		

Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
	Category: Food
	    City: Toronto
		

i. Do the two groups you chose to analyze have a different distribution of hours? Yes

SELECT name, city, stars, hours
  FROM business
  JOIN category
    ON business.id = category.business_id
  JOIN hours
    ON hours.business_id = business.id
 WHERE city = 'Toronto' AND category = 'Food'
 GROUP BY stars

+--------------+---------+-------+----------------------+
| name         | city    | stars | hours                |
+--------------+---------+-------+----------------------+
| Loblaws      | Toronto |   2.5 | Saturday|8:00-22:00  |
| Halo Brewery | Toronto |   4.0 | Saturday|11:00-21:00 |
| Cabin Fever  | Toronto |   4.5 | Saturday|16:00-2:00  |
+--------------+---------+-------+----------------------+

ii. Do the two groups you chose to analyze have a different number of reviews? Yes
SELECT name, city, stars, review_count
  FROM business
  JOIN category
    ON business.id = category.business_id
  JOIN hours
    ON hours.business_id = business.id
 WHERE city = 'Toronto' AND category = 'Food'
 GROUP BY stars

         
+--------------+---------+-------+--------------+
| name         | city    | stars | review_count |
+--------------+---------+-------+--------------+
| Loblaws      | Toronto |   2.5 |           10 |
| Halo Brewery | Toronto |   4.0 |           15 |
| Cabin Fever  | Toronto |   4.5 |           26 |
+--------------+---------+-------+--------------+        
iii. Are you able to infer anything from the location data provided between these two groups? Explain.

SQL code used for analysis:  Well, it seems that Cabin Fever is a hot spot for Food seeing how there are more reviews and a higher overall rating.
SELECT name, city, stars, review_count
  FROM business
  JOIN category
    ON business.id = category.business_id
  JOIN hours
    ON hours.business_id = business.id
 WHERE city = 'Toronto' AND category = 'Food'
 GROUP BY stars
 
		
		
2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
i. Difference 1:
There are 8,480 open stores,while there are 1,520 closed stores.
 
 SELECT name, is_open
   FROM business
  WHERE is_open = 1
---------------------------------------------------------
 SELECT name, is_open
   FROM business
  WHERE is_open = 0        
         
ii. Difference 2:
 There are more restaurant businesses open than any other businesses.  There are more closed restaurant businesses than any other businesses.        
 
 SELECT category, COUNT(is_open)
   FROM business
   JOIN category
     ON category.business_id = business.id
  WHERE is_open = 1
  GROUP BY category
  ORDER BY COUNT(is_open) DESC      

---------------------------------------------  
  SELECT category, COUNT(is_open)
   FROM business
   JOIN category
     ON category.business_id = business.id
  WHERE is_open = 0
  GROUP BY category
  ORDER BY COUNT(is_open) DESC           
SQL code used for analysis:

	
	
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do:

Which is the top rated business for Coffee & Tea, and what are the hours?  I will also be taking into account the number of reviews.


         
ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:

I will need to use the Yelp database.  Specifically, the hours table, the category table, and the business table.
                           
                  
iii. Output of your finished dataset:

Summary:
   +-------------+-------------------+------------+-------------------+
| name        | MAX(review_count) | AVG(stars) | hours             |
+-------------+-------------------+------------+-------------------+
| Koko Bakery |               162 |        4.0 | Monday|9:00-20:00 |
| Starbucks   |                52 |        3.0 | Monday|5:00-20:00 |
| Cabin Fever |                26 |        4.5 | Monday|16:00-2:00 |
+-------------+-------------------+------------+-------------------+      
 
More detailed information with all hours M-F:
+-------------+-------------------+------------+----------------------+
| name        | MAX(review_count) | AVG(stars) | hours                |
+-------------+-------------------+------------+----------------------+
| Koko Bakery |               162 |        4.0 | Friday|9:00-20:00    |
| Koko Bakery |               162 |        4.0 | Monday|9:00-20:00    |
| Koko Bakery |               162 |        4.0 | Saturday|9:00-20:00  |
| Koko Bakery |               162 |        4.0 | Sunday|9:00-20:00    |
| Koko Bakery |               162 |        4.0 | Thursday|9:00-20:00  |
| Koko Bakery |               162 |        4.0 | Wednesday|9:00-20:00 |
| Starbucks   |                52 |        3.0 | Friday|5:00-20:00    |
| Starbucks   |                52 |        3.0 | Monday|5:00-20:00    |
| Starbucks   |                52 |        3.0 | Saturday|5:00-20:00  |
| Starbucks   |                52 |        3.0 | Sunday|5:00-20:00    |
| Starbucks   |                52 |        3.0 | Thursday|5:00-20:30  |
| Starbucks   |                52 |        3.0 | Tuesday|5:00-20:00   |
| Starbucks   |                52 |        3.0 | Wednesday|5:00-20:00 |
| Cabin Fever |                26 |        4.5 | Friday|18:00-2:00    |
| Cabin Fever |                26 |        4.5 | Monday|16:00-2:00    |
| Cabin Fever |                26 |        4.5 | Saturday|16:00-2:00  |
| Cabin Fever |                26 |        4.5 | Sunday|16:00-2:00    |
| Cabin Fever |                26 |        4.5 | Thursday|18:00-2:00  |
| Cabin Fever |                26 |        4.5 | Tuesday|18:00-2:00   |
| Cabin Fever |                26 |        4.5 | Wednesday|18:00-2:00 |
+-------------+-------------------+------------+----------------------+ 
iv. Provide the SQL code you used to create your final dataset:

SELECT name, MAX(review_count), AVG(stars), hours
  FROM business
  JOIN hours
    ON business.id = hours.business_id
  JOIN category
    ON category.business_id = business.id
 WHERE category = 'Coffee & Tea'
 GROUP BY name
 ORDER BY MAX(review_count) DESC
 LIMIT 10
 
 -----------------------------------------------
 SELECT name, MAX(review_count), AVG(stars), hours
  FROM business
  JOIN hours
    ON business.id = hours.business_id
  JOIN category
    ON category.business_id = business.id
 WHERE category = 'Coffee & Tea'
 GROUP BY hours
 ORDER BY MAX(review_count) DESC
 LIMIT 25