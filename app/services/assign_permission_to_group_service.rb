# frozen_string_literal: true

class AssignPermissionToGroupService
  include Interactor
  delegate :permission, :group, :subject, :fail!, to: :context

  def call
    check_parameters
    assign_permision_to_group
    assign_permision_to_subject
  end

  private

  def assign_permision_to_group
    group.permissions << permission
  end

  def assign_permision_to_subject
    subject.permissions << permission
  end

  def check_parameters
    fail!(error: 'Not a permission') unless valid_permission?
    fail!(error: 'Not a group') unless valid_group?
  end

  def valid_permission?
    permission && permission.is_a?(Permission)
  end

  def valid_subject?
    subject && subject.is_a?(Subject)
  end

  def valid_group?
    group && group.is_a?(Group)
  end
end
