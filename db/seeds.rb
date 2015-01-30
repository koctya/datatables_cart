# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do
  u = User.create( name:     Faker::Name.name,
              email:    Faker::Internet.free_email,
              phone:    Faker::PhoneNumber.phone_number,
              payment:  Faker::Business.credit_card_type,
              address:  Faker::Address.street_address,
              city:     Faker::Address.city,
              state:    Faker::Address.state,
              zip:      Faker::Address.zip)

  p = Product.create( name: Faker::Commerce.product_name,
                  desc: Faker::Lorem.paragraph,
                  price: Faker::Commerce.price)

  o = Order.create(user: u)

  li = LineItem.create(product: p, order: o)
end


__END__

# One line versions for use in console.
p = Product.create( name: Faker::Commerce.product_name, desc: Faker::Lorem.paragraph, price: Faker::Commerce.price)
u = User.create( name: Faker::Name.name, email: Faker::Internet.free_email, phone: Faker::PhoneNumber.phone_number, payment:  Faker::Business.credit_card_type, address:  Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state, zip:  Faker::Address.zip)
