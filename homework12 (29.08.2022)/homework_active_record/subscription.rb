# frozen_string_literal: true

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

  enum status: %i[active disabled suspended]
  validates :status, inclusion: { in: status.keys }
  #def disabled!

  #end
end

class CreateSubscriptionTable < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.belongs_to :user, foreign_key: true, null: false
      t.belongs_to :subscribable, foreign_key: true, null: false, polymorphic: true
      t.timestamps
    end
  end
end

class AddStatusToSubscription < ActiveRecord::Migration[7.0]
  def change
    add_column :subscriptions, :status, :integer, default: active, null: false
  end
end

unless ActiveRecord::Base.connection.table_exists?('subscriptions')
  CreateSubscriptionTable.migrate(:up)
  AddStatusToSubscription.migrate(:up)
end
