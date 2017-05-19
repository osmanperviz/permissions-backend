class Subject < ApplicationRecord
  has_and_belongs_to_many :permissions
  has_many :users, through: :permissions
end
