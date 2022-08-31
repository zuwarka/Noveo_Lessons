require 'active_record'
require_relative 'subscription'
require_relative 'user'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'test.db'
)

class Newspaper < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  enum type: [ :news, :policy, :sport, :science, :university ]

  has_many :subscriptions, as: :subscribable
  has_many :users, through: :subscription
end
