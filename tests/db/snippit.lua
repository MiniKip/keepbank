local sqlite3 = require("lsqlite3")

-- OPEN DB
local db = sqlite3.open("database/bank.db")


-- CREATE THE FEAKING TABLES!!
db:exec([[
    CREATE TABLE users (
        id INTEGER PRIMARY KEY NOT NULL,             
        username TEXT NOT NULL,                     
        balance INTEGER DEFAULT 0,           
        bank_balance INTEGER DEFAULT 0,             
        last_daily TEXT,                            
        created_at TEXT DEFAULT CURRENT_TIMESTAMP    
    )
]])

db:close()
print("ok")