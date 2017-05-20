RSpec.describe UsersController, :controller do
  render_views

  let(:user) { create(:user) }
  let(:permission) { create(:permission) }
  let!(:users_with_permissions) { create_list(:user_with_permissions, 2) }

  it { is_expected.to be_a(ApplicationController) }

  context '#index' do
    it 'respons with success' do
      get :index
      expect(response).to be_success
    end
    it 'return all users with associations' do
      get :index
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.length).to eq(User.count)

      expect(parsed_response.first).to have_key('username')
      expect(parsed_response.first).to have_key('subjects')
      expect(parsed_response.first).to have_key('groups')
    end
  end

  context '#add_premission' do
    it 'call AssignPermisionService ' do
      expect(AssignPermisionService).to receive(:call).and_call_original
      post :add_premission, id: user, permission_id: permission.id
    end
    it 'render error object on return false' do
      allow_any_instance_of(Interactor::Context).to receive(:success?).and_return(false)
      post :add_premission, id: user, permission_id: permission.id
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['status']).to eq 404
    end
    it 'render user object with assosiation on success' do
      expect(AssignPermisionService).to receive(:call).and_call_original
      post :add_premission, id: user, permission_id: permission.id
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).to have_key('username')
    end
  end
end