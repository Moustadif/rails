# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Category.destroy_all
Product.destroy_all
Admin.destroy_all

10.times do
  Category.create(
    name: Faker::Music.genre,
    description: Faker::Lorem.sentence
  )
end

20.times do
  Product.create(
      name: Faker::Music.album,
      description: Faker::Lorem.sentence,
      quantity: 500,
      price: Faker::Number.decimal(2),
      image: File.open(
        Rails.root.join('db', 'seeds', 'default', 'avatar.png'),
        'r'
      )
  )
end


Category.all.each do |category|
  category.products << Product.all.sample(10)
end

Product.all.each do |product|
  product.categories << Category.all.sample(10)
end

admin = Admin.create(email: 'user@admin.com', password: 'iknownothing')
puts "Admin Created. Email: #{admin.email}, password: #{admin.password}"

