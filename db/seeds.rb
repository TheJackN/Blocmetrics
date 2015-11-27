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
    url: Faker::Interned.domain_name,
    user: users.sample
  )
end
