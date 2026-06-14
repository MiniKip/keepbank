local sqlite3 = require("lsqlite3")

-- OPEN DB
local db = sqlite3.open("database/bank.db")


-- creating tables.
db:exec("CREATE TABLE IF NOT EXISTS users (id INTEGER, balance INTEGER)")
db:exec("CREATE TABLE IF NOT EXISTS history (id INTEGER, amount INTEGER, date TEXT)")

db:close()