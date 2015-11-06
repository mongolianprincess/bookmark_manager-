require_relative 'models/link.rb'
require_relative 'models/tag.rb'
require_relative 'models/user'


DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")

DataMapper.finalize
