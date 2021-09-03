SELECT      plgoals.player, goals, avgvalue, position 
FROM        plgoals 
RIGHT JOIN  plsalary 
ON          plgoals.player = plsalary.player 
ORDER BY    Goals DESC;


SELECT      plgoals.player, goals, avgvalue, position, (avgvalue/goals) AS CostPerGoal 
FROM        plgoals 
RIGHT JOIN  plsalary 
ON          plgoals.player = plsalary.player 
WHERE       plsalary.position = 'Forward' 
AND         plgoals.goals <> 0 ORDER BY CostPerGoal DESC;
