local utils = require("utils.os_tools")
local sqlite3 = require("lsqlite3")
local bank_module = require("modules.bank_module")
local panel_module = require("modules.admin_modules.panel_module")


-- OPEN DB
local db = sqlite3.open("database/bank.db")

start_module = {}

function start_module.start()
    while true do
        utils.clear_screen()

        for i = 1, 5 do
            print("")
        end

        utils.center_print("#########################################")
        utils.center_print("#              KEEP BANK                #")
        utils.center_print("#                                       #")
        utils.center_print("#    Welcome to the worlds best bank!   #")
        utils.center_print("#        Start using from today!        #")
        utils.center_print("#                                       #")
        utils.center_print("#                                       #")
        utils.center_print("#     Choose an option to continue..    #")
        utils.center_print("#           1. Create account           #")
        utils.center_print("#           2. Select account           #")
        utils.center_print("#           3. Exit                     #")
        utils.center_print("#                                       #")
        utils.center_print("#########################################")

        io.write("Choose option: ")
        local choice = io.read()

        utils.clear_screen()

        if choice == "1" then
            print("")
            io.write("Enter a username for your new account: ")
            local username = io.read()

            if username == "" then
                print("you need to enter a username fahh!")
                io.read()
            else
                utils.clear_screen()
                utils.center_print("Account being created for " .. username)

                for i = 1, 3 do
                    io.write(".")
                    io.flush()
                    os.execute("sleep 1")
                end

                os.remove("temp_files/data.tmp")
                local file = io.open("temp_files/data.tmp", "w")
                file:write(username)
                file:close()

                db:exec(string.format("INSERT INTO users (username, balance, bank_balance) VALUES ('%s', 0, 0)", username))
                local assigned_id = db:last_insert_rowid()
                db:close()

                utils.clear_screen()
                utils.center_print("")
                utils.center_print("")
                utils.center_print("Done! Account created successfully.")
                utils.center_print("")
                utils.center_print("")
                os.execute("sleep 3")
                utils.clear_screen()

                start_module.main()
                break
            end

        elseif choice == "2" then
            utils.clear_screen()
            start_module.selectAccount()
            break

        elseif choice == "3" then
            print("")
            print("")
            print("Have a good day! :>")
            print("")
            print("")
            os.execute("sleep 1")
            utils.clear_screen()
            break

        else
            print("pick a valid option.")
            io.read()
        end
    end
end

function start_module.main()
    local running = true
    
    while running do
        utils.clear_screen()

        for i = 1, 5 do
            print("")
        end

        utils.center_print("#########################################")
        utils.center_print("#              KEEP BANK                #")
        utils.center_print("#                                       #")
        utils.center_print("#    Welcome to your personal space!    #")
        utils.center_print("#             Keep using!               #")
        utils.center_print("#                                       #")
        utils.center_print("#                                       #")
        utils.center_print("#     Choose an option to continue..    #")
        utils.center_print("#           1. Cash Out                 #")
        utils.center_print("#           2. Send Money               #")
        utils.center_print("#           3. My Bank                  #")
        utils.center_print("#           4. Exit                     #")
        utils.center_print("#                                       #")
        utils.center_print("#########################################")
        utils.center_print("")

        io.write("Choose option: ")
        local choice = io.read()

        utils.clear_screen()

        if choice == "1" then
            utils.center_print("COMMING SOON!")
            io.read()
        elseif choice == "2" then
            utils.center_print("COMMING SOON!")
            io.read()
        elseif choice == "3" then

            utils.center_print("Redirecting to Vault.. ")

                for i = 1, 3 do
                    io.write(".")
                    io.flush()
                    os.execute("sleep 1")
                end

            utils.clear_screen()
            running = false

            start_module.bankOption()

        elseif choice == "4" then
            print("")
            print("")
            print("Have a good day! :>")
            print("")
            print("")
            os.execute("sleep 1")
            utils.clear_screen()
            running = false
        else
            utils.center_print("Choose a correct option.")
            io.read()
        end
    end
end


-- NEXT DAY
function start_module.bankOption()
    local running = true
    
    while running do
        utils.clear_screen()

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
        utils.center_print("#     Choose an option to continue..    #")
        utils.center_print("#           1. Balance Enquiry          #")
        utils.center_print("#           2. Mini Statment     ||     #")
        utils.center_print("#           3. Panel Operator           #")
        utils.center_print("#           4. Update Profile Status || #")
        utils.center_print("#           5. Helpline                 #")
        utils.center_print("#           6. Change Account Type  ||  #")
        utils.center_print("#           7. Main Menu                #")
        utils.center_print("#                                       #")
        utils.center_print("#########################################")
        utils.center_print("")

        io.write("Choose option: ")
        local choice = io.read()

        utils.clear_screen()

        if choice == "1" then
            utils.center_print("Getting the information from database...")
            os.execute("sleep 1")
            running = false
            bank_module.optionOne()


        elseif choice == "2" then
            utils.center_print("SOON")

            io.read()

        elseif choice == "3" then
            utils.center_print("Getting the information from database...")
            os.execute("sleep 1")
            running = false
            utils.clear_screen()
            panel_module.main()

        elseif choice == "4" then
            utils.center_print("SOON")

            io.read()

        elseif choice == "5" then
            utils.center_print("Getting the information from database...")
            os.execute("sleep 1")
            running = false
            utils.clear_screen()
            bank_module.optionFive()

        elseif choice == "6" then
            utils.center_print("SOON")
            io.read()

        elseif choice == "7" then
            utils.center_print("Returning to Main Menu...")
            os.execute("sleep 1")
            running = false
            start_module.main()

        else
            utils.center_print("Choose a correct option.")
            io.read()
        end
    end
end

function start_module.selectAccount()
    while true do
        utils.clear_screen()

        -- variables
        local db = sqlite3.open("database/bank.db")
        local accounts = {}
        
        for row in db:nrows("SELECT id, username FROM users ORDER BY id ASC LIMIT 6") do
            table.insert(accounts, row)
        end
        db:close()

        utils.center_print("#########################################")
        utils.center_print("#              KEEP BANK                #")
        utils.center_print("#                                       #")
        utils.center_print("#   Continue to your personal space!    #")
        utils.center_print("#             Keep using!               #")
        utils.center_print("#                                       #")
        utils.center_print("#     Choose an option to continue..    #")


        -- This part is ai written sorry, the text allignment was too complex. My micro brain can't handle
        for i = 1, 8 do
            local middle
            if accounts[i] then
                middle = i .. ". " .. accounts[i].username .. " (ID: " .. accounts[i].id .. ")"
            else 
                middle = i .. ". None"
            end
             
            local total_inner = 36
            local spaces_needed = total_inner - string.len(middle)
            local line = "#   " .. middle .. string.rep(" ", spaces_needed) .. "#"
            utils.center_print(line)
        end
        --Ends here :D

        utils.center_print("#               9. Exit                 #")
        utils.center_print("#########################################") 



        io.write("Choose option: ")

        -- BRO DONT EVEN TOUCH, (saying to my self)
        local choice = io.read()
        local num = tonumber(choice)

        if num == 9 then
            utils.clear_screen()
            print("")
            print("")
            print("Have a good day! :>")
            print("")
            print("")
            os.execute("sleep 1")
            utils.clear_screen()
            break
        elseif num and num >= 1 and num <= 8 then
            if accounts[num] then
                utils.clear_screen()

                -- overwrite tmp file with the selected account's username
                os.remove("temp_files/data.tmp")
                local file = io.open("temp_files/data.tmp", "w")
                file:write(accounts[num].username)
                file:close()

                start_module.main(accounts[num].id)
                break
            else
                utils.clear_screen()

                print("No account in this slot.")
                io.read()
            end
        else
            utils.clear_screen()

            print("Pick a valid option.")
            io.read()
        end
    end
end



return start_module