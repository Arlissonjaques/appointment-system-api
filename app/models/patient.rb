# frozen_string_literal: true

# == Schema Information
#
# Table name: patients
#
#  id         :bigint           not null, primary key
#  name       :string
#  birth_date :date
#  cpf        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Patient < ApplicationRecord
  has_many :appointments
  has_many :doctors, through: :appointments

  validates :name, :birth_date, :cpf, presence: true
  validates :cpf, uniqueness: true, cpf: true
end
