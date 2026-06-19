local utils = require("utils.os_tools")
local sqlite3 = require("lsqlite3")

-- OPEN DB
local db = sqlite3.open("database/bank.db")

local bank_module = {}




function bank_module.optionOne() 
    -- Verbies
    local running = true
    local balanceR = 0

    -- read username from tmp file
    local file = io.open("temp_files/data.tmp", "r")
    local user = file:read()
    file:close()
    
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
        utils.center_print("#       Your current balance is " .. balanceR .. "       #")
        utils.center_print("#                                       #")
        utils.center_print("#                                       #")
        if balanceR == 0 then
            utils.center_print("#            Status : Broke             #") 
        elseif balanceR <= 100 then
            utils.center_print("#            Status : Hustler           #") 
        elseif balanceR <= 1000 then
            utils.center_print("#            Status : Thrifty           #")
        elseif balanceR <= 5000 then
            utils.center_print("#            Status : Comfortable       #")
        elseif balanceR <= 10000 then
            utils.center_print("#            Status : Well-Off          #")
        elseif balanceR <= 20000 then
            utils.center_print("#            Status : Rising Star       #")
        elseif balanceR <= 50000 then
            utils.center_print("#            Status : Stacked           #")
        elseif balanceR <= 100000 then
            utils.center_print("#            Status : Upper Class       #")
        elseif balanceR <= 500000 then
            utils.center_print("#            Status : Half-Millionair   #")
        else 
            utils.center_print("#            Status : Tycoon            #")
        end
      
        utils.center_print("#                                       #")
        utils.center_print("#             1. Main Menu              #")
        utils.center_print("#                                       #")
        utils.center_print("#########################################")
        utils.center_print("")

        local choice = io.read()
        if choice == "1" then
            running = false
            utils.clear_screen()
            start_module.bankOption()

        end
        
    end
end

function bank_module.optionFive() 
    utils.center_print("#########################################")
    utils.center_print("#              KEEP BANK                #")
    utils.center_print("#                                       #")
    utils.center_print("#        Contact the helpline at        #")
    utils.center_print("#                                       #")
    utils.center_print("#         minikip@proton.me :D          #")
    utils.center_print("#                                       #")
    utils.center_print("#########################################")

    io.read()
    utils.clear_screen()
    start_module.bankOption()
end

return bank_module