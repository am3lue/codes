module Me

# Include sub-modules
include("Calculations.jl")
include("Display.jl")
include("Storage.jl")

using .Calculations
using .Display
using .Storage
using Dates
using Crayons

export run_tracker

function run_tracker()
    Display.clear_screen()
    Display.print_header("Cycle & Date Tracker")
    
    # Try to load saved data
    data = Storage.load_data()
    
    use_saved = false
    
    if !isnothing(data)
        println("Found saved data:")
        println("  Bae's Date:      $(data.bae_date)")
        println("  Cycle Start:     $(data.cycle_start)")
        println("  Cycle Length:    $(data.cycle_length) days")
        println("  Period Duration: $(data.period_duration) days")
        println()
        print("Do you want to use these settings? (Y/n): ")
        
        answer = readline()
        if isempty(answer) || lowercase(answer) == "y"
            use_saved = true
        end
        println()
    end

    # Variables to hold our final values
    bae_date = Date(1)
    cycle_start = Date(1)
    cycle_length = 28
    period_duration = 5

    if use_saved
        bae_date = data.bae_date
        cycle_start = data.cycle_start
        cycle_length = data.cycle_length
        period_duration = data.period_duration
    else
        println("Please enter the following details:")
        println()
        
        try
            # 1. Bae's Date
            print("Enter Date of Bae's Date (YYYY-MM-DD): ")
            bae_date = Date(readline(), "yyyy-mm-dd")
            
            # 2. Menstruation Start Date
            print("Enter Start of Menstruation Cycle (YYYY-MM-DD): ")
            cycle_start = Date(readline(), "yyyy-mm-dd")
            
            # 3. Cycle Length
            print("Enter Cycle Length (days) [default 28]: ")
            cl_input = readline()
            if !isempty(cl_input)
                cycle_length = parse(Int, cl_input)
            end
            
            # 4. Period Duration
            print("Enter Period Duration (days) [default 5]: ")
            pd_input = readline()
            if !isempty(pd_input)
                period_duration = parse(Int, pd_input)
            end
            
            # Save the new data
            Storage.save_data(bae_date, cycle_start, cycle_length, period_duration)
            println("Settings saved successfully!")
            sleep(0.5)
            
        catch e
            error_style = Crayon(foreground = :red)
            reset = Crayon(reset = true)
            println(error_style, "\nError: Invalid input. Please use correct formats.", reset)
            println("Error details: ", e)
            return
        end
    end
    
    # --- Calculations ---
    days_to_bae = Calculations.days_until(bae_date)
    days_since_cycle = Calculations.days_since(cycle_start)
    cycle_stats = Calculations.get_cycle_stats(cycle_start, cycle_length, period_duration)
    
    # --- Display Results ---
    Display.clear_screen()
    Display.print_header("Results")
    println()
    
    # Bae's Date
    Display.print_status("Days until Bae's Date", days_to_bae, true)
    println()
    
    # Cycle Stats
    bold_style = Crayon(bold=true, underline=true)
    reset = Crayon(reset=true)
    println(bold_style, "Cycle Status:", reset)
    Display.print_status("Days since Cycle Start", days_since_cycle, false)
    
    if cycle_stats.is_period_active
        active_style = Crayon(foreground=:red, bold=true)
        println(active_style, "   >> PERIOD IS ACTIVE <<", reset)
        Display.print_status("Days until Period Ends", cycle_stats.days_left_in_period, true)
    else
        over_style = Crayon(foreground=:green)
        println(over_style, "   >> Period is over <<", reset)
    end
    
    Display.print_status("Days until Next Period", cycle_stats.days_until_next, true)
    gray_style = Crayon(foreground=:dark_gray)
    println(gray_style, "(Next start: $(cycle_stats.next_start_date))", reset)
    
    println()
end

end
