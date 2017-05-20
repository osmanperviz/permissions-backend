# frozen_string_literal: true

class AssignPermisionToUserService
  include Interactor
  delegate :permission, :user, :fail!, to: :context

  def call
    check_parameters
    assign_permision
  end

  private

  def assign_permision
    user.permissions << permission
  end

  def check_parameters
    fail!(error: 'Not a permission') unless valid_permission?
    fail!(error: 'Not a user') unless valid_user?
  end

  def valid_permission?
    permission && permission.is_a?(Permission)
  end

  def valid_user?
    user && user.is_a?(User)
  end
end
