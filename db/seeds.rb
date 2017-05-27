FactoryGirl.create_list(:user, 2, :with_permission)
FactoryGirl.create_list(:group, 2, :with_permission)

%i(view modify remove add_new).each do |permission|
  FactoryGirl.create(:permission, name: permission)
end
