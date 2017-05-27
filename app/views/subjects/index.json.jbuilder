
json.array! @subjects do |subject|
  json.id subject.id
  json.name subject.name

  json.permissions do
    json.array! subject.permissions, :id, :name
  end
end
