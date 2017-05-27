FactoryGirl.define do
  factory :permission do
    name %i(view modify remove add_new).sample
    association :subject, factory: :subject

    trait :with_user do
      association :user
    end

    trait :with_group do
      association :group
    end
  end
end
