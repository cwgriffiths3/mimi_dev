######################################
############################  PREAMBLE
######################################

### Install
# import Pkg;
# using Pkg
# Pkg.add("MimiFUND")
# Pkg.add("MimiDICE2010")
# Pkg.add("MimiFUND")
# Pkg.add("MimiPAGE2009")

### Add DICE 2016 (not yet in MimiRegistry)
# Pkg.add(url="https://github.com/AlexandrePavlov/MimiDICE2016.jl")

### Using
using Pkg
using Mimi
using MimiDICE2010
using MimiDICE2016
using MimiPAGE2009
using MimiFUND

### Update
Pkg.update();
# Pkg.update("Mimi")

### Connect to MimiRegistry in >pkg REPL (type "]" in the Julia REPL), only need to do this once on a computer
# registry add https://github.com/mimiframework/MimiRegistry.git

######################################
###########################  DICE 2010
######################################

### Definitions
dice10 = MimiDICE2010.get_model()

### Run
run(dice10)

### EXPLORE
explore(dice10, title = "Dice 2010")

### Recover Social Cost of Co2 - Time index 2005 to 2595 by 5
MimiDICE2010.compute_scc(dice10, year = 2025)

# ######################################
# ###########################  DICE 2010
# ##########  DIFFERNING TIME DIMENSIONS
# ######################################
#
# ### Definitions
# dice10_t = MimiDICE2010.get_model()
#
# ### Update time steps to match FUND and PAGE
# set_dimension!(dice10_t, :time, 2005:5:2300)
# params = MimiDICE2010.dice2010_excel_parameters()
# update_params!(dice10_t, params, update_timesteps = true)
#
# ### Run
# # run(dice10_t)
#
# ### EXPLORE
# # explore(dice10_t, title = "Dice 2010")
#
# ### Check that time dimensions didn't change the Social Cost of Co2
# MimiDICE2010.compute_scc(dice10, year = 2025)
# MimiDICE2010.compute_scc(dice10_t, year = 2035)

######################################
###########################  DICE 2016
######################################

### Definitions
dice16 = MimiDICE2016.get_model()

### Run
run(dice16)

### EXPLORE
explore(dice16, title = "Dice 2016")

### Recover Social Cost of Co2 - Time index 2015 to 2510 by 5
MimiDICE2016.compute_scc(year = 2025)

######################################
################################  FUND
######################################

### Definitions
fund = MimiFUND.get_model()

### Run
run(fund)

### EXPLORE
explore(fund, title = "FUND")

### Recover Social Cost of Co2 - Time index 1950 to 3000 by 1
MimiFUND.compute_scc(year = 2025)

######################################
################################  PAGE
######################################

### Definitions
page09 = MimiPAGE2009.get_model()

### Run
run(page09)

### EXPLORE
explore(page09, title = "PAGE 2009")

### Recover Social Cost of Co2 - Time index (2009, 2010, 2020, 2030, 2040, 2050, 2075, 2100, 2150, 2200)
MimiPAGE2009.compute_scc(year = 2020)


## END OF SCRIPT. Have a great day!
