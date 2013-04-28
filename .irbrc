require "awesome_print"
require 'irb/completion'
require 'irb/ext/save-history'
require 'rubygems'
require 'readline'
require 'what_methods'

IRB.conf[:SAVE_HISTORY] = 5000
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true
IRB.conf[:HISTORY_PATH] = File::expand_path("~/.backup/irb-history")

unless IRB.version.include?('DietRB')
  IRB::Irb.class_eval do
    def output_value
      ap @context.last_value
    end
  end
else # MacRuby
  IRB.formatter = Class.new(IRB::Formatter) do
    def inspect_object(object)
      object.ai
    end
  end.new
end
