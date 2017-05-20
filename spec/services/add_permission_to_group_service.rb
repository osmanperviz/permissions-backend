# frozen_string_literal: true

RSpec.describe AssignPermissionToGroupService, :service do
  let(:group) { create(:group) }
  let(:permission) { create(:permission) }
  let!(:result) { described_class.call(permission: permission, group: group) }

  describe '#call' do
    context 'Invalid  Data' do
      context 'Invalid group' do
        let(:group) { nil }
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
      it 'assign permission to group' do
        expect(group.reload.permissions).to include(permission)
      end
    end
  end
end
