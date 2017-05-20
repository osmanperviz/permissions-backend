RSpec.describe GroupsController, :controller do
  render_views

  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let(:permission) { create(:permission) }
  let(:subject_object) { create(:subject) }
  let!(:users_with_permissions) { create_list(:user_with_permissions, 2) }
  let!(:users_with_group) { create(:user_with_groups) }

  it { is_expected.to be_a(ApplicationController) }

  context '#index' do
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
      post :add_permission, id: group, permission_id: permission.id, subject_id: subject_object.id
    end
    it 'render error object on return false' do
      allow_any_instance_of(Interactor::Context).to receive(:success?).and_return(false)
      post :add_permission, id: group, permission_id: permission.id, subject_id: subject_object.id
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['status']).to eq 404
    end
    it 'render user object with assosiation on success' do
      expect(AssignPermissionToGroupService).to receive(:call).and_call_original
      post :add_permission, id: group, permission_id: permission.id, subject_id: subject_object.id
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).to have_key('name')
      expect(parsed_response).to have_key('users')
    end
  end

  context '#remove_users_from_group' do
    it 'call RemoveFromGroupService' do
      expect(RemoveFromGroupService).to receive(:call).and_call_original
      post :remove_users_from_group, id: users_with_group.groups.first
    end
    it 'remove all user from group' do
      group = users_with_group.groups.first
      expect(group.users.length).to be 1
      post :remove_users_from_group, id: users_with_group.groups.first
      expect(group.reload.users.length).to be 0
    end
  end

  context '#remove_permissions_from_group' do
    before do
      group = users_with_group.groups.first
      group.permissions << permission
    end
    it 'call RemoveFromGroupService' do
      expect(RemoveFromGroupService).to receive(:call).and_call_original
      post :remove_permissions_from_group, id: users_with_group.groups.first
    end
    it 'remove all permissions from group' do
      group = users_with_group.groups.first
      expect(group.permissions.length).to be 1
      post :remove_permissions_from_group, id: users_with_group.groups.first
      expect(group.reload.permissions.length).to be 0
    end
  end
end
