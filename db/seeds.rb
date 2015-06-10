require 'faker'
# Users
admin = User.new(
  first_name: 'Bill',
  last_name: 'Harris',
  user_name: 'bill123',
  email: 'bill@example.com',
  password: 'password',
  password_confirmation: 'password'
)
admin.save!

standard_user = User.new(
  first_name: 'Tom',
  last_name: 'Jone',
  user_name: 'tomjones1',
  email: 'tom@example.com',
  password: 'password',
  password_confirmation: 'password'
)

standard_user.save!

users = User.all

# Lists
5.times do
  list = List.new(
    title: Faker::Lorem.sentence,
    user: users.sample
  )
  list.save!
end

lists = List.all

20.times do
  item = Item.new(
    title: Faker::Lorem.sentence,
    completed: false,
    list: lists.sample
  )
  item.save!
end

items = Item.all

puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Item.count} items created"
