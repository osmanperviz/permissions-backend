FactoryGirl.define do
  factory :subject do
    sequence :name do |n|
      Faker::Company.name
    end
  end
end
