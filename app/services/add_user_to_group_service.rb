# frozen_string_literal: true

class AddUserToGroupService
  include Interactor
  delegate :group, :user, :fail!, to: :context

  def call
    check_parameters
    add_to_group
  end

  private

  def add_to_group
    group.users << user
  end

  def check_parameters
    fail!(error: 'Not a group') unless valid_group?
    fail!(error: 'Not a user') unless valid_user?
  end

  def valid_group?
    group && group.is_a?(Group)
  end

  def valid_user?
    user && user.is_a?(User)
  end
end
