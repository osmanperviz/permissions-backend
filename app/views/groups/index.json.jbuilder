# frozen_string_literal: true

json.array! @groups do |group|
  json.id group.id
  json.name group.name

  json.users do
    json.array! group.users, :id, :username
  end
  json.permissions do
    json.array! group.permissions, :id, :name
  end
  json.subjects do
    json.array! group.subjects, :id, :name
  end
end
