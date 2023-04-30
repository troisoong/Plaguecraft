#birth rate is relient on lifespan which is set by death rate, so have to string those predicates together
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 1 Parameter if score death Parameter = 1 Parameter if predicate variable:birth_1_death_5 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 1 Parameter if score death Parameter = 2 Parameter if predicate variable:birth_1_death_10 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 1 Parameter if score death Parameter = 3 Parameter if predicate variable:birth_1_death_15 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 1 Parameter if score death Parameter = 4 Parameter if predicate variable:birth_1_death_20 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 1 Parameter if score death Parameter = 5 Parameter if predicate variable:birth_1_death_25 run function life:summon_baby_armor
#
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 2 Parameter if score death Parameter = 1 Parameter if predicate variable:birth_1.1_death_5 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 2 Parameter if score death Parameter = 2 Parameter if predicate variable:birth_1.1_death_10 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 2 Parameter if score death Parameter = 3 Parameter if predicate variable:birth_1.1_death_15 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 2 Parameter if score death Parameter = 4 Parameter if predicate variable:birth_1.1_death_20 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 2 Parameter if score death Parameter = 5 Parameter if predicate variable:birth_1.1_death_25 run function life:summon_baby_armor
#
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 3 Parameter if score death Parameter = 1 Parameter if predicate variable:birth_1.2_death_5 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 3 Parameter if score death Parameter = 2 Parameter if predicate variable:birth_1.2_death_10 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 3 Parameter if score death Parameter = 3 Parameter if predicate variable:birth_1.2_death_15 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 3 Parameter if score death Parameter = 4 Parameter if predicate variable:birth_1.2_death_20 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 3 Parameter if score death Parameter = 5 Parameter if predicate variable:birth_1.2_death_25 run function life:summon_baby_armor
#
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 4 Parameter if score death Parameter = 1 Parameter if predicate variable:birth_1.5_death_5 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 4 Parameter if score death Parameter = 2 Parameter if predicate variable:birth_1.5_death_10 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 4 Parameter if score death Parameter = 3 Parameter if predicate variable:birth_1.5_death_15 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 4 Parameter if score death Parameter = 4 Parameter if predicate variable:birth_1.5_death_20 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 4 Parameter if score death Parameter = 5 Parameter if predicate variable:birth_1.5_death_25 run function life:summon_baby_armor
#
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 5 Parameter if score death Parameter = 1 Parameter if predicate variable:birth_2_death_5 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 5 Parameter if score death Parameter = 2 Parameter if predicate variable:birth_2_death_10 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 5 Parameter if score death Parameter = 3 Parameter if predicate variable:birth_2_death_15 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 5 Parameter if score death Parameter = 4 Parameter if predicate variable:birth_2_death_20 run function life:summon_baby_armor
execute as @e[type=villager,tag=!infectious] at @s if score birth Parameter = 5 Parameter if score death Parameter = 5 Parameter if predicate variable:birth_2_death_25 run function life:summon_baby_armor
#
#
execute as @e[type=villager,tag=!disease_dead] at @s if score death Parameter = 1 Parameter if predicate variable:5_min run tag @s add age_dead
execute as @e[type=villager,tag=!disease_dead] at @s if score death Parameter = 2 Parameter if predicate variable:10_min run tag @s add age_dead
execute as @e[type=villager,tag=!disease_dead] at @s if score death Parameter = 3 Parameter if predicate variable:15_min run tag @s add age_dead
execute as @e[type=villager,tag=!disease_dead] at @s if score death Parameter = 4 Parameter if predicate variable:20_min run tag @s add age_dead
execute as @e[type=villager,tag=!disease_dead] at @s if score death Parameter = 5 Parameter if predicate variable:25_min run tag @s add age_dead
execute as @e[type=villager,tag=age_dead,tag=!disease_dead] at @s run function death:age
#kill if not infectious, add R0 tag to end count if infectious, and remove disease_dead to stop duplicate grave stone
kill @e[type=villager,tag=age_dead,tag=!infectious]
execute as @e[type=villager,tag=age_dead] at @s run tag @s add all_end
execute as @e[type=villager,tag=all_end] at @s run tag @s remove age_dead
#
#
#disease related death rate is relient on disease length, so have to string those predicates together
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 1 Parameter if score disease_length Parameter = 1 Parameter if variable:0_per if variable:0.5_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 1 Parameter if score disease_length Parameter = 2 Parameter if variable:0_per if variable:1_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 1 Parameter if score disease_length Parameter = 3 Parameter if variable:0_per if variable:2_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 1 Parameter if score disease_length Parameter = 4 Parameter if variable:0_per if variable:5_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 1 Parameter if score disease_length Parameter = 5 Parameter if variable:0_per if variable:10_min run tag @s add disease_dead
#
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 2 Parameter if score disease_length Parameter = 1 Parameter if variable:1_per if variable:0.5_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 2 Parameter if score disease_length Parameter = 2 Parameter if variable:1_per if variable:1_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 2 Parameter if score disease_length Parameter = 3 Parameter if variable:1_per if variable:2_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 2 Parameter if score disease_length Parameter = 4 Parameter if variable:1_per if variable:5_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 2 Parameter if score disease_length Parameter = 5 Parameter if variable:1_per if variable:10_min run tag @s add disease_dead
#
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 3 Parameter if score disease_length Parameter = 1 Parameter if variable:5_per if variable:0.5_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 3 Parameter if score disease_length Parameter = 2 Parameter if variable:5_per if variable:1_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 3 Parameter if score disease_length Parameter = 3 Parameter if variable:5_per if variable:2_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 3 Parameter if score disease_length Parameter = 4 Parameter if variable:5_per if variable:5_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 3 Parameter if score disease_length Parameter = 5 Parameter if variable:5_per if variable:10_min run tag @s add disease_dead
#
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 4 Parameter if score disease_length Parameter = 1 Parameter if variable:10_per if variable:0.5_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 4 Parameter if score disease_length Parameter = 2 Parameter if variable:10_per if variable:1_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 4 Parameter if score disease_length Parameter = 3 Parameter if variable:10_per if variable:2_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 4 Parameter if score disease_length Parameter = 4 Parameter if variable:10_per if variable:5_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 4 Parameter if score disease_length Parameter = 5 Parameter if variable:10_per if variable:10_min run tag @s add disease_dead
#
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 5 Parameter if score disease_length Parameter = 1 Parameter if variable:20_per if variable:0.5_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 5 Parameter if score disease_length Parameter = 2 Parameter if variable:20_per if variable:1_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 5 Parameter if score disease_length Parameter = 3 Parameter if variable:20_per if variable:2_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 5 Parameter if score disease_length Parameter = 4 Parameter if variable:20_per if variable:5_min run tag @s add disease_dead
execute as @e[type=villager,tag=infectious] at @s if score disease_death Parameter = 5 Parameter if score disease_length Parameter = 5 Parameter if variable:20_per if variable:10_min run tag @s add disease_dead
#
execute as @e[type=villager,tag=disease_dead] at @s run function death:disease
#add R0 tag to end count, and remove disease_dead to stop duplicate grave stone
execute as @e[type=villager,tag=disease_dead] at @s run tag @s add all_end
execute as @e[type=villager,tag=all_end] at @s run tag @s remove disease_dead