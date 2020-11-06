######################################
########################  INSTALL MIMI
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

# Update time steps to match FUND and PAGE
const years = collect(2000:10:2500)
nyears = length(years)
set_dimension!(dice10, :time, collect(2000:10:2500))

# Run
run(dice10)

# EXPLORE
explore(dice10, title = "Dice 2010")

# Social Cost of Co2
dice10_scc2020 = MimiDICE2010.compute_scc(year = 2020)

######################################
###########################  DICE 2016
######################################

# Add DICE 2016 (not yet in MimiRegistry)
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
dice16_scc2025 = MimiDICE2016.compute_scc(year = 2025)

######################################
################################  FUND
######################################

# Add FUND
Pkg.add("MimiFUND")

# Use
using MimiFUND

# Definitions
fund = MimiFUND.get_model()

# Run
run(fund)

# EXPLORE
explore(fund, title = "FUND")

# Social Cost of Co2
fund_scc2025 = MimiFUND.compute_scc(year = 2025)

######################################
################################  PAGE
######################################

# Add FUND
Pkg.add("MimiPAGE2009")

# Use
using MimiPAGE2009

# Definitions
page09 = MimiPAGE2009.get_model()

# Run
run(page09)

# EXPLORE
explore(page09, title = "PAGE 2009")

# Social Cost of Co2
page09_scc2020 = MimiPAGE2009.compute_scc(year = 2020)


## END OF SCRIPT. Have a great day!
