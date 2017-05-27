# frozen_string_literal: true

class RemoveFromGroupService
  include Interactor

  delegate :group, :entity, :fail!, to: :context

  def call
    check_parametars
    return remove_users if remove_users?
    remove_permissions
  end

  private

  def remove_users
    group.users = []
    group.save
  end

  def remove_permissions
    group.permissions = []
    group.save
  end

  def remove_users?
    entity.eql?(:users)
  end

  def check_parametars
    return true if group && group.is_a?(Group)
    fail!(error: 'Not a group')
  end
end
