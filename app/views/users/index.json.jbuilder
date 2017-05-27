# frozen_string_literal: true

json.array! @users do |user|
  json.id user.id
  json.username user.username

  json.groups do
    json.array! user.groups, :id, :name
  end
  json.permissions do
    json.array! user.permissions, :id, :name
  end
  json.subjects do
    json.array! user.subjects, :id, :name
  end
end
