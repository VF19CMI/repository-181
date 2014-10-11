# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :users do
    name { Faker::Name.name }
    organization { Faker::Company.name }
  end
end