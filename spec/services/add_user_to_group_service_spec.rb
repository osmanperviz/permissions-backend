# frozen_string_literal: true

RSpec.describe AddUserToGroupService, :service do
  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let!(:result) { described_class.call(group: group, user: user) }

  describe '#call' do
    context 'Invalid  Data' do
      context 'Invalid user' do
        let(:user) { nil }
        it 'return error' do
          expect(result.failure?).to be_truthy
        end
      end
      context 'Invalid permission' do
        let(:group) { nil }
        it 'return error' do
          expect(result.failure?).to be_truthy
        end
      end
    end
    context 'Valid data' do
      it 'return success' do
        expect(result.success?).to be_truthy
      end
      it 'add user to group' do
        expect(group.reload.users).to include(user)
      end
    end
  end
end
