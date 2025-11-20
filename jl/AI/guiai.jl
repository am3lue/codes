using HTTP
using Gtk

function query_ollama(user_message)
    try
        run(pipeline(`ollama run qwen2.5-coder`))
    catch e
        println("Error while commmunicating wid ollama $e")
    end
end

function gui()
    win = GtkWindow("Ollama Gui.jl")

    input = GtkEntry()
    set_gtk_property!(input, :text, "You: ")

    