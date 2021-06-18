# frozen_string_literal: true

json.array! @patient do |patient|
  json.id patient.id
  json.name patient.name
  json.birth_date patient.birth_date
  json.cpf patient.cpf
end
