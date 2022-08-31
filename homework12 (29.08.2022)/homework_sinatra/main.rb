# frozen_string_literal: true

require 'sinatra'

file_products = File.read("products.csv").split("\n")

set :port, 7777

get '/products' do
  "#{file_products}"
end
# Добавлен интереса ради
get '/products/:id' do
  "#{file_products[params['id'].to_i]}"
  #halt 404, "There's no product with this id"
  # Здесь бы хотелось вставить ошибку 404 при поытке доступа к несуществующему объекту
end

post '/products' do
  new_product = "new;new;new;new"
  File.write("products.csv", new_product, mode: "a")
end

patch '/products/:id' do
  id = params['id'].to_i
  new_product = "new;new;new;new"
  file_products[id] = new_product
  File.write("products.csv", new_product, mode: "w")
end

delete '/products/:id' do
  id = params['id'].to_i
  new_products = file_products.delete_at(id)
  File.write("products.csv", new_products, mode: "w") unless new_products.nil?
end

