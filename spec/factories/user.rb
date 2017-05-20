# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    sequence :username do |_n|
      Faker::Name.first_name
    end

    trait :with_permission do
      after(:create) do |user|
        user.permissions << create(:permission, user: user)
      end
    end

    trait :with_group do
      after(:create) do |user|
        user.groups << create(:group, users: [user])
      end
    end
  end
end
