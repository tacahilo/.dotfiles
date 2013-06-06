require 'rubygems'

begin
  require 'pry-theme'
rescue LoadError
end


begin
  require 'awesome_print'
rescue LoadError
end


Pry.config.theme = "solarized"

begin
  Pry.print = proc { |output, value| output.puts value.ai }
rescue
  puts "=> Unable to load awesome_print, please type 'gem install awesome_print' or 'sudo gem install awesome_print'."
end

Pry.config.prompt = proc do |obj, level, _|
  prompt = "\e[0;33m"
  prompt << "#{Rails.version} @ " if defined?(Rails)
  prompt << "#{RUBY_VERSION}"
  "#{prompt} (#{obj})> \e[0m"
end


# http://morizyun.github.io/blog/pry-tips-rails-ruby/
# hirbの設定
begin
  require 'hirb'
rescue LoadError
  # Missing goodies, bummer
end

if defined? Hirb
  # Slightly dirty hack to fully support in-session Hirb.disable/enable toggling
  Hirb::View.instance_eval do
    def enable_output_method
      @output_method = true
      @old_print = Pry.config.print
      Pry.config.print = proc do |output, value|
        Hirb::View.view_or_page_output(value) || @old_print.call(output, value)
      end
    end

    def disable_output_method
      Pry.config.print = @old_print
      @output_method = nil
    end
  end

  Hirb.enable
end
