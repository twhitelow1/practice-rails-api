require "http"
require "tty-table"

response = HTTP.get("http://localhost:3000/api/all_products_path")
products = response.parse
puts "Here are all the products in the shop!"

table = TTY::Table.new header: ["Product Name", "Price", "Image URL", "Description"]
renderer = TTY::Table::Renderer::ASCII.new(table)
num = 0
products.each do |product|
  table << [product["name"], product["price"], product["image_url"], product["description"]]

  # puts "Product number #{num}"
  # puts "name: #{product["name"]}"
  # puts "price: #{product["price"]}"
  # puts "image_url: #{product["image_url"]}"
  # puts "description: #{product["description"]}"
  # puts ""
  num += 1
end
puts renderer.render
