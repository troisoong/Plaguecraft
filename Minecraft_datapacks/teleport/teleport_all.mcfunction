#if an entity detects a certain block they are teleported to a specific location
execute as @e[type=!armor_stand] at @s if block ~ ~-1 ~ diamond_block run tp (village 1 coordinates)
execute as @e[type=!armor_stand] at @s if block ~ ~-1 ~ gold_block run tp (village 2 coordinates)
execute as @e [type=!armor_stand]at @s if block ~ ~-1 ~ coal_block run tp (village 3 coordinates)
