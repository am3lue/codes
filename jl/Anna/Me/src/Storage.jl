module Storage

using Dates

export save_data, load_data

const DATA_FILE = joinpath(@__DIR__, "../data.txt")

"""
    save_data(bae_date::Date, cycle_start::Date, cycle_length::Int, period_duration::Int)

Saves the provided dates and cycle settings to a text file.
"""
function save_data(bae_date::Date, cycle_start::Date, cycle_length::Int, period_duration::Int)
    open(DATA_FILE, "w") do io
        println(io, "bae_date=$bae_date")
        println(io, "cycle_start=$cycle_start")
        println(io, "cycle_length=$cycle_length")
        println(io, "period_duration=$period_duration")
    end
end

"""
    load_data()

Returns a NamedTuple (bae_date, cycle_start, cycle_length, period_duration) 
if file exists and is valid, otherwise returns nothing.
"""
function load_data()
    if !isfile(DATA_FILE)
        return nothing
    end

    data = Dict{String, Any}()
    
    try
        for line in eachline(DATA_FILE)
            if occursin("=", line)
                key, value = split(line, "=")
                if key == "bae_date" || key == "cycle_start"
                    data[key] = Date(value, "yyyy-mm-dd")
                elseif key == "cycle_length" || key == "period_duration"
                    data[key] = parse(Int, value)
                end
            end
        end
        
        if haskey(data, "bae_date") && haskey(data, "cycle_start")
            return (
                bae_date = data["bae_date"],
                cycle_start = data["cycle_start"],
                cycle_length = get(data, "cycle_length", 28),
                period_duration = get(data, "period_duration", 5)
            )
        end
    catch e
        return nothing
    end

    return nothing
end

end
