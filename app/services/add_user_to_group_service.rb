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
    return true if user_already_in_group?
    group.users << user
  end

  def check_parameters
    fail!(error: 'Not a group') unless valid_group?
    fail!(error: 'Not a user') unless valid_user?
  end

  def user_already_in_group?
    user.groups.include? group
  end

  def valid_group?
    group && group.is_a?(Group)
  end

  def valid_user?
    user && user.is_a?(User)
  end
end
