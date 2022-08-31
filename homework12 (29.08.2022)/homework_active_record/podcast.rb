require 'active_record'
require_relative 'subscription'
require_relative 'user'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'test.db'
)

class Podcast < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  enum type: [ :society, :news, :sport, :business, :culture ]

  has_many :subscriptions, as: :subscribable
end
