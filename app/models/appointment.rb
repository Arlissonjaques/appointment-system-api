# frozen_string_literal: true

# == Schema Information
#
# Table name: appointments
#
#  id         :bigint           not null, primary key
#  starts_at  :datetime
#  ends_at    :datetime
#  patient_id :bigint           not null
#  doctor_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null

class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  validates :starts_at, :ends_at, presence: true
end
