class Permission < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :groups

  enum name: %i(view modify remove add_new)
end
