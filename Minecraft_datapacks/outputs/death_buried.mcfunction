tp ~ ~ ~2
scoreboard players add @s Y 2
execute if score @s Y >= Y_max Y run tp ~2 ~ ~-30
execute if score @s Y >= Y_max Y run scoreboard players add @s X 2
execute if score @s Y >= Y_max Y run scoreboard players set @s Y 0
execute if score @s X >= X_max X run tp ~-62 ~ ~-29
execute if score @s X >= X_max X run scoreboard players set @s X 1
execute if block ~ ~ ~2 minecraft:dark_oak_sign run tag @s add done
execute as @s[tag=done] run setblock ~-1 ~ ~ dark_oak_sign[rotation=4]{Color:"red",Text2:'{"text":"GRAVEYARD"}',Text3:'{"text":"FULL"}'}
kill @s[tag=done] 