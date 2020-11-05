######################################
#############################  INSTALL
######################################

# # Add Mimi
import Pkg;
Pkg.add("Mimi")

# Update mimi
Pkg.update();
Pkg.update("Mimi")

# Use Mimi to load dependancies etc.
using Mimi

# Connect to MimiRegistry in pkg REPL (type "]" in the Julia REPL), only need to do this once on a computer
# registry add https://github.com/mimiframework/MimiRegistry.git

######################################
###########################  DICE 2010
######################################

# Add DICE
Pkg.add("MimiDICE2010")

# Use
using MimiDICE2010

# Definitions
dice10 = MimiDICE2010.get_model()

# Run
run(dice10)

# EXPLORE
explore(dice10, title = "Dice 2010")

# Social Cost of Co2
dice10_scc2015 = MimiDICE2010.compute_scc(year = 2015)

######################################
###########################  DICE 2016
######################################

# Add DICE (not yet in MimiRegistry)
Pkg.add(url="https://github.com/AlexandrePavlov/MimiDICE2016.jl")

# Use
using MimiDICE2016

# Definitions
dice16 = MimiDICE2016.get_model()

# Run
run(dice16)

# EXPLORE
explore(dice16, title = "Dice 2016")

# Social Cost of Co2
dice16_scc2015 = MimiDICE2016.compute_scc(year = 2015)

######################################
################################  FUND
######################################

# Add FUND
Pkg.add("MimiFUND")

# Use FUND
using MimiFUND
fund = MimiFUND.get_model()

# RUN
run(fund)

# EXPLORE
fun = fund[:socioeconomic, :income]
explore(fund, title = "My Window")




## END OF SCRIPT. Have a great day!
