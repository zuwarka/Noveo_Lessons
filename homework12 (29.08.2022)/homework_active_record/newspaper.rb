# frozen_string_literal: true

require 'active_record'
require_relative 'subscription'
require_relative 'user'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'test.db'
)
class Newspaper < ActiveRecord::Base
  enum type: %i[news policy sport science university]

  validates :type, inclusion: { in: type.keys }
  validates :name, presence: true, uniqueness: true

  has_many :subscriptions, as: :subscribable, dependent: :destroy
  has_many :users, through: :subscription, dependent: :destroy
end

class CreateNewspaperTable < ActiveRecord::Migration[7.0]
  def change
    create_table :newspaper do |t|
      t.string :name, null: false, uniq: true
      t.integer :type, null: false

      t.timestamps
    end
  end
end

unless ActiveRecord::Base.connection.table_exists?('newspapers')
  CreateNewspaperTable.migrate(:up)
end
