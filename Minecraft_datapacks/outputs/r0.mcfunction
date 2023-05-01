#create the scoreboard to save the values in
scoreboard objectives add R_number dummy

#in disease code after the code tagging villagers exposed add:
"execute as @e[type=villager,tag=susceptible] at @s if entity @s[tag=exposed] run function (this function)
# to activate this function, so that on the next line the 'nearest' will be the nearest to the newly infected villager"

#adds one to the nearest villagers R Number, the number of people they have infected
execute as @e[type=villager,tag=infected,limit=1,sort=nearest] at @s run scoreboard players add @s R_number 1
