FactoryGirl.define do
  factory :user do
    sequence :username do |n|
      Faker::Name.first_name
    end
  end

  factory :user_with_permissions, parent: :user do
    after(:create) do |user|
      user.permissions << create(:permission)
    end
  end

  factory :user_with_groups, parent: :user do
    after(:create) do |user|
      user.groups << create(:group)
    end
  end
end
