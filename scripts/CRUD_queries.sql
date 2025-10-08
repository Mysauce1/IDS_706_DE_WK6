
--INSERT INTO university_rankings (institution,country,world_rank,score,year)
--VALUES ('Duke Tech','USA',350,60.5,2014);


--SELECT COUNT(*) AS num_top_japanese_universities_2013 
--FROM university_rankings
--WHERE (country = 'Japan') AND (year = 2013) AND (world_rank <= 200);

--UPDATE university_rankings 
--SET score = score + 1.2 
--WHERE (institution = 'University of Oxford') AND (year = 2014);

DELETE FROM university_rankings 
WHERE (year = 2015) AND (score < 45);