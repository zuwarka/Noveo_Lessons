# frozen_string_literal: true

require 'active_record'
require_relative 'user'
require_relative 'podcast'
require_relative 'newspaper'
require_relative 'subscription'

User.destroy_all
User.create!(username: 'Suleiman')
User.create!(username: 'Selim')

Podcast.destroy_all
Podcast.create!(name: 'Cumhuriyet', type: culture)
Podcast.create!(name: 'Better call Saul', type: news)

Newspaper.destroy_all
Newspaper.create!(name: 'Iskra', type: policy)
Newspaper.create!(name: 'The Washington Post', type: news)

Subscription.destroy_all
Subscription.create!(user: User.first, subscribable: Podcast.first)
Subscription.create!(user: User.second, subscribable: Newspaper.first)

p User.first.as_json
p Subscription.first.as_json
p Subscription.second.as_json
