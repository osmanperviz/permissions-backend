# frozen_string_literal: true

RSpec.describe RemoveFromGroupService, :service do
  let(:group) { create(:group) }
  let(:permission) { create(:permission) }
  let(:users_with_group) { create(:user_with_groups) }


  describe '#call' do
    context 'remove users from group' do
      context 'users' do
        it 'remove all users from group' do
          group = users_with_group.groups.first
          expect(group.users.length).to be 1

          described_class.call(group: group, entity: :users)
          expect(group.reload.users.length).to be 0
        end
      end
      context 'permissions' do
        before do
          group = users_with_group.groups.first
          group.permissions << permission
        end

        it 'dont remove permissions' do
          described_class.call(group: group, entity: :users)
          group = users_with_group.groups.first

          expect(group.permissions).to include(permission)
        end
      end
    end

    context 'remove permissions from group' do
      context 'users' do
        it 'dont remove users from group' do
          group = users_with_group.groups.first
          expect(group.users.length).to be 1

          described_class.call(group: group, entity: :permissions)
          expect(group.reload.users.length).to be 1
        end
      end
      context 'permissions' do
        before do
          group = users_with_group.groups.first
          group.permissions << permission
        end

        it 'remove permissions' do
          group = users_with_group.groups.first
          described_class.call(group: group, entity: :permissions)
          expect(group.reload.permissions).not_to include(permission)
        end
      end
    end
  end
end
