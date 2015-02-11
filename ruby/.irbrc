begin
  require "awesome_print"
  AwesomePrint.irb!
rescue LoadError => e
  warn 'Unable to load gems'
  puts e
end

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true


IRB.conf[:LOAD_MODULES] = [] unless IRB.conf.key?(:LOAD_MODULES)
unless IRB.conf[:LOAD_MODULES].include?('irb/completion')
  IRB.conf[:LOAD_MODULES] << 'irb/completion'
end

unless IRB.conf[:LOAD_MODULES].include?('irb/ext/save-history')
  IRB.conf[:SAVE_HISTORY] = 100
  IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"

  IRB.conf[:LOAD_MODULES] << 'irb/ext/save-history'
end

if Object.const_defined?('ActiveRecord')
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end

