######################################
############################  PREAMBLE
######################################

### Add
# Pkg.add("Distributions")

### Using
using Pkg
using Mimi
using Distributions
using MimiDICE2010

### Example of SCCO2 trials from https://www.mimiframework.org/Mimi.jl/stable/tutorials/tutorial_5/#Advanced-Features-Social-Cost-of-Carbon-(SCC)-Example-1

# define the number of trials
N = 100

# define your simulation (defaults to Monte Carlo sampling)
sd = @defsim begin
    t2xco2 = Truncated(Gamma(6.47815626,0.547629469), 1.0, Inf) # a dummy distribution
end

# Choose what year to calculate the SCC for
scc_year = 2015
year_idx = findfirst(isequal(scc_year), MimiDICE2010.model_years)

# Pre-compute the discount factors for each discount rate
discount_rates = [0.025, 0.03, 0.05]
nyears = length(MimiDICE2010.model_years)
discount_factors = [[zeros(year_idx - 1)... [(1/(1 + r))^((t-year_idx)*10) for t in year_idx:nyears]...] for r in discount_rates]

# Create an array to store the computed SCC in each trial for each discount rate
scc_results = zeros(N, length(discount_rates))

# Set the payload object in the simulation definition
my_payload_object = (discount_factors, scc_results) # In this case, the payload object is a tuple which holds both both arrays
Mimi.set_payload!(sd, my_payload_object)

# Calculate the SCC for each trial of the simulation
function my_scc_calculation(sim_inst::SimulationInstance, trialnum::Int, ntimesteps::Int, tup::Nothing)
    mm = sim_inst.models[1]
    discount_factors, scc_results = Mimi.payload(sim_inst)  # Unpack the payload object

    marginal_damages = mm[:neteconomy, :C] * -1 * 10^12 * 12/44 # convert from trillion $/ton C to $/ton CO2; multiply by -1 to get positive value for damages
    for (i, df) in enumerate(discount_factors)
        scc_results[trialnum, i] = sum(df .* marginal_damages .* 10)
    end
end

# Build the marginal model
mm = MimiDICE2010.get_marginal_model(year = scc_year)   # The additional emissions pulse will be added in the specified year

# Run
si = run(sd, mm, N; trials_output_filename = "scco2_testruns.csv", post_trial_func = my_scc_calculation)

# View the scc_results by retrieving them from the payload object
scc_results = Mimi.payload(si)   # Recall that the SCC array was the second of two arrays we stored in the payload tuple


## END OF SCRIPT. Have a great day!
