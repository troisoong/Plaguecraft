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
#set up sign to display values
execute if block ~-2 ~ ~ lever[powered=true] run data merge block ~-1 ~ ~ {Text1:'[{"text":"Susceptible:"},{"score":{"objective":"Outputs","name":"susceptible"}}]'}
execute if block ~-2 ~ ~ lever[powered=true] run data merge block ~-1 ~ ~ {Text2:'[{"text":"Exposed:"},{"score":{"objective":"Outputs","name":"exposed"}}]'}
execute if block ~-2 ~ ~ lever[powered=true] run data merge block ~-1 ~ ~ {Text3:'[{"text":"Infected:"},{"score":{"objective":"Outputs","name":"infectious"}}]'}
execute if block ~-2 ~ ~ lever[powered=true] run data merge block ~-1 ~ ~ {Text4:'[{"text":"Recovered:"},{"score":{"objective":"Outputs","name":"recovered"}}]'}
execute if block ~-2 ~ ~ lever[powered=false] if block ~ ~1 ~ wall_torch run setblock ~-1 ~ ~ air
setblock ~-1 ~ ~ crimson_sign[rotation=4]{Color:"yellow",Text1:'{"text":"Population Data"}'}
execute if block ~-2 ~ ~ lever[powered=false] run setblock ~ ~1 ~ soul_wall_torch[facing=west]