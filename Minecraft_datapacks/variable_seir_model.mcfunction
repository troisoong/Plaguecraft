#set rate of infection from other villagers
execute as @e[type=villager,tag=susceptible] at @s if score exposure_rate Parameter = 1 Parameter if predicate variable:0_min if entity @e[type=villager,tag=infected,distance=..2] run tag @s add exposed
execute as @e[type=villager,tag=susceptible] at @s if score exposure_rate Parameter = 2 Parameter if predicate variable:1_sec if entity @e[type=villager,tag=infected,distance=..2] run tag @s add exposed
execute as @e[type=villager,tag=susceptible] at @s if score exposure_rate Parameter = 3 Parameter if predicate variable:5_sec if entity @e[type=villager,tag=infected,distance=..2] run tag @s add exposed
execute as @e[type=villager,tag=susceptible] at @s if score exposure_rate Parameter = 4 Parameter if predicate variable:10_sec if entity @e[type=villager,tag=infected,distance=..2] run tag @s add exposed
execute as @e[type=villager,tag=susceptible] at @s if score exposure_rate Parameter = 5 Parameter if predicate variable:0.5_min if entity @e[type=villager,tag=infected,distance=..2] run tag @s add exposed
#set rate of infection from disease source
execute as @e[type=villager,tag=susceptible] at @s if score exposure_rate Parameter = 1 Parameter if predicate variable:0_min if entity @e[type=armor_stand,tag=contaminated,distance=..3] run tag @s add patient_zero
execute as @e[type=villager,tag=susceptible] at @s if score exposure_rate Parameter = 2 Parameter if predicate variable:1_sec if entity @e[type=armor_stand,tag=contaminated,distance=..3] run tag @s add patient_zero
execute as @e[type=villager,tag=susceptible] at @s if score exposure_rate Parameter = 3 Parameter if predicate variable:5_sec if entity @e[type=armor_stand,tag=contaminated,distance=..3] run tag @s add patient_zero
execute as @e[type=villager,tag=susceptible] at @s if score exposure_rate Parameter = 4 Parameter if predicate variable:10_sec if entity @e[type=armor_stand,tag=contaminated,distance=..3] run tag @s add patient_zero
execute as @e[type=villager,tag=susceptible] at @s if score exposure_rate Parameter = 5 Parameter if predicate variable:0.5_min if entity @e[type=armor_stand,tag=contaminated,distance=..3] run tag @s add patient_zero
#
execute as @e[type=villager,tag=!stochastic,tag=susceptible] at @s if entity @s[tag=exposed] @s if score infectious_rate Parameter = 2 Parameter run effect give @s minecraft:mining_fatigue 60 0 true
execute as @e[type=villager,tag=!stochastic,tag=susceptible] at @s if entity @s[tag=exposed] @s if score infectious_rate Parameter = 3 Parameter run effect give @s minecraft:mining_fatigue 120 0 true
execute as @e[type=villager,tag=!stochastic,tag=susceptible] at @s if entity @s[tag=exposed] @s if score infectious_rate Parameter = 4 Parameter run effect give @s minecraft:mining_fatigue 300 0 true
execute as @e[type=villager,tag=!stochastic,tag=susceptible] at @s if entity @s[tag=exposed] @s if score infectious_rate Parameter = 5 Parameter run effect give @s minecraft:mining_fatigue 600 0 true
#
execute as @e[type=villager,tag=!stochastic,tag=susceptible] at @s if entity @s[tag=patient_zero] @s if score infectious_rate Parameter = 2 Parameter run effect give @s minecraft:mining_fatigue 60 0 true
execute as @e[type=villager,tag=!stochastic,tag=susceptible] at @s if entity @s[tag=patient_zero] @s if score infectious_rate Parameter = 3 Parameter run effect give @s minecraft:mining_fatigue 120 0 true
execute as @e[type=villager,tag=!stochastic,tag=susceptible] at @s if entity @s[tag=patient_zero] @s if score infectious_rate Parameter = 4 Parameter run effect give @s minecraft:mining_fatigue 300 0 true
execute as @e[type=villager,tag=!stochastic,tag=susceptible] at @s if entity @s[tag=patient_zero] @s if score infectious_rate Parameter = 5 Parameter run effect give @s minecraft:mining_fatigue 600 0 true
#remove susceptible tag and add visual queue
execute as @e[type=villager,tag=exposed,nbt={VillagerData: {type:"minecraft:plains"}}] run data modify entity @s VillagerData.type set value savanna
tag @e[type=villager,tag=exposed] remove susceptible
execute as @e[type=villager,tag=patient_zero,nbt={VillagerData: {type:"minecraft:plains"}}] run data modify entity @s VillagerData.type set value savanna
tag @e[type=villager,tag=patient_zero] remove susceptible
#
#
#set delay time from exposure to infection
execute as @e[type=villager,tag=!deterministic,tag=exposed] at @s if score infectious_rate Parameter = 1 Parameter if predicate variable:0_min run tag @s add infectious
execute as @e[type=villager,tag=!deterministic,tag=exposed] at @s if score infectious_rate Parameter = 2 Parameter if predicate variable:1_min run tag @s add infectious
execute as @e[type=villager,tag=!deterministic,tag=exposed] at @s if score infectious_rate Parameter = 3 Parameter if predicate variable:2_min run tag @s add infectious
execute as @e[type=villager,tag=!deterministic,tag=exposed] at @s if score infectious_rate Parameter = 4 Parameter if predicate variable:5_min run tag @s add infectious
execute as @e[type=villager,tag=!deterministic,tag=exposed] at @s if score infectious_rate Parameter = 5 Parameter if predicate variable:10_min run tag @s add infectious
#
execute as @e[type=villager,tag=!deterministic,tag=patient_zero] at @s if score infectious_rate Parameter = 1 Parameter if predicate variable:0_min run tag @s add infectious
execute as @e[type=villager,tag=!deterministic,tag=patient_zero] at @s if score infectious_rate Parameter = 2 Parameter if predicate variable:1_min run tag @s add infectious
execute as @e[type=villager,tag=!deterministic,tag=patient_zero] at @s if score infectious_rate Parameter = 3 Parameter if predicate variable:2_min run tag @s add infectious
execute as @e[type=villager,tag=!deterministic,tag=patient_zero] at @s if score infectious_rate Parameter = 4 Parameter if predicate variable:5_min run tag @s add infectious
execute as @e[type=villager,tag=!deterministic,tag=patient_zero] at @s if score infectious_rate Parameter = 5 Parameter if predicate variable:10_min run tag @s add infectious
#deterministic model
tag @e[type=villager,tag=!stochastic,tag=exposed,nbt=!{ActiveEffects:[{Id:4b}]}] add infectious
execute as @e[type=villager,tag=!stochastic,tag=exposed] at @s if entity @s[tag=infectious] @s if score recovery_rate Parameter = 1 Parameter run effect give @s minecraft:mining_fatigue 30 0 true
execute as @e[type=villager,tag=!stochastic,tag=exposed] at @s if entity @s[tag=infectious] @s if score recovery_rate Parameter = 2 Parameter run effect give @s minecraft:mining_fatigue 60 0 true
execute as @e[type=villager,tag=!stochastic,tag=exposed] at @s if entity @s[tag=infectious] @s if score recovery_rate Parameter = 3 Parameter run effect give @s minecraft:mining_fatigue 300 0 true
execute as @e[type=villager,tag=!stochastic,tag=exposed] at @s if entity @s[tag=infectious] @s if score recovery_rate Parameter = 4 Parameter run effect give @s minecraft:mining_fatigue 600 0 true
execute as @e[type=villager,tag=!stochastic,tag=exposed] at @s if entity @s[tag=infectious] @s if score recovery_rate Parameter = 5 Parameter run effect give @s minecraft:mining_fatigue 10000 0 true
#
execute as @e[type=villager,tag=!stochastic,tag=patient_zero] at @s if entity @s[tag=infectious] @s if score recovery_rate Parameter = 1 Parameter run effect give @s minecraft:mining_fatigue 30 0 true
execute as @e[type=villager,tag=!stochastic,tag=patient_zero] at @s if entity @s[tag=infectious] @s if score recovery_rate Parameter = 2 Parameter run effect give @s minecraft:mining_fatigue 60 0 true
execute as @e[type=villager,tag=!stochastic,tag=patient_zero] at @s if entity @s[tag=infectious] @s if score recovery_rate Parameter = 3 Parameter run effect give @s minecraft:mining_fatigue 300 0 true
execute as @e[type=villager,tag=!stochastic,tag=patient_zero] at @s if entity @s[tag=infectious] @s if score recovery_rate Parameter = 4 Parameter run effect give @s minecraft:mining_fatigue 600 0 true
execute as @e[type=villager,tag=!stochastic,tag=patient_zero] at @s if entity @s[tag=infectious] @s if score recovery_rate Parameter = 5 Parameter run effect give @s minecraft:mining_fatigue 10000 0 true
#make villager look infectious
execute as @e[type=villager,tag=infectious,nbt={VillagerData: {type:"minecraft:savanna"}}] run data modify entity @s VillagerData.type set value swamp 
#remove old tag
tag @e[type=villager,tag=infectious] remove exposed
tag @e[type=villager,tag=infectious] remove patient_zero
#
#
#set chance of them recovering
execute as @e[type=villager,tag=!deterministic,tag=infectious] at @s if score recovery_rate Parameter = 1 Parameter if predicate variable:0.5_min run tag @s add recovered
execute as @e[type=villager,tag=!deterministic,tag=infectious] at @s if score recovery_rate Parameter = 2 Parameter if predicate variable:1_min run tag @s add recovered
execute as @e[type=villager,tag=!deterministic,tag=infectious] at @s if score recovery_rate Parameter = 3 Parameter if predicate variable:5_min run tag @s add recovered
execute as @e[type=villager,tag=!deterministic,tag=infectious] at @s if score recovery_rate Parameter = 4 Parameter if predicate variable:10_min run tag @s add recovered
execute as @e[type=villager,tag=!deterministic,tag=infectious] at @s if score recovery_rate Parameter = 5 Parameter if predicate variable:0_per run tag @s add recovered
#deterministic model
tag @e[type=villager,tag=!stochastic,tag=infectious,nbt=!{ActiveEffects:[{Id:4b}]}] add recovered
execute as @e[type=villager,tag=!stochastic,tag=recovered] at @s if entity @s[tag=infectious] @s if score susceptible_rate Parameter = 2 Parameter run effect give @s minecraft:mining_fatigue 60 0 true
execute as @e[type=villager,tag=!stochastic,tag=recovered] at @s if entity @s[tag=infectious] @s if score susceptible_rate Parameter = 3 Parameter run effect give @s minecraft:mining_fatigue 300 0 true
execute as @e[type=villager,tag=!stochastic,tag=recovered] at @s if entity @s[tag=infectious] @s if score susceptible_rate Parameter = 4 Parameter run effect give @s minecraft:mining_fatigue 600 0 true
execute as @e[type=villager,tag=!stochastic,tag=recovered] at @s if entity @s[tag=infectious] @s if score susceptible_rate Parameter = 5 Parameter run effect give @s minecraft:mining_fatigue 10000 0 true
#change them to appear immune
tag @e[type=villager,tag=recovered] remove infectious
execute as @e[type=villager,tag=recovered,nbt=!{VillagerData: {profession:"minecraft:nitwit"}}] run data modify entity @s VillagerData.profession set value nitwit 
execute as @e[type=villager,tag=recovered,nbt=!{VillagerData: {type:"minecraft:plains"}}] run data modify entity @s VillagerData.type set value plains 
tag @e[type=villager,tag=recovered] add immune
tag @e[type=villager,tag=immune] remove recovered
#
#
#set chance of losing immunity
execute as @e[type=villager,tag=!deterministic,tag=recovered] at @s if score immunity_length Parameter = 1 Parameter if predicate variable:0_sec run tag @s add susceptible
execute as @e[type=villager,tag=!deterministic,tag=recovered] at @s if score immunity_length Parameter = 2 Parameter if predicate variable:1_min run tag @s add susceptible
execute as @e[type=villager,tag=!deterministic,tag=recovered] at @s if score immunity_length Parameter = 3 Parameter if predicate variable:5_min run tag @s add susceptible
execute as @e[type=villager,tag=!deterministic,tag=recovered] at @s if score immunity_length Parameter = 4 Parameter if predicate variable:10_min run tag @s add susceptible
execute as @e[type=villager,tag=!deterministic,tag=recovered] at @s if score immunity_length Parameter = 5 Parameter if predicate variable:0_per run tag @s add susceptible
#deterministic model
tag @e[type=villager,tag=!stochastic,tag=recovered,nbt=!{ActiveEffects:[{Id:4b}]}] add susceptible
#change to susceptible villager
execute as @e[type=villager,tag=susceptible,nbt={VillagerData: {profession:"minecraft:nitwit"}}] run data modify entity @s VillagerData.profession set value {}
tag @e[type=villager,tag=susceptible] remove recovered