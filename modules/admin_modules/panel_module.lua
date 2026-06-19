local utils = require("utils.os_tools")
local sqlite3 = require("lsqlite3")

-- OPEN DB
local db = sqlite3.open("database/bank.db")

local panel_module = {}

function panel_module.main()
    local running = true

    while running do
        utils.clear_screen()

        for i = 1, 5 do
            print("")
        end

        utils.center_print("#########################################")
        utils.center_print("#              KEEP BANK                #")
        utils.center_print("#                                       #")
        utils.center_print("#          Welcome back admin!          #")
        utils.center_print("#    Keep controlling & make us rich!   #")
        utils.center_print("#                                       #")
        utils.center_print("#                                       #")
        utils.center_print("#     Choose an option to continue..    #")
        utils.center_print("#           1. Database Format          #")
        utils.center_print("#           2. Database Create          #")
        utils.center_print("#           3. Delete User              #")
        utils.center_print("#           4. Create User              #")
        utils.center_print("#           5. Add Balance              #")
        utils.center_print("#           6. Remove Balance           #")
        utils.center_print("#           7. Main Menu                #")
        utils.center_print("#                                       #")
        utils.center_print("#########################################")
        utils.center_print("")

        io.write("Choose option: ")
        local choice = io.read()

        utils.clear_screen()

        -- 1. FORMAT DATABASE
        if choice == "1" then
            utils.center_print("Are you sure you want to format the database? (yes/no)")
            local confirm = io.read()

            if confirm == "yes" then
                db:exec("DELETE FROM users")
                utils.clear_screen()
                utils.center_print("Database formatted successfully!")
                print("")
                utils.center_print("Do you want to create the database again? (yes/no)")
                utils.center_print("WARNING: If you go back without creating, you wont be able to access again after logout!")
                local again = io.read()

                if again == "yes" then
                    os.execute("lua tests/db/snippit.lua")
                    utils.center_print("Database created!")
                    io.read()
                else
                    utils.center_print("WARNING: You will not be able to access again if you log out!")
                    io.read()
                end
            else
                utils.center_print("Cancelled.")
                io.read()
            end

        -- 2. CREATE DATABASE
        elseif choice == "2" then
            utils.center_print("Creating database...")
            os.execute("lua tests/db/snippit.lua")
            utils.center_print("Done!")
            io.read()

        -- 3. DELETE USER
        elseif choice == "3" then
            utils.clear_screen()

            -- show all users
            local users = {}
            for row in db:nrows("SELECT id, username FROM users ORDER BY id ASC") do
                table.insert(users, row)
            end

            for i, u in ipairs(users) do
                utils.center_print(u.id .. ". " .. u.username)
            end

            print("")
            io.write("Enter user ID to delete: ")
            local uid = tonumber(io.read())

            -- check if user exists
            local found = false
            for _, u in ipairs(users) do
                if u.id == uid then
                    found = true
                end
            end

            if found then
                db:exec("DELETE FROM users WHERE id = " .. uid)
                utils.clear_screen()
                utils.center_print("User deleted!")
                io.read()
            else
                utils.clear_screen()
                utils.center_print("User not found!")
                io.read()
            end

        -- 4. CREATE USER
        elseif choice == "4" then
            io.write("Enter username: ")
            local username = io.read()

            if username == "" then
                utils.center_print("Username cant be empty!")
                io.read()
            else
                db:exec("INSERT INTO users (username) VALUES ('" .. username .. "')")
                utils.clear_screen()
                utils.center_print("User " .. username .. " created!")
                io.read()
            end

        -- 5. ADD BALANCE
        elseif choice == "5" then
            io.write("Enter username: ")
            local username = io.read()

            io.write("Enter amount to add: ")
            local amount = tonumber(io.read())

            if amount == nil or amount <= 0 then
                utils.center_print("Invalid amount!")
                io.read()
            else
                db:exec("UPDATE users SET bank_balance = bank_balance + " .. amount .. " WHERE username = '" .. username .. "'")
                utils.clear_screen()
                utils.center_print("Added $" .. amount .. " to " .. username)
                io.read()
            end

        -- 6. REMOVE BALANCE
        elseif choice == "6" then
            io.write("Enter username: ")
            local username = io.read()

            io.write("Enter amount to remove: ")
            local amount = tonumber(io.read())

            -- check current balance first
            local currentBalance = 0
            for row in db:nrows("SELECT bank_balance FROM users WHERE username = '" .. username .. "'") do
                currentBalance = row.bank_balance
            end

            if amount == nil or amount <= 0 then
                utils.center_print("Invalid amount!")
                io.read()
            elseif amount > currentBalance then
                utils.clear_screen()
                utils.center_print("Error: User only has $" .. currentBalance .. ", cant remove $" .. amount)
                io.read()
            else
                db:exec("UPDATE users SET bank_balance = bank_balance - " .. amount .. " WHERE username = '" .. username .. "'")
                utils.clear_screen()
                utils.center_print("Removed $" .. amount .. " from " .. username)
                io.read()
            end

        -- 7. MAIN MENU
        elseif choice == "7" then
            running = false
            utils.clear_screen()
            start_module.bankOption()

        else
            utils.center_print("Pick a valid option.")
            io.read()
        end

    end
end

return panel_module