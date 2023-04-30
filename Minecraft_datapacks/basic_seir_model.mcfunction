#infect if a villager gets in range of an infectious individual or object/place
#both models
tag @e[type=villager,tag=patient_zero] add exposed
execute as @e[type=villager,tag=susceptible] at @s if entity @e[type=villager,tag=infectious,distance=..2] if predicate infect:exposure_chance run tag @s add exposed
execute as @e[type=villager,tag=susceptible] at @s if entity @e[type=armor_stand,tag=contaminated,distance=..2] if predicate infect:exposure_chance run tag @s add exposed
#just deterministic model
execute as @e[type=villager,tag=!stochastic,tag=susceptible] at @s if entity @s[tag=exposed] run effect give @s minecraft:mining_fatigue 10 0 true
#both models
tag @e[type=villager,tag=exposed] remove patient_zero
tag @e[type=villager,tag=exposed] remove susceptible
execute as @e[type=villager,tag=exposed,nbt={VillagerData: {type:"minecraft:plains"}}] run data modify entity @s VillagerData.type set value savanna
#after on average 60 seconds change villagers to infectious
#deterministic model
tag @e[type=villager,tag=!stochastic,tag=exposed,nbt=!{ActiveEffects:[{Id:4b}]}] add infectious
execute as @e[type=villager,tag=!stochastic,tag=exposed] at @s if entity @s[tag=infectious] run effect give @s minecraft:mining_fatigue 10 0 true
#stochastic model
execute as @e[type=villager,tag=!deterministic,tag=exposed] at @s if predicate infect:infection_chance run tag @s add infectious
#both models 
tag @e[type=villager,tag=infectious] remove exposed
execute as @e[type=villager,tag=infectious,nbt={VillagerData: {type:"minecraft:savanna"}}] run data modify entity @s VillagerData.type set value swamp
#give chance of dying from disease, set by predicate (chance of dying = death rate x recovery rate)
execute as @e[type=villager,tag=infectious] at @s if predicate infect:death_chance run tag @s add dead
execute as @e[type=villager,tag=dead] at @s run setblock ~ ~ ~ dark_oak_sign[rotation=14]{Color:"orange",Text1:'{"text":"Villager"}',Text3:'{"text":"Dead from"}',Text4:'{"text":"Disease"}'}
kill @e[type=villager,tag=dead]
#after on average 60 seconds change villagers to recovered
#deterministic model
tag @e[type=villager,tag=!stochastic,tag=infectious,nbt=!{ActiveEffects:[{Id:4b}]}] add recovered
execute as @e[type=villager,tag=!stochastic,tag=infectious] at @s if entity @s[tag=recovered] run effect give @s minecraft:mining_fatigue 10000 0 true
#stochastic model
execute as @e[type=villager,tag=!deterministic,tag=infectious] at @s if predicate infect:recovery_chance run tag @s add recovered
#both models
tag @e[type=villager,tag=recovered] remove infectious
execute as @e[type=villager,tag=recovered,nbt=!{VillagerData: {profession:"minecraft:nitwit"}}] run data modify entity @s VillagerData.profession set value nitwit 
execute as @e[type=villager,tag=recovered,nbt=!{VillagerData: {type:"minecraft:plains"}}] run data modify entity @s VillagerData.type set value plains 
#after on average 60 seconds change villagers to susceptible again
#deterministic model
tag @e[type=villager,tag=!stochastic,tag=recovered,nbt=!{ActiveEffects:[{Id:4b}]}] add susceptible
#stochastic model
execute as @e[type=villager,tag=recovered] at @s if predicate infect:loss_chance run tag @s add susceptible
#both models
tag @e[type=villager,tag=susceptible] remove recovered
execute as @e[type=villager,tag=susceptible,nbt={VillagerData: {profession:"minecraft:nitwit"}}] run data modify entity @s VillagerData.profession set value {}