local utils = require("utils.os_tools")

start_module = {}

local running = true

function start_module.start()
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

            print("")
            utils.center_print("")
            utils.clear_screen()

            running = false

        elseif choice == "2" then
            utils.center_print("Have a good day! :>")
            running = false

        else
            utils.center_print("Choose a correct option.")
            io.read()
        end
    end
end

return start_module