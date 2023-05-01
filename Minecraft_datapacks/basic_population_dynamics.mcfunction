#this code is for the added population dynamics

#birth rate is relient on lifespan which is set by death rate, so must account for this when calculating chance (Equation 3)
execute as @e[type=villager,tag=!infectious] at @s if predicate life:birth_chance run function life:summon_baby

#this is the chance of dying from natural causes. Doesn't rely on anything
execute as @e[type=villager,tag=!disease_dead] at @s if predicate infect:death_chance run tag @s add age_dead
#triggers gravestone when dying
execute as @e[type=villager,tag=age_dead,tag=!disease_dead] at @s run function (file location):death_age

#disease related death rate is relient on disease length, must accoun for when calculating chance
execute as @e[type=villager,tag=infectious] at @s if predicate life:death_chance  run tag @s add disease_dead
#triggers gravestone when dying
execute as @e[type=villager,tag=disease_dead] at @s run (file location):death_disease
