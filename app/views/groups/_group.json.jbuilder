# frozen_string_literal: true

json.id @group.id
json.name @group.name

json.permissions do
  json.array! @group.permissions, :id, :name
end

json.users do
  json.array! @group.users, :id, :username
end

json.permissions do
  json.array! @group.subjects, :id, :name
end
