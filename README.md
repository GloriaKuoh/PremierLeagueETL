# PremierLeagueETL
ETL Project

In this project, I analyzed the Premier League Soccer players’ 2020-2021 salary and goals per season to determine which offensive players ('forwards') were overpaid.

Note, each soccer team is made up of a combination of forwards, midfielders, defenders, and keepers. This study only focuses on forwards, whose main task is scoring goals. Additionally, this study does not consider factors such as total playing time, assists, dribbles, and defensive contributions, among other metrics that would provide a more complete assessment of a player’s value and overall contribution to the team.

Extraction

Two tables were extracted from the Premier League webpage for the 2020-2021 soccer season to obtain players' goals stats and players' salaries.

I saved the data as csv files in resources as 'PLGoalsWeb' and 'PLSalaryWeb.'
![WebStats](https://user-images.githubusercontent.com/89876905/132050317-1b9198d5-897c-4018-8c47-a384bf50c2c5.PNG)

Transformation

I noticed that there were differences in players' names spelling within the two tables. Given the small sample size, I manually normalized the names across both files. Additionally, I removed the currency symbols from the 'PLSalaryWeb'file for ease of use; and added a column called 'position'to the same. I also deleted data related to penalties from the 'PLGoalsWeb' file's 'Goals' column. Lastly, I selected and saved needed and formatted columns as "PLGoals.csv" and "PLSalary.csv."
![CleanStats](https://user-images.githubusercontent.com/89876905/132050443-2a12769b-bb50-4b16-a721-5a6952d7398f.PNG)

Load

In PostgreSQL, I created a database ("postgres") and two tables, "plgoals" and "plsalary." I imported the formatted csv files into the tables/database.
![SQLPlgoals](https://user-images.githubusercontent.com/89876905/132050599-09114b82-32e5-48ac-a369-178367bdba70.PNG)
![SQLPlsalary](https://user-images.githubusercontent.com/89876905/132050609-c02b0768-f05d-4504-8f13-d930a27c39a9.PNG)

Analysis

For analysis and data visualization purposes, I utilized Pandas to import SQL queries from PostgreSQL PGadmin.

I. Position of the League's Highest Paid Player

Prior to determining the cost efficiency of forwards, which is the focus of this project, I was interested in finding out the position of the highest paid player in the league. Such an analysis would confirm the assumption that a forward is usually the highest paid player in the league by virtue of his main task which is to score goals.

Firstly, I joined the 'plgoals' and 'plsalary' tables. The merged tables would reflect the columns needed to define the main variable ('costpergoal').
![AnalysisFirst](https://user-images.githubusercontent.com/89876905/132050774-28adfca7-05e8-468c-b5ca-94ba036342ad.PNG)

Secondly, I filtered the data to obtain top highest paid player per position, as displayed below.
![AnalysisSecond](https://user-images.githubusercontent.com/89876905/132050829-ff1aab39-8976-472a-a259-ec604b9059d0.PNG)

Lastly, I created a bar chart that compares the highest paid players per position, including forwards, midfielders, defenders, and keepers. The bar chart reflected the filtered result and confirmed the assumption by illustrating that Gareth Bale, a forward, is indeed the league's highest paid player.

![AnalysisThird](https://user-images.githubusercontent.com/89876905/132050890-a1c40fc8-a43c-4a50-a7ed-58932903ebee.PNG)

II. Top Ten Least Cost-Efficient Forwards

To determine the top ten least cost-efficient offensive players in the league, I joined the 'plgoals' and 'plsalary' tables. The merged table included the following columns: player, goals, avgvalue, position. I created an additional column ('costpergoal') by dividing the player's annual salary ('avgvalue') by the total numbers of goals scored during the season ('goals'). Thereafter, I filtered the table to only obtain results relevant to forwards ('position'). To ensure the top ten least cost-efficient forwards were displayed first, I ordered the data by position (i.e., to display forwards only) and by total number of goals not equal to O. Any division by 0 is undefined and would result in an error in PostgreSQL.
![AnalysisFourth](https://user-images.githubusercontent.com/89876905/132050982-c32fa48e-bb38-4515-81e7-9f8981b4d656.PNG)

As displayed above, the initially displayed top ten players appeared on duplicate rows in some cases. Additionally, some well-know and historically strongly performing forwards appeared to have a small number of total goals. Both cases were results of players being traded from or to another league during the season. To account for such discrepancies, only the first instance of each player was kept, and other duplicate rows were dropped. The first instance was sufficient for the analysis because salary data remained constant across duplicate instances. Likewise, the query was filtered to only apply to forwards who had scored more than one goal during the season.
![AnalysisFifth](https://user-images.githubusercontent.com/89876905/132051073-68db89c9-9fc2-4c03-aa95-1daeb1040f75.PNG)

Per the chart below, the top ten overpaid offensive players ('forwards') in the 2020-2021 Premier League season were: Darren Bent, Anthony Martial, Callum Hudson-Odoi, Gareth Bale, Timo Werner, Gabriel Martinelli, Christian Pulisic, Raheem Sterling, Saido Berahino, and Edinson Cavani. These ten players are overpaid because their performance (i.e., goal scoring stats) does not justify the annual salary they receive.

Furthermore, when compared to the chart outlining the highest paid player per position, the chart displaying the top ten forwards by cost per goal provides an interesting finding. Gareth Bale who is the league's most expensive player is not the least cost-efficient forward. Although his performance does not justify his annual salary, he still performs better than three well-known and expensive forwards.
![AnalysisSixth](https://user-images.githubusercontent.com/89876905/132051194-035f5c2d-94ba-466e-9749-19b59e007688.PNG)

Conclusion

This project primarily sought to determine which offensive players ('forwards') were overpaid in the Premier League 2020-2021 season. Accordingly, the project provided results of the top ten least cost-efficient forward in the league.
