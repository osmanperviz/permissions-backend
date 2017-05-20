class Permission < ApplicationRecord
  # has_and_belongs_to_many :users
  # has_and_belongs_to_many :subjects
  # has_and_belongs_to_many :groups
  belongs_to :user, optional: true
  belongs_to :subject, optional: true
  belongs_to :group, optional: true

  enum name: %i(view modify remove add_new)
end
