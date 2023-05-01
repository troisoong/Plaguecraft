#this code tracks how long the disease lasts in the population

#activate counter if someone becomes infected and is no longer in the suscetible stage
execute if score population Outputs > susceptible Outputs if score counter_active Outputs < 1 Number run scoreboard players set counter_active Outputs 1

#add one to the score as long as it is classed as active
execute if score counter_active Outputs = 1 Number run scoreboard players add counter Outputs 1

#this adds one to seconds when the counter reaches the tick number (20, counter_max) and resets counter to zero
execute if score counter_active Outputs = 1 Number if score counter Outputs >= counter_max Outputs run scoreboard players add seconds Outputs 1
execute if score counter_active Outputs = 1 Number if score counter Outputs >= counter_max Outputs run scoreboard players set counter Outputs 0

#this adds one to minutes when the seconds reaches a minute (60, seconds_max) and resets seconds to zero
execute if score counter_active Outputs = 1 Number if score seconds Outputs >= seconds_max Outputs run scoreboard players add minutes Outputs 1
execute if score counter_active Outputs = 1 Number if score seconds Outputs >= seconds_max Outputs run scoreboard players set seconds Outputs 0

#deactivates counter when there are no more infectious or exposed individuals
execute if score counter_active Outputs = 1 Number if score infectious Outputs < 1 Number if score exposed Outputs < 1 Number run scoreboard players add counter_active Outputs 1

#for SI or SEI models instead of above use:
#execute if score counter_active Outputs = 1 Number if score infectious Outputs = susceptible Outputs run scoreboard players add counter_active Outputs 1
#as in these models no one recovers so there will never be no exposed or infectious people

#create signpost displaying information
setblock ~-1 ~ ~ crimson_sign[rotation=4]{Color:"yellow",Text1:'{"text":"Time Since"}',Text2:'{"text":"1st Infection"}'}
data merge block ~-1 ~ ~ {Text3:'[{"text":"Minutes:"},{"score":{"objective":"Outputs","name":"minutes"}}]'}
data merge block ~-1 ~ ~ {Text4:'[{"text":"Seconds:"},{"score":{"objective":"Outputs","name":"seconds"}}]'}
