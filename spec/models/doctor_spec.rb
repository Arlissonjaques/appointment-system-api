# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:crm) }
    it { should validate_presence_of(:crm_uf) }
  end

  describe 'assossiations' do
    it { should have_many(:appointments) }
    it { should have_many(:patients).through(:appointments) }
  end
end
