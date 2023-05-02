#empty villager inventories to stop breeding
function life:empty
#replace any wheat a farmer picks
execute at @e[type=villager,nbt={VillagerData: {profession:"minecraft:farmer"}}] as @s if block ~ ~-1 ~ farmland if block ~ ~ ~ air run setblock ~ ~ ~ wheat{age:0}