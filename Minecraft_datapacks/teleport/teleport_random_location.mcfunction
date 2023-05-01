#this teleports entities to a random location in a village set by x y coordinates, with 31 being the radius of the village
execute as @e[type=!armor_stand] at @s if block ~ ~-1 ~ diamond_block run spreadplayers (village 1 centre x y coordinates) 1 31 true @s
execute as @e[type=!armor_stand] at @s if block ~ ~-1 ~ gold_block run spreadplayers (village 2 centre x y coordinates) 1 31 true @s
execute as @e[type=!armor_stand] at @s if block ~ ~-1 ~ coal_block run spreadplayers (village 3 centre x y coordinates) 1 31 true @s
