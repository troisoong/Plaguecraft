#plant gravestone with reason for death
execute as @e[type=armor_stand,tag=gravedigger,limit=1,sort=nearest] at @s run setblock ~ ~ ~ dark_oak_sign[rotation=4]{Color:"white",Text1:'{"text":"Villager"}',Text3:'{"text":"Dead from"}',Text4:'{"text":"Old Age"}'}
#as armour stand, run function to move one place over
execute as @e[type=armor_stand,tag=gravedigger,limit=1,sort=nearest] at @s run function (function name)
#kill villager who activated this function
kill @s
