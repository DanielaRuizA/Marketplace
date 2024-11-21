# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

categories = [
  { name: "Smartphones & Accessories" },
  { name: "Furniture & Home Decor" },
  { name: "Clothing & Footwear" },
  { name: "Fitness Equipment & Gear" }
]

categories.each do |category|
  Category.find_or_create_by(category)
end

puts "Categories created successfully."

product_names = [
  "iPhone 14", "Samsung Galaxy S22", "Nike Running Shoes", "Adidas Tracksuit",
  "Wooden Dining Table", "Leather Sofa", "Yoga Mat", "Dumbbell Set",
  "Bluetooth Headphones", "Smartwatch", "Gaming Chair", "4K Smart TV",
  "Mountain Bike", "Formal Suit", "Wrist Watch", "AirPods Pro"
]

10.times do |i|
  user = User.create!(
    email: "user#{i + 1}@example.com",
    password: "password",
    password_confirmation: "password",
    name: "User #{i + 1}",
    address: "Address #{i + 1}",
    phone: "123456789#{i}"
  )

  puts "User #{user.name} created successfully."

  2.times do
    product = Product.create!(
      name: product_names.sample,
      description: "High-quality product at an affordable price.",
      price: rand(901..5000),
      category: Category.order("RANDOM()").first, 
      user: user
    )
    puts "Product '#{product.name}' created for #{user.name}."
  end
end

puts "Seeds created successfully."
