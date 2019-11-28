FactoryBot.define do
  factory :user do
    username {Faker::Name.unique.name}
    password { "starwars123" }
  end
end
