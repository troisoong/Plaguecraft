#birth rate is relient on lifespan which is set by death rate, so have to string those predicates together
execute as @e[type=villager,tag=!infectious] at @s if predicate life:chance_birth run function life:summon_baby_armor

execute as @e[type=villager,tag=!disease_dead] at @s if predicate infect:death_chance run tag @s add age_dead
execute as @e[type=villager,tag=age_dead,tag=!disease_dead] at @s run function (file location):death_age

#disease related death rate is relient on disease length, so have to string those predicates together
execute as @e[type=villager,tag=infectious] at @s if predicate life:death_chance  run tag @s add disease_dead
execute as @e[type=villager,tag=disease_dead] at @s run (file location):death_disease
