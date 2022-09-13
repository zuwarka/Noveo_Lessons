# frozen_string_literal: true

require 'active_record'
require_relative 'subscription'
require_relative 'user'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'test.db'
)

class Podcast < ActiveRecord::Base
  enum type: %i[society news sport business culture]

  validates :name, presence: true, uniqueness: true
  validates :type, inclusion: { in: type.keys }

  has_many :subscriptions, as: :subscribable, dependent: :destroy
  has_many :users, through: :subscription, dependent: :destroy
end

class CreatePodcastTable < ActiveRecord::Migration[7.0]
  def change
    create_table :podcasts do |t|
      t.string :name, null: false, uniq: true
      t.integer :type, null: false

      t.timestamps
    end
  end
end

unless ActiveRecord::Base.connection.table_exists?('podcasts')
  CreatePodcastTable.migrate(:up)
end
