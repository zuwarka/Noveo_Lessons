require 'active_record'
require_relative 'user'
require_relative 'podcast'
require_relative 'newspaper'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'test.db'
)

class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :subscribable, polymorphic: true
end
