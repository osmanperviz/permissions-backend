# frozen_string_literal: true

class AssignPermissionToGroupService
  include Interactor
  delegate :permission, :group, :fail!, to: :context

  def call
    check_parameters
    assign_permision
  end

  private

  def assign_permision
    group.permissions << permission
  end

  def check_parameters
    fail!(error: 'Not a permission') unless valid_permission?
    fail!(error: 'Not a group') unless valid_group?
  end

  def valid_permission?
    permission && permission.is_a?(Permission)
  end

  def valid_group?
    group && group.is_a?(Group)
  end
end
