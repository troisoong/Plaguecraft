#This code counts the number of individuals currently at each stage of the infection using scoreboards. 
#This information can then be displayed on signposts or on player screens

#population count
scoreboard players set population_dummy Outputs 0
execute as @e[type=villager,tag=adult] at @s run scoreboard players add population_dummy Outputs 1
scoreboard players operation population Outputs = population_dummy Outputs

#susceptible count
scoreboard players set susceptible_dummy Outputs 0
execute as @e[type=villager,tag=susceptible] at @s run scoreboard players add susceptible_dummy Outputs 1
scoreboard players operation susceptible Outputs = susceptible_dummy Outputs

#exposed count
scoreboard players set exposed_dummy Outputs 0
execute as @e[type=villager,tag=exposed] at @s run scoreboard players add exposed_dummy Outputs 1
execute as @e[type=villager,tag=bad_luck] at @s run scoreboard players add exposed_dummy Outputs 1
scoreboard players operation exposed Outputs = exposed_dummy Outputs

#infected count
scoreboard players set infectious_dummy Outputs 0
execute as @e[type=villager,tag=infected] at @s run scoreboard players add infectious_dummy Outputs 1
scoreboard players operation infectious Outputs = infectious_dummy Outputs

#recovered count
scoreboard players set recovered_dummy Outputs 0
execute as @e[type=villager,tag=immune] at @s run scoreboard players add recovered_dummy Outputs 1
scoreboard players operation recovered Outputs = recovered_dummy Outputs
