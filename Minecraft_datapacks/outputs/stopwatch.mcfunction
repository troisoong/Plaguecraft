execute if score population Outputs > susceptible Outputs if score counter_active Outputs < 1 Number run scoreboard players set counter_active Outputs 1
execute if score counter_active Outputs = 1 Number run scoreboard players add counter Outputs 1
execute if score counter_active Outputs = 1 Number if score counter Outputs >= counter_max Outputs run scoreboard players add seconds Outputs 1
execute if score counter_active Outputs = 1 Number if score counter Outputs >= counter_max Outputs run scoreboard players set counter Outputs 0
execute if score counter_active Outputs = 1 Number if score seconds Outputs >= seconds_max Outputs run scoreboard players add minutes Outputs 1
execute if score counter_active Outputs = 1 Number if score seconds Outputs >= seconds_max Outputs run scoreboard players set seconds Outputs 0
execute if score counter_active Outputs = 1 Number if score infectious Outputs < 1 Number if score exposed Outputs < 1 Number run scoreboard players add counter_active Outputs 1
setblock ~-1 ~ ~ crimson_sign[rotation=4]{Color:"yellow",Text1:'{"text":"Time Since"}',Text2:'{"text":"1st Infection"}'}
execute if block ~-2 ~ ~ lever[powered=true] run data merge block ~-1 ~ ~ {Text3:'[{"text":"Minutes:"},{"score":{"objective":"Outputs","name":"minutes"}}]'}
execute if block ~-2 ~ ~ lever[powered=true] run data merge block ~-1 ~ ~ {Text4:'[{"text":"Seconds:"},{"score":{"objective":"Outputs","name":"seconds"}}]'}
execute if block ~-2 ~ ~ lever[powered=false] run data merge block ~-1 ~ ~ {Text3:'{"text":{" "}}'}
execute if block ~-2 ~ ~ lever[powered=false] run data merge block ~-1 ~ ~ {Text4:'{"text":{" "}}'}
execute if block ~-2 ~ ~ lever[powered=false] run setblock ~ ~1 ~ soul_wall_torch[facing=west]