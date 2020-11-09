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



## END OF SCRIPT. Have a great day!
