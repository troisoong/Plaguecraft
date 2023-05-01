#code for the infection to take place

#villagers become exposed if they get in range of an infectious individual or place (marked by contaminated arour stand), or if they are marked as patient zero
#both models
tag @e[type=villager,tag=patient_zero] add exposed
execute as @e[type=villager,tag=susceptible] at @s if entity @e[type=villager,tag=infectious,distance=..2] if predicate infect:exposure_chance run tag @s add exposed
execute as @e[type=villager,tag=susceptible] at @s if entity @e[type=armor_stand,tag=contaminated,distance=..2] if predicate infect:exposure_chance run tag @s add exposed
#just deterministic model, add effect to last ;ength of time stage should last (in this case 60 seconds)and 'true' makes makes effect invisible.
execute as @e[type=villager,tag=!stochastic,tag=susceptible] at @s if entity @s[tag=exposed] run effect give @s minecraft:mining_fatigue 60 0 true
#both models remove old tags
tag @e[type=villager,tag=exposed] remove patient_zero
tag @e[type=villager,tag=exposed] remove susceptible
#change appearance to indicate exposed stage
execute as @e[type=villager,tag=exposed,nbt={VillagerData: {type:"minecraft:plains"}}] run data modify entity @s VillagerData.type set value savanna

#after on average 60 seconds change villagers to infectious
#deterministic model makes change happen when previous effect ends
tag @e[type=villager,tag=!stochastic,tag=exposed,nbt=!{ActiveEffects:[{Id:4b}]}] add infectious
execute as @e[type=villager,tag=!stochastic,tag=exposed] at @s if entity @s[tag=infectious] run effect give @s minecraft:mining_fatigue 10 0 true
#stochastic model sets constant small chance of moving to next stage
execute as @e[type=villager,tag=!deterministic,tag=exposed] at @s if predicate infect:infection_chance run tag @s add infectious
#both models remove old tags and change appearance
tag @e[type=villager,tag=infectious] remove exposed
execute as @e[type=villager,tag=infectious,nbt={VillagerData: {type:"minecraft:savanna"}}] run data modify entity @s VillagerData.type set value swamp

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
#no need to apply effect because susceptibles don't have a set period of susceptibility, it ends when the encounter an infectious villager
#stochastic model
execute as @e[type=villager,tag=recovered] at @s if predicate infect:loss_chance run tag @s add susceptible
#both models
tag @e[type=villager,tag=susceptible] remove recovered
execute as @e[type=villager,tag=susceptible,nbt={VillagerData: {profession:"minecraft:nitwit"}}] run data modify entity @s VillagerData.profession set value {}

#by playing with effect lengths and chances, can make any of these stages be skipped (no effect applied, delete line of code, set next chance to 1)
#or last forever (make effect length >9999 seconds, set next chance to 0)
