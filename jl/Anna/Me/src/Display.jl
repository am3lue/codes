module Display

using Crayons
using Crayons.Box

export print_header, print_status, clear_screen

function clear_screen()
    print("\033c")
end

function get_figlet_output(text::String)
    try
        # Attempt to call the system figlet command
        io = IOBuffer()
        run(pipeline(`figlet -w 100 $text`, stdout=io))
        return String(take!(io))
    catch
        # Fallback if figlet is not installed
        return "=== $text ==="
    end
end

function print_header(title::String)
    # Header color
    header_style = Crayon(foreground = :magenta, bold = true)
    reset = Crayon(reset = true)
    
    ascii_art = get_figlet_output(title)
    
    println(header_style)
    println(ascii_art)
    println(reset)
    println(Crayon(foreground = :cyan), "-"^40, reset)
end

function print_status(label::String, days::Int, is_future::Bool)
    label_style = Crayon(foreground = :yellow, bold = true)
    value_style = is_future ? Crayon(foreground = :green, bold = true) : Crayon(foreground = :red, bold = true)
    reset = Crayon(reset = true)
    
    print(label_style, label, ": ", reset)
    println(value_style, "$days days", reset)
end

end
