require 'rubygems'
require 'awesome_print'

begin
  Pry.print = proc { |output, value| output.puts value.ai }
rescue
  puts "=> Unable to load awesome_print, please type 'gem install awesome_print' or 'sudo gem install awesome_print'."
end

Pry.config.prompt = proc do |obj, level, _|
<<<<<<< HEAD
  prompt = "\e[0;33m"
=======
  prompt = "\e[0;37m"
>>>>>>> d9646655c7a62a7db600205a9e2b35fa82944c05
  prompt << "#{Rails.version} @ " if defined?(Rails)
  prompt << "#{RUBY_VERSION}"
  "#{prompt} (#{obj})> \e[0m"
end

