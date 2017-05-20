# frozen_string_literal: true

FactoryGirl.define do
  factory :group do
    sequence :name do |n|
      "group_#{n}"
    end
    trait :with_permission do
      after(:create) do |group|
        group.permissions << create(:permission, group: group)
      end
    end

    trait :with_user do
      after(:create) do |group|
        group.users << create(:user)
      end
    end
  end
end
