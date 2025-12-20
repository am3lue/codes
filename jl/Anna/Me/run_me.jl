using Pkg

# Ensure Crayons is installed in the current environment or activate a local one
# For this script, we will activate the local directory
Pkg.activate(@__DIR__)

# Add Crayons if not present (quietly)
try
    using Crayons
catch
    println("Installing dependencies...")
    Pkg.add("Crayons")
    using Crayons
end

# Include the main module
include("src/Me.jl")

using .Me

# Run the application
Me.run_tracker()
