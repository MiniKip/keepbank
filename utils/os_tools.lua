-- TABLE
local os_tools = {}



-- Clears the screen
function os_tools.clear_screen()
    if os.getenv("OS") and os.getenv("OS"):find("Windows") then
        os.execute("cls")
    else
        os.execute("clear")
    end
end

function os_tools.center_print(text)
    local terminal_width = 80
    local text_length = string.len(text)
    
    local padding = (terminal_width - text_length) / 2
    
   
    padding = math.floor(padding)
    
    if padding < 0 then padding = 0 end
    
    print(string.rep(" ", padding) .. text)
end


-- This function is generated with ai, but not being used for now.
function os_tools.print_block(lines)
    local terminal_width = 80

    local longest = 0

    for _, line in ipairs(lines) do
        if #line > longest then
            longest = #line
        end
    end

    local padding = math.floor((terminal_width - longest) / 2)

    for _, line in ipairs(lines) do
        print(string.rep(" ", padding) .. line)
    end
end


return os_tools