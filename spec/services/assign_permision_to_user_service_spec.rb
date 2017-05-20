# frozen_string_literal: true

RSpec.describe AssignPermisionToUserService, :service do
  let(:user) { create(:user) }
  let(:permission) { create(:permission) }
  let(:subject) { create(:subject) }
  let!(:result) { described_class.call(permission: permission, user: user, subject: subject) }

  describe '#call' do
    context 'Invalid  Data' do
      context 'Invalid user' do
        let(:user) { nil }
        it 'return error' do
          expect(result.failure?).to be_truthy
        end
      end
      context 'Invalid permission' do
        let(:permission) { nil }
        it 'return error' do
          expect(result.failure?).to be_truthy
        end
      end
    end
    context 'Valid data' do
      it 'return success' do
        expect(result.success?).to be_truthy
      end
      it 'assign permission to user' do
        expect(user.reload.permissions).to include(permission)
      end

      it 'assign permission to subject' do
        expect(user.reload.permissions).to include(permission)
      end
    end
  end
end
