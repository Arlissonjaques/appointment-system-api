# frozen_string_literal: true

json.array! @doctor do |doctor|
  json.partial! doctor
  # json.total_appointments doctor.appointments.length
  # json.total_patients doctor.patients.length
  # json.total_appointment doctor.appointments do |appointment|
  #   json.partial! 'appointments/appointment', appointment: appointment
  # end
end
