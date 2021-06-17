# == Schema Information
#
# Table name: doctors
#
#  id         :bigint           not null, primary key
#  name       :string
#  crm        :string
#  crm_uf     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null

class Doctor < ApplicationRecord
  has_many :appointments, dependent: :restrict_with_exception
  has_many :patients, through: :appointments

  validates :name, :crm, :crm_uf, presence: true
  validates :crm, :crm_uf, uniqueness: true
end
