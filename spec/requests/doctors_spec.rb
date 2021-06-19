# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Doctor', type: :request do

  describe 'Index' do
    before do
      create_list(:doctor, 2)
      get doctors_path, xhr: true
    end
    it 'should return code 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'should return all doctors' do
      data_parse = JSON.parse!(response.body)
      expect(data_parse.size).to eq(2)
    end

    it 'check params' do
      doctor = create(:doctor)
      get doctors_path, xhr: true
      expect(response.body).to include doctor.name
      expect(response.body).to include doctor.crm
      expect(response.body).to include doctor.crm_uf
    end
  end

  # TODO: precisa melhorar a cobertura
  describe 'Show' do
    let!(:doctor) { create(:doctor) }

    it 'should return a doctor' do
      get doctors_path(doctor), xhr: true
      expect(response).to have_http_status(:ok)
      expect(response.body).to include doctor.name
      expect(response.body).to include doctor.crm
      expect(response.body).to include doctor.crm_uf
    end

    it 'should return not found if doctor unavailable' do
      get '/api/v1/doctors/-1', xhr: true
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'Create' do
    context 'with valid parameters' do
      it 'should create a doctor' do
        post doctors_path, params: attributes_for(:doctor)
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      it 'should fail to create a doctor' do
        post doctors_path, params: ''
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'Update' do
    let!(:doctor) { create(:doctor) }

    context 'with valid params' do
      it 'should update parameter' do
        put "/api/v1/doctors/#{doctor.id}", params: { name: build(:doctor).name }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      it 'should not update the parameter' do
        put "/api/v1/doctors/#{doctor.id}", params: { name: '' }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'destroy' do

    context 'doctor without appointment' do
      let!(:doctor) { create(:doctor) }

      it 'should exclude the doctor' do
        delete "/api/v1/doctors/#{doctor.id}"
        expect(response).to have_http_status(204)
      end
    end

    context 'doctor with appointment' do
      let(:appointment) { create(:appointment) }

      it 'should not delete' do
        delete "/api/v1/doctors/#{appointment.doctor_id}"
        expect(response).to have_http_status(422)
      end
    end
  end
end
