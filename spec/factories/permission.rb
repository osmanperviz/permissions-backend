FactoryGirl.define do
  factory :permission do
    name %i(view modify remove add_new).sample

    after(:create) do |permission|
      permission.subjects << create(:subject)
      permission.groups << create(:group)
    end
  end
end
