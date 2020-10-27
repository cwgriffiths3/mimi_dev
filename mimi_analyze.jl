######################################
#############################  INSTALL
######################################

# Add Mimi
import Pkg;
Pkg.add("Mimi")

# Update mimi
# Pkg.update();
Pkg.update("Mimi")

# Use Mimi
using Mimi

# Connect to MimiRegistry in pkg REPL (type "]" in the Julia REPL), only need to do this once on a computer
# registry add https://github.com/mimiframework/MimiRegistry.git

######################################
################################  DICE
######################################

# Add DICE
Pkg.add("MimiDICE2010")
# Pkg.add("MimiDICE2016")

using MimiDICE2010
dice10 = MimiDICE2010.get_model()

# RUN
run(dice10)

# EXPLORE
explore(dice10, title = "My Window")

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
fund[:socioeconomic, :income]
explore(fund, title = "My Window")

## END OF SCRIPT. Have a great day!
