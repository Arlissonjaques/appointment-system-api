# frozen_string_literal: true

json.array! @doctors do |doctor|
  json.partial! doctor
  json.total_appointments doctor.appointments.length
  json.total_patients doctor.patients.length
end
