RSpec.describe GroupsController, :controller do
  render_views

  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let(:permission) { build(:permission) }
  let(:subject_object) { create(:subject) }


  it { is_expected.to be_a(ApplicationController) }

  context '#index' do
    let!(:groups) { create_list(:group, 4) }
    it 'respons with success' do
      get :index
      expect(response).to be_success
    end
    it 'return all users with associations' do
      get :index
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.length).to eq(Group.count)
      expect(parsed_response.first).to have_key('name')
      expect(parsed_response.first).to have_key('subjects')
      expect(parsed_response.first).to have_key('users')
    end
  end

  context '#add_user' do
    it 'call AddUserToGroupService ' do
      expect(AddUserToGroupService).to receive(:call).and_call_original
      post :add_user, id: group, user_id: user.id
    end
    it 'render error object on return false' do
      allow_any_instance_of(Interactor::Context).to receive(:success?).and_return(false)
      post :add_user, id: group, user_id: user.id
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['status']).to eq 404
    end
    it 'render user object with assosiation on success' do
      expect(AddUserToGroupService).to receive(:call).and_call_original
      post :add_user, id: group, user_id: user.id
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).to have_key('name')
      expect(parsed_response).to have_key('users')
    end
  end

  context '#add_permission' do
    it 'call AssignPermisionToGroupService ' do
      expect(AssignPermissionToGroupService).to receive(:call).and_call_original
      post :add_permission, id: group, permission_name: permission.name, subject_id: subject_object.id
    end
    it 'render error object on return false' do
      allow_any_instance_of(Interactor::Context).to receive(:success?).and_return(false)
        post :add_permission, id: group, permission_name: permission.name, subject_id: subject_object.id
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['status']).to eq 404
    end
    it 'render user object with assosiation on success' do
      expect(AssignPermissionToGroupService).to receive(:call).and_call_original
        post :add_permission, id: group, permission_name: permission.name, subject_id: subject_object.id
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).to have_key('name')
      expect(parsed_response).to have_key('users')
    end
  end

  context '#remove_users_from_group' do
    let!(:group_with_user) { create(:group, :with_user) }

    it 'call RemoveFromGroupService' do
      expect(RemoveFromGroupService).to receive(:call).and_call_original
      post :remove_users_from_group, id: group_with_user
    end
    it 'remove all user from group' do
      expect(group_with_user.users.length).to be 1
      post :remove_users_from_group, id: group_with_user
      expect(group_with_user.reload.users.length).to be 0
    end
  end

  context '#remove_permissions_from_group' do
    let!(:group_with_permission) { create(:group, :with_permission) }

    it 'call RemoveFromGroupService' do
      expect(RemoveFromGroupService).to receive(:call).and_call_original
      post :remove_permissions_from_group, id: group_with_permission
    end
    it 'remove all permissions from group' do
      expect(group_with_permission.permissions.length).to be 1
      post :remove_permissions_from_group, id: group_with_permission
      expect(group_with_permission.reload.permissions.length).to be 0
    end
  end
end
