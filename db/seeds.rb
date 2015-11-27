15.times do
  User.create!(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Internet.password(8)
  )
end

tester = User.create!(
  name:     'Tester Guy',
  email:    'Test@example.com',
  password: '12345678'
)

users = User.all

50.times do
  RegisteredApplication.create!(
    name: Faker::Company.name,
    url: Faker::Internet.domain_name,
    user: users.sample
  )
end

apps = RegisteredApplication.all

events = []
20.times do
  event_noun = Faker::Hacker.noun
  events << event_noun
end

200.times do
  Event.create!(
    name: events.sample,
    registered_application: apps.sample
  )
end

puts "#{User.count} users created"
puts "#{RegisteredApplication.count} applications registered"
puts "#{Event.count} events logged"
