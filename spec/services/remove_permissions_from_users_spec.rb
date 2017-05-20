RSpec.describe RemovePermissionsFromUsersService, :service do
  let(:user_with_permission) { create(:user_with_permissions) }

  describe '#call' do
    context 'remove permissons from user' do
      it 'remove all permissions from user' do
        expect(user_with_permission.permissions.length).to be 1

        described_class.call(user: user_with_permission,)
        expect(user_with_permission.permissions.length).to be 0
      end
    end
    context 'invalid user' do
      it 'return error with message' do
        result = described_class.call(user: nil,)
        expect(result.error).to eq 'Not a user'
      end
    end
  end
end
