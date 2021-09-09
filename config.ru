require_relative './config/environment'
require 'yaml'

ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :database => 'db/database'
  )

run ApplicationController