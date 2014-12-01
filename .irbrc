require 'irb/completion'

# configuration
IRB.conf[:AUTO_INDENT] = true

require 'readline'
IRB.conf[:USE_READLINE] = true

require 'irb/ext/save-history'
IRB.conf[:HISTORY_FILE] = "~/.backup/irb_history"
IRB.conf[:SAVE_HISTORY] = 100000

# colorize
require 'wirb'
Wirb.start
