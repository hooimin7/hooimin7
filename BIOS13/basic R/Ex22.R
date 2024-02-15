# 22.	Write a script that converts Fahrenheit (input) to Celcius (output).
# (Celsius = (Fahrenheit-32)/1.8)
F_temp <- readline('Type temperature in Fahrenheit:') # A solution with scan is also possible
# Convert input string to numeric value:
F_temp <- as.numeric(F_temp)
# Convert Fahrenheit to Celsius:
C_temp <- (F_temp-32)/1.8
# Print result:
cat(F_temp,'Fahrenheit equals', C_temp, 'Celcius\n')
