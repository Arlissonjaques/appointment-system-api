# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:birth_date) }
    it { should validate_presence_of(:cpf) }
    it { should validate_uniqueness_of(:cpf) }
  end

  describe 'associations' do
    it { should have_many(:appointments) }
    it { should have_many(:doctors).through(:appointments) }
  end
end
