class Group < ApplicationRecord
  has_and_belongs_to_many :permissions
  has_and_belongs_to_many :users
  has_many :subjects, through: :permissions
end
