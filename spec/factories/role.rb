FactoryBot.define do
  factory :role do
    trait :admin do
      id { 1 }
      name { 'superadmin' }
    end

    trait :teacher do
      id { 2 }
      name { 'teacher' }
    end

    trait :student do
      id { 3 }
      name { 'student' }
    end
  end
end
