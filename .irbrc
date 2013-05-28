require 'irb/completion'
require 'irb/ext/save-history'
require 'rubygems'
require 'readline'
require 'what_methods'
require 'pp'
require 'wirble'

# configuration
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true
IRB.conf[:SAVE_HISTORY] = 100000
IRB.conf[:HISTORY_FILE] = "~/.backup/irb_history"

# wirble
Wirble.init
Wirble.colorize