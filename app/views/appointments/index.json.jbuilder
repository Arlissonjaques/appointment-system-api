# frozen_string_literal: true

json.array! @appointment do |appointment|
  json.partial! appointment
end
