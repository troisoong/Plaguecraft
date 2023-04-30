scoreboard objectives add R_number dummy
execute as @e[type=villager,tag=infected,limit=1,sort=nearest] at @s run scoreboard players add @s R_number 1