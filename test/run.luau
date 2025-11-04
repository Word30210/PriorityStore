local frktest = require("../lune_packages/frktest")
local lune_console_reporter = frktest._reporters.lune_console_reporter

require("./lib.spec")()

lune_console_reporter.init()
frktest.run()