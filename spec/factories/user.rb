FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'Thang123' }
    role_id { 3 }
  end
end
