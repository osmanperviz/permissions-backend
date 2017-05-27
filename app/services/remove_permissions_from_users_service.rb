class RemovePermissionsFromUsersService
  include Interactor

  delegate :user, :fail!, to: :context

  def call
    check_parametars
    remove_permissions
  end

  private

  def remove_permissions
    user.permissions = []
    user.save
  end

  def check_parametars
    return true if valid_user?
    fail!(error: 'Not a user')
  end

  def valid_user?
    user && user.is_a?(User)
  end
end
