class Permission < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :subject, optional: true
  belongs_to :group, optional: true

  enum name: %i(view modify remove add_new)
end
