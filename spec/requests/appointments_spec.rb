# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Appointments', type: :request do
  describe 'Index' do
    before do
      create_list(:appointment, 2)
      get appointments_path, xhr: true
    end

    it 'should return code 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'should return all appointments' do
      data_parse = JSON.parse!(response.body)
      expect(data_parse.size).to eq(2)
    end
  end

  describe 'Show' do
    it 'should return a appointment' do
      get "/api/v1/appointments/#{build(:appointment).id}", xhr: true
      expect(response).to have_http_status(:ok)
    end

    it 'should return not found if appointment unavailable' do
      get '/api/v1/appointments/-1', xhr: true
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'Create' do
    context 'with valid parameters' do
      let!(:appointment) { create(:appointment) }
      it 'should create a appointment' do
        post appointments_path, params: appointment.as_json
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      it 'should fail to create a appointment' do
        post appointments_path, params: ''
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'Update' do
    let!(:appointment) { create(:appointment) }

    context 'with valid params' do
      it 'should update parameter' do
        put "/api/v1/appointments/#{appointment.id}", params: { starts_at: build(:appointment).starts_at }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      it 'should not update the parameter' do
        put "/api/v1/appointments/#{appointment.id}", params: { starts_at: '' }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'destroy' do
    context 'with valid id' do
      let!(:appointment) { create(:appointment) }

      it 'should exclude the appointment' do
        delete "/api/v1/appointments/#{appointment.id}"
        expect(response).to have_http_status(204)
      end
    end

    context 'with invalid id' do
      let(:appointment) { create(:appointment) }

      it 'should not delete' do
        delete '/api/v1/appointments/-1'
        expect(response).to have_http_status(404)
      end
    end
  end
end
