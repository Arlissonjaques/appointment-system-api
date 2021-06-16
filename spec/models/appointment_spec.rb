# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Appointment, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:starts_at) }
    it { should validate_presence_of(:ends_at) }
  end

  describe 'assossiations' do
    it { should belong_to(:patient) }
    it { should belong_to(:doctor) }
  end
end
