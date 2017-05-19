class User < ApplicationRecord
  has_and_belongs_to_many :permissions
  has_and_belongs_to_many :groups
  has_many :subjects, through: :permissions
end
