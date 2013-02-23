require "bundler/setup"
require "ar_validations"
require 'valid_attribute'
require 'pry'

begin
  require "pg"
  error_class = PGError
rescue
  begin
    require "arjdbc/jdbc/core_ext"
    error_class = ActiveRecord::JDBCError
  rescue LoadError, StandardError
    raise "I don't know what database adapter you're using, sorry."
  end
end

begin
  database_user = if ENV["TRAVIS"]
                    "postgres"
                  else
                    ENV["USER"]
                  end

  ActiveRecord::Base.establish_connection(:adapter  => 'postgresql',
                                          :database => 'ar_validations_test',
                                          :username => database_user,
                                          :min_messages => 'warning')
  connection = ActiveRecord::Base.connection
  postgresql_version = connection.send(:postgresql_version)
  connection.execute("SELECT 1")
rescue error_class => e
  at_exit do
    puts "-" * 80
    puts "Unable to connect to database.  Please run:"
    puts
    puts "    createdb ar_validations_test"
    puts "-" * 80
  end
  raise e
end

if ENV["LOGGER"]
  require "logger"
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end

require "with_model"

RSpec.configure do |config|
  config.extend WithModel
end
