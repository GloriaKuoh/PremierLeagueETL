# PremierLeagueETL
ETL Project

In this project, I analyze The Premier League Soccer players’ 2020-2021 salary and goals per season to determine which offensive players were overpaid. 
Note, each soccer team is made up of a combination of forwards, midfielders, defenders, and goalkeepers. This study only focuses on forwards, whose main task is scoring goals. Additionally, this study does not consider factors such as assists, dribbles, and defensive contributions among other metrics that would provide a more complete assessment of a player’s value and contribution.

Extraction

Two tables were extracted from the Premier League webpage for the 2020-2021 soccer season: player stats and player salaries.
I saved the data as csv files in resources as ‘plgoals’ and ‘plsalary’.
Using pandas, I selected only the needed columns and saved them as "PLGoals_clean.csv" and "PLSalary_clean.csv".
In PostgreSQL, I created a database ("postgres") and two tables "stats" and "salary". I imported the csv files into the tables/database.

![PLjoin](https://user-images.githubusercontent.com/89876905/131950333-3b48b613-7484-425d-a807-b69d75114ff0.PNG)

