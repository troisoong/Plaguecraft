#move armour stand two places over
tp ~ ~ ~2
#log this change using a scoreboard
scoreboard players add @s Y 2
#if it has reached the maximum distance for a row, move back and start a new row
execute if score @s Y >= Y_max Y run tp ~2 ~ ~-30
#if it moves back, log this on the scoreboard
execute if score @s Y >= Y_max Y run scoreboard players add @s X 2
#set row count to zero
execute if score @s Y >= Y_max Y run scoreboard players set @s Y 0
#if it's as far back as it can go, teleport to first row and can start filling in the gaps between graves
execute if score @s X >= X_max X run tp ~-62 ~ ~-29
#resest the scoreboard to reflect if above happened
execute if score @s X >= X_max X run scoreboard players set @s X 1
if it senses the graves have already been filled in, tag itself as done
execute if block ~ ~ ~2 minecraft:dark_oak_sign run tag @s add done
#if done, print a sign informing players the graveyard is full, and delete itself
execute as @s[tag=done] run setblock ~-1 ~ ~ dark_oak_sign[rotation=4]{Color:"red",Text2:'{"text":"GRAVEYARD"}',Text3:'{"text":"FULL"}'}
kill @s[tag=done] 
