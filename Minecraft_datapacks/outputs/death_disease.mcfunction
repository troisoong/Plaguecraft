execute as @e[type=armor_stand,tag=gravedigger,limit=1,sort=nearest] at @s run setblock ~ ~ ~ dark_oak_sign[rotation=4]{Color:"orange",Text1:'{"text":"Villager"}',Text3:'{"text":"Dead from"}',Text4:'{"text":"Disease"}'}
execute as @e[type=armor_stand,tag=gravedigger,limit=1,sort=nearest] at @s run function death:buried