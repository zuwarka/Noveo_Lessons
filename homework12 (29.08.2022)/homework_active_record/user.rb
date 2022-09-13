# frozen_string_literal: true

require 'active_record'
require_relative 'subscription'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'test.db'
)

class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many :subscriptions, dependent: :destroy

  after_update :update_subscriptions

  private

  def update_subscriptions
    return if active
    subscriptions.each { |subscription| subscription.disabled! if subscription.user_id == id }
  end
end

class CreateUserTable < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, null: false, uniq: true
      t.timestamps
    end
  end
end

class AddActiveToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :active, :boolean, null: false, default: true
  end
end

unless ActiveRecord::Base.connection.table_exists?('users')
  CreateUserTable.migrate(:up)
  AddActiveToUser.migrate(:up)
end
