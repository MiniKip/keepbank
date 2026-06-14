local utils = require("utils.os_tools")

start_module = {}

function start_module.start()
    local running = true
    
    while running do
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
        utils.center_print("#           2. Exit                     #")
        utils.center_print("#                                       #")
        utils.center_print("#########################################")
        utils.center_print("")

        io.write("Choose option: ")
        local choice = io.read()

        utils.clear_screen()

        if choice == "1" then
            utils.center_print("Account Being created")

            for i = 1, 3 do
                io.write(".")
                io.flush()
                os.execute("sleep 1")
            end

            utils.clear_screen()
            print("")
            print("")
            print("Done!")
            print("")
            print("")
            os.execute("sleep 1")
            utils.clear_screen()

            running = false
            start_module.main()

        elseif choice == "2" then
            utils.center_print("")
            utils.center_print("")
            utils.center_print("")
            utils.center_print("Have a good day! :>")
            utils.center_print("")
            utils.center_print("")
            utils.center_print("")
            os.execute("sleep 1")
            utils.clear_screen()
            running = false

        else
            utils.center_print("Choose a correct option.")
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

            utils.clear_screen()
            running = false

            start_module.bankOption()

        elseif choice == "4" then
            utils.center_print("Thank you for using KEEP BANK!")
            running = false
        else
            utils.center_print("Choose a correct option.")
            io.read()
        end
    end
end

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
        utils.center_print("#             Keep using!               #")
        utils.center_print("#                                       #")
        utils.center_print("#                                       #")
        utils.center_print("#     Choose an option to continue..    #")
        utils.center_print("#           1. Balance Enquiry  SOON    #")
        utils.center_print("#           2. Mini Statment     ||     #")
        utils.center_print("#           3. Update Operator   ||     #")
        utils.center_print("#           4. Update Profile Status || #")
        utils.center_print("#           5. Helpline          ||     #")
        utils.center_print("#           6. Change Account Type  ||  #")
        utils.center_print("#           7. Main Menu                #")
        utils.center_print("#                                       #")
        utils.center_print("#########################################")
        utils.center_print("")

        io.write("Choose option: ")
        local choice = io.read()

        utils.clear_screen()

        if choice == "1" then
            utils.center_print("SOON")

            io.read()

        elseif choice == "2" then
            utils.center_print("SOON")

            io.read()

        elseif choice == "3" then
            utils.center_print("SOON")

            io.read()

        elseif choice == "4" then
            utils.center_print("SOON")

            io.read()

        elseif choice == "5" then
            utils.center_print("SOON")

            io.read()

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



return start_module
