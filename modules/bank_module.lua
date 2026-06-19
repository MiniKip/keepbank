local utils = require("utils.os_tools")
local sqlite3 = require("lsqlite3")

-- OPEN DB
local db = sqlite3.open("database/bank.db")

local bank_module = {}




function bank_module.optionOne(user) 
    -- Verbies
    local running = true
    local balanceR = 0
    
    while running do
        utils.clear_screen()

        for row in db:nrows("SELECT bank_balance FROM users WHERE username = '" .. user .. "'") do
            balanceR = row.bank_balance
        end

        for i = 1, 5 do
            print("")
        end

        utils.center_print("#########################################")
        utils.center_print("#              KEEP BANK                #")
        utils.center_print("#                                       #")
        utils.center_print("#   Continue to your personal space!    #")
        utils.center_print("#      Keep using & make us rich!       #")
        utils.center_print("#                                       #")
        utils.center_print("#                                       #")
        utils.center_print("#     Your current balance is " .. balanceR .. " #")
        utils.center_print("#                                       #")
        utils.center_print("#                                       #")
        utils.center_print("#                                       #")
        utils.center_print("#                                       #")
        utils.center_print("#                                       #")
        utils.center_print("#                                       #")
        utils.center_print("#           1. Main Menu                #")
        utils.center_print("#                                       #")
        utils.center_print("#########################################")
        utils.center_print("")

        local choice = io.read()
        if choice == "1" then
            running = false
        end
        
    end
end

return bank_module