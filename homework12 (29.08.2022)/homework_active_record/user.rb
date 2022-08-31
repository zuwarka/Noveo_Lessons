require 'active_record'
require_relative 'subscription'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'test.db'
)

class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many :subscriptions, dependent: :destroy
end