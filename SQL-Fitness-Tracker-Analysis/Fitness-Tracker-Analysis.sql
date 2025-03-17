USE Practise;

SELECT * FROM [dbo].[fitness_db];

   -- Basic SQL Queries --

-- Retrieve all records from the Fitness Table. --

SELECT * FROM [dbo].[fitness_db];

   -- Fetch the unique activity types performed by participants. --

SELECT 
	DISTINCT activity_type 
from [dbo].[fitness_db];

   -- Display the total number of entries for each activity type. --

SELECT 
	activity_type, 
	COUNT(activity_type) total_entries FROM [dbo].[fitness_db]
GROUP BY activity_type;

   -- Find the average calories burned per activity type. --

SELECT 
	activity_type, 
	AVG(calories_burned) avg_cal FROM [dbo].[fitness_db]
GROUP BY activity_type;

   -- List all participants who have a BMI greater than 25. --

SELECT participant_id FROM [dbo].[fitness_db]
WHERE bmi > 25;

  -- Identify users who walked more than 10,000 steps in a dayIdentify users who walked more than 10,000 steps in a day --\

SELECT 
	participant_id, daily_steps 
FROM [dbo].[fitness_db]
WHERE daily_steps > 10000;



  -- Find the total calories burned per month. -- 

SELECT 
	FORMAT(Date, 'MMMM') as Month, SUM(calories_burned) as total_calories 
FROM [dbo].[fitness_db]
GROUP BY FORMAT(Date, 'MMMM')
ORDER BY Month;

  --  Calculate the total duration spent on each activity type.  -- 

SELECT
	activity_type,SUM(duration_minutes) as total_minutes 
FROM [dbo].[fitness_db]
GROUP BY activity_type;


  -- Find the average heart rate for each intensity level. -- 

SELECT 
	 intensity
	,AVG(avg_heart_rate) as avg_heartrate 
FROM [dbo].[fitness_db]
GROUP  BY intensity;

  -- Determine the maximum, minimum, and average calories burned for each participant. -- 
SELECT 
	participant_id, 
	ROUND(MIN(calories_burned), 2) as min_calories,
	ROUND(MAX(calories_burned), 2) as max_calories,
	ROUND(AVG(calories_burned),2) as avg_calories
FROM [dbo].[fitness_db]
GROUP BY participant_id;


  -- Show the total daily steps taken per day.   -- 

SELECT
	Date,
	SUM(daily_steps) as total_steps
FROM [dbo].[fitness_db]
GROUP BY date;

  -- Find the number of activities each participant performed in a given month.  -- 

SELECT 
	participant_id,
	FORMAT(Date,'MMMM') as monthh,
	COUNT(age) as total_activity
FROM [dbo].[fitness_db]
GROUP BY participant_id,FORMAT(Date,'MMMM')
ORDER BY participant_id ASC;

  -- Retrieve records where participants burned more than 10 calories in a session.  --

SELECT * FROM [dbo].[fitness_db]
WHERE calories_burned > 10;


  -- Find participants who have an average heart rate above 120.  --
  
SELECT 
	participant_id,
	AVG(avg_heart_rate) avg_heartrate
FROM [dbo].[fitness_db]
GROUP BY participant_id
HAVING AVG(avg_heart_rate) >120;

  -- Identify participants who exercised for more than 60 minutes in a session. --

SELECT 
	participant_id,
	duration_minutes
FROM [dbo].[fitness_db]
WHERE duration_minutes > 60;

  -- Find all records where participants slept for less than 6 hours and had a stress level above 5.   -- 

SELECT 
	participant_id
FROM [dbo].[fitness_db]
WHERE hours_sleep < 6 AND stress_level > 5
GROUP BY participant_id;

  -- Show participants whose hydration level is below 2.0 liters.  --
  
SELECT
participant_id,
hydration_level
FROM [dbo].[fitness_db]
WHERE hydration_level < 2


-- Find the percentage of low, medium, and high-intensity workouts. --

-- Most Active Participants (based on total duration of activities) --
SELECT 
    participant_id, 
    SUM(duration_minutes) AS total_activity_minutes
FROM [dbo].[fitness_db]
GROUP BY participant_id
ORDER BY total_activity_minutes DESC;



-- Least Active Participants -- 
SELECT 
    participant_id, 
    SUM(duration_minutes) AS total_activity_minutes
FROM [dbo].[fitness_db]
GROUP BY participant_id
HAVING SUM(duration_minutes) <15000
ORDER BY total_activity_minutes ASC;

 -- Activity Trends by Age Group -- 

SELECT 
    CASE 
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 50 THEN '36-50'
        ELSE '50+' 
    END AS age_group, 
    COUNT(*) AS activity_count
FROM [dbo].[fitness_db]
GROUP BY 
    CASE 
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 50 THEN '36-50'
        ELSE '50+' 
    END
ORDER BY activity_count DESC;


