# Some default enhancements/settings for IRB, based on
# http://wiki.rubygarden.org/Ruby/page/show/Irb/TipsAndTricks

unless defined? ETC_IRBRC_LOADED

  # Require RubyGems by default.
  require 'rubygems'
  
  # Activate auto-completion.
  require 'irb/completion'

  # Set up Wirble for awesomeness in general
  require 'wirble'
  Wirble.init
  Wirble.colorize

  # Set up for local methods of a class
  class Object
	def local_methods
		(methods - Object.instance_methods).sort
	end
  end

  # Log to stdout in rails
  if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
	require 'logger'
	RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
  end

  # Enable HIRB for nicer tables
  require 'hirb'
  require 'hirb/import_object'
  Hirb.enable
  extend Hirb::Console

  # Set up auto indentation
  IRB.conf[:AUTO_INDENT]=true

  # Load readline
  IRB.conf[:USE_READLINE]=true

  # Get what methods for what you need to call to get something
  require 'what_methods'
  
  ETC_IRBRC_LOADED=true
end
