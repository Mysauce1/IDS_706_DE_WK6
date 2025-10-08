# IDS_706_DE_WK6: Introduction to Databases

## Project Overview
This project is dedicated to running queries on a table using SQLite. The data used for this project comes from the university_rankings table, which is stored in the university_database database. This table includes information from 2012-2015 about universities around the world, such as the country they are located in and their ranking against other institutions. We will start with CRUD (Create, Read, Update, Delete) queries, then perform some analysis on the data.

## Required Files

### university_database.db
Contains the data for the project, and can be found in the "data" folder.

### CRUD_queries.sql
Contains the CRUD queries for the project, and can be found in the "scripts" folder.

### analysis_queries.sql
Contains the queries for the analysis, and can be found in the "scripts" folder. The analysis queries are placed in a separate file to 1) keep all of the queries organized and 2) avoid any unexpected changes from the CRUD queries. Since the CRUD queries change the structure of the table, we must be mindful when running these queries to avoid unexpected changes, such as adding a duplicate row. The analysis queries do not change the structure of the data, so it is safe to run them over and over again. With two .sql files, we have a file we have to use cautiously, and a file we can use with less caution.

## Bonus Files
### university_database_updated.db
Contains the data after the CRUD queries were performed, and can be found in the "data" folder.

## Setup Instructions
The following instructions assume you have SQLite and Visual Studio Code (VS Code) installed. If you do not have SQLite and Visual Studio Code installed, use the following links:
- SQLite: https://sqlite.org/download.html
- Visual Studio Code: https://code.visualstudio.com/download

### 1. Check for required files
These are the files included in the "Required Files" section, and can be found within the repository.

### 2. Clone the repository into VS Code
1. In the repository, click on "Code" (green button near the top-right side of the repository)
2. Copy the URL for the repository
3. Open VS Code
4. Open a new terminal
5. Create a folder called 'intro_to_databases' by running:
```
mkdir intro_to_databases
```
in the terminal
6. Enter the folder by running:
```
cd intro_to_databases
```
in the terminal
7. Clone the repository in this folder by running:
```
git clone https://github.com/Mysauce1/IDS_706_DE_WK6.git .
```
in the terminal. This will clone the repository directly into the folder, as opposed to create a subfolder inside of this folder.

### 3. Open SQLite
In the terminal, run:
```
sqlite3 data/university_database.db
```
to open the SQLite CLI
Your screen should look like this:
<img width="688" height="178" alt="Screenshot 2025-10-07 223334" src="https://github.com/user-attachments/assets/ddeacb36-a8cc-40e3-a26e-1fea6ce22b72" />


### 4. Ensure Proper Output Formatting
In the CLI, run:
```
.headers on
.mode column
```
to ensure the output is aligned based on the columns and has the column names at the top.

Now, everything is set up for querying.

## CRUD Queries
Open the CRUD_queries.sql file to find the CRUD queries.

### 1. Create data in the table
Copy the following query from CRUD_queries and run it in the SQLite CLI:
```
INSERT INTO university_rankings (institution,country,world_rank,score,year)
VALUES ('Duke Tech','USA',350,60.5,2014);
```

This query adds a row to the table with information about Duke Tech. This row only includes information in the following columns: institution ('Duke Tech'), country ('USA'), world_rank (350), score (60.5), and year (2014). The other columns are left blank. 

### 2. Read data from the table
Copy the following query from CRUD_queries and run it in the SQLite CLI:
```
SELECT COUNT(*) AS num_top_japanese_universities_2013 
FROM university_rankings
WHERE (country = 'Japan') AND (year = 2013) AND (world_rank <= 200);
```
This query looks into the university_rankings table, identifies which rows have universities located in Japan and ranked within the top 200 universities in the world in 2013, and returns the number of universities that meet the criteria under the column num_top_japanese_universities_2013. There should be 6 universities returned.

### 3. Update data in the table
Copy the following query from CRUD_queries and run it in the SQLite CLI:
```
UPDATE university_rankings 
SET score = score + 1.2 
WHERE (institution = 'University of Oxford') AND (year = 2014);
```
This query locates the row in university_rankings that represents the University of Oxford in 2014, and changes the score in that row to a value that is 1.2 greater than the original score. Since the original score was 97.51, the new score that will replace the original score is 98.71.

### 4. Delete data in the table
Copy the following query from CRUD_queries and run it in the SQLite CLI:
```
DELETE FROM university_rankings 
WHERE (year = 2015) AND (score < 45);
```
This query removes any rows of universities with a score lower than 45 in 2015. Any attempts to query rows with this information will not return anything because it no longer exists in the table.

## Analysis Queries
In the SQLite CLI, run:
```
.read scripts/analysis_queries.sql
```
This will read the analysis_queries.sql file and return the outputs of the queries. There should be two outputs:

### 1. Number of Countries in the table
The first output was produced by the following query:
```
SELECT COUNT(DISTINCT(country)) AS number_of_countries
FROM university_rankings;
```
This query counts the number of unique countries that are present in the table, and returns the total under the column number_of_countries.

The output for this query is shown below:

<img width="336" height="100" alt="Screenshot 2025-10-07 221653" src="https://github.com/user-attachments/assets/9c87bf54-4f90-4002-aafc-fd493716e1a5" />

Based on this output, the university_rankings table includes universities from 59 different countries.

### 2. Average score in 2015 by country
The second output was produced by the following query:
```
SELECT country, AVG(score) AS avg_score
FROM university_rankings
WHERE year = 2015
GROUP BY country
ORDER BY AVG(score) DESC;
```
This query returns takes the average of the scores in each country in 2015. It returns the countries and their average score (under the column avg_score) in descending order to show which country has the highest average score first.

The output for this query is shown below:

<img width="547" height="1293" alt="Screenshot 2025-10-07 221731" src="https://github.com/user-attachments/assets/cde59d06-8546-470f-8467-072ba508a2b8" />


Based on this output, Israel has the highest average score, and the USA does not trail too far behind with the second highest average score. Meanwhile countries like Chile and Argentina have lower average scores. This indicates that countries like Israel and the USA have well-performing institutions (based on what is being measured in the score), while universities in countries like Chile and Argentina do not perform as well. Since Chile and Argentina are a part of the global South, they might suffer from limited resources. This could potentially be a reason why their universities have lower.
