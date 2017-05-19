FactoryGirl.create_list(:user, 3)
FactoryGirl.create_list(:user_with_groups, 2)
FactoryGirl.create_list(:group, 3)
FactoryGirl.create_list(:subject, 3)

%i(view modify remove add_new).each do |permission|
  FactoryGirl.create(:permission, name: permission)
end
