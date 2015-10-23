#!/usr/bin/ruby
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter:  'mysql2',
  database: 'lotteries_development',
  username: 'root',
  password: '',
  host:     'localhost'
)