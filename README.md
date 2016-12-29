# holiday_advisor

I am working on this project to get some insights of genetic algorithm and  for some fun purpose
Anyone intersted to Collaborate please ping me .

Overview of project :
  Using genetic algorithms to help someone plan his upcoming holidays in a year . 
  Algorithm will be advising person to take leaves according to his preferences . 

Genetic algorithms work on theory of evolution .
  Few links may be helpful to understand - 
  http://www.ai-junkie.com/ga/intro/gat1.html
  https://en.wikipedia.org/wiki/Genetic_algorithm - wikipedia is always to rescue


You can go through the code to get the grasp of it , I have tried to make it really simple and readable.


Code briefing : 
  
 1. module Calendar :  Gets the list of holidays from an online resource and prepares the holiday template .

 2. class Chromosome : It represents a Chromosome and has the functions related to a chromosome , chromosome implies a potential solution , in our case person's recommended plan for the upcoming year . 

    functions  : [initialize_solution , cross_over , fitness_functions , calendar_rep , fitness_score ]


  3. class Generation : It represents an entire generation of chromosomes .

     functions : [initialize_generation , rate_generation , generate_new_generation , top_results , average_score ]

  4 . main_script : Added it to demonstrate the flow of algorithm .


Future plans : 

1. Instead of merely a github repo I am planning to host it online using rails and angular frameworks.

2. Will be adding more flexibilty for user , currently I am taking only number of desired inputs and have assumed holidays of a person to be fixed .i.e according to online resource ['https://www.timeanddate.com/holidays/india/2017']  .
Will allow user to alter the initial holidays and also enable him to add leaves which he has planned already .

3. Will be adding admin_functionality to add more fitness_functions and these will be triggered according to user preferences .


