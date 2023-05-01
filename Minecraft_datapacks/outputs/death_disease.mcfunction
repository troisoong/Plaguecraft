#tell armour stand to plant a grave with reason for death
execute as @e[type=armor_stand,tag=gravedigger,limit=1,sort=nearest] at @s run setblock ~ ~ ~ dark_oak_sign[rotation=4]{Color:"orange",Text1:'{"text":"Villager"}',Text3:'{"text":"Dead from"}',Text4:'{"text":"Disease"}'}
#tell armour stand to move over before planting next gravestone
execute as @e[type=armor_stand,tag=gravedigger,limit=1,sort=nearest] at @s run function (file location):death_buried
#kill villager who started this
kill @s
