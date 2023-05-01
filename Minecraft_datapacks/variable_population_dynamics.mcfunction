#code for extra population mechanics, birth and deaths

#birth rate is relient on lifespan which is set by death rate, so have to account for both factors
#birth rate 1
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 1 Parameter if score death Parameter = 1 Parameter if predicate variable:birth_1_death_5 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 1 Parameter if score death Parameter = 2 Parameter if predicate variable:birth_1_death_10 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 1 Parameter if score death Parameter = 3 Parameter if predicate variable:birth_1_death_15 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 1 Parameter if score death Parameter = 4 Parameter if predicate variable:birth_1_death_20 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 1 Parameter if score death Parameter = 5 Parameter if predicate variable:birth_1_death_25 run function life:summon_baby_armor
#birth rate 1.1
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 2 Parameter if score death Parameter = 1 Parameter if predicate variable:birth_1.1_death_5 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 2 Parameter if score death Parameter = 2 Parameter if predicate variable:birth_1.1_death_10 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 2 Parameter if score death Parameter = 3 Parameter if predicate variable:birth_1.1_death_15 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 2 Parameter if score death Parameter = 4 Parameter if predicate variable:birth_1.1_death_20 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 2 Parameter if score death Parameter = 5 Parameter if predicate variable:birth_1.1_death_25 run function life:summon_baby_armor
#birth rate 1.2
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 3 Parameter if score death Parameter = 1 Parameter if predicate variable:birth_1.2_death_5 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 3 Parameter if score death Parameter = 2 Parameter if predicate variable:birth_1.2_death_10 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 3 Parameter if score death Parameter = 3 Parameter if predicate variable:birth_1.2_death_15 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 3 Parameter if score death Parameter = 4 Parameter if predicate variable:birth_1.2_death_20 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 3 Parameter if score death Parameter = 5 Parameter if predicate variable:birth_1.2_death_25 run function life:summon_baby_armor
#birth rate 1.5
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 4 Parameter if score death Parameter = 1 Parameter if predicate variable:birth_1.5_death_5 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 4 Parameter if score death Parameter = 2 Parameter if predicate variable:birth_1.5_death_10 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 4 Parameter if score death Parameter = 3 Parameter if predicate variable:birth_1.5_death_15 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 4 Parameter if score death Parameter = 4 Parameter if predicate variable:birth_1.5_death_20 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 4 Parameter if score death Parameter = 5 Parameter if predicate variable:birth_1.5_death_25 run function life:summon_baby_armor
#birth rate 2
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 5 Parameter if score death Parameter = 1 Parameter if predicate variable:birth_2_death_5 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 5 Parameter if score death Parameter = 2 Parameter if predicate variable:birth_2_death_10 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 5 Parameter if score death Parameter = 3 Parameter if predicate variable:birth_2_death_15 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 5 Parameter if score death Parameter = 4 Parameter if predicate variable:birth_2_death_20 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 5 Parameter if score death Parameter = 5 Parameter if predicate variable:birth_2_death_25 run function life:summon_baby_armor


#death rate doesn't rely on any other factors so simply set
execute as @e[type=villager,tag=!disease_dead] at @s if score death Parameter = 1 Parameter if predicate variable:5_min run tag @s add age_dead
execute as @e[type=villager,tag=!disease_dead] at @s if score death Parameter = 2 Parameter if predicate variable:10_min run tag @s add age_dead
execute as @e[type=villager,tag=!disease_dead] at @s if score death Parameter = 3 Parameter if predicate variable:15_min run tag @s add age_dead
execute as @e[type=villager,tag=!disease_dead] at @s if score death Parameter = 4 Parameter if predicate variable:20_min run tag @s add age_dead
execute as @e[type=villager,tag=!disease_dead] at @s if score death Parameter = 5 Parameter if predicate variable:25_min run tag @s add age_dead
#run function to print gravestone, which will also kill them
execute as @e[type=villager,tag=age_dead,tag=!disease_dead] at @s run function (file location):death_age


#disease related death rate is relient on disease length, so must account for both
#death rate 0%
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 1 Parameter if score disease_length Parameter = 1 Parameter if variable:0_per if variable:0.5_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 1 Parameter if score disease_length Parameter = 2 Parameter if variable:0_per if variable:1_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 1 Parameter if score disease_length Parameter = 3 Parameter if variable:0_per if variable:2_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 1 Parameter if score disease_length Parameter = 4 Parameter if variable:0_per if variable:5_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 1 Parameter if score disease_length Parameter = 5 Parameter if variable:0_per if variable:10_min run tag @s add disease_dead
#death rate 1%
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 2 Parameter if score disease_length Parameter = 1 Parameter if variable:1_per if variable:0.5_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 2 Parameter if score disease_length Parameter = 2 Parameter if variable:1_per if variable:1_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 2 Parameter if score disease_length Parameter = 3 Parameter if variable:1_per if variable:2_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 2 Parameter if score disease_length Parameter = 4 Parameter if variable:1_per if variable:5_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 2 Parameter if score disease_length Parameter = 5 Parameter if variable:1_per if variable:10_min run tag @s add disease_dead
#death rate 5%
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 3 Parameter if score disease_length Parameter = 1 Parameter if variable:5_per if variable:0.5_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 3 Parameter if score disease_length Parameter = 2 Parameter if variable:5_per if variable:1_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 3 Parameter if score disease_length Parameter = 3 Parameter if variable:5_per if variable:2_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 3 Parameter if score disease_length Parameter = 4 Parameter if variable:5_per if variable:5_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 3 Parameter if score disease_length Parameter = 5 Parameter if variable:5_per if variable:10_min run tag @s add disease_dead
#death rate 10%
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 4 Parameter if score disease_length Parameter = 1 Parameter if variable:10_per if variable:0.5_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 4 Parameter if score disease_length Parameter = 2 Parameter if variable:10_per if variable:1_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 4 Parameter if score disease_length Parameter = 3 Parameter if variable:10_per if variable:2_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 4 Parameter if score disease_length Parameter = 4 Parameter if variable:10_per if variable:5_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 4 Parameter if score disease_length Parameter = 5 Parameter if variable:10_per if variable:10_min run tag @s add disease_dead
#death rate 20%
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 5 Parameter if score disease_length Parameter = 1 Parameter if variable:20_per if variable:0.5_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 5 Parameter if score disease_length Parameter = 2 Parameter if variable:20_per if variable:1_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 5 Parameter if score disease_length Parameter = 3 Parameter if variable:20_per if variable:2_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 5 Parameter if score disease_length Parameter = 4 Parameter if variable:20_per if variable:5_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 5 Parameter if score disease_length Parameter = 5 Parameter if variable:20_per if variable:10_min run tag @s add disease_dead
#run function to die and print gravestone
execute as @e[type=villager,tag=disease_dead] at @s run function (file location):death_disease
