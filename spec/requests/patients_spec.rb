# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Patient', type: :request do
  describe 'Index' do
    before do
      create_list(:patient, 2)
      get patients_path, xhr: true
    end
    it 'should return code 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'should return all patients' do
      data_parse = JSON.parse!(response.body)
      expect(data_parse.size).to eq(2)
    end

    it 'check params' do
      patient = create(:patient)
      get patients_path, xhr: true
      expect(response.body).to include patient.name
      expect(response.body).to include patient.birth_date.to_s
      expect(response.body).to include patient.cpf
    end
  end

  describe 'Show' do
    let!(:patient) { create(:patient) }

    it 'should return a patient' do
      get patients_path(patient), xhr: true
      expect(response).to have_http_status(:ok)
      expect(response.body).to include patient.name
      expect(response.body).to include patient.birth_date.to_s
      expect(response.body).to include patient.cpf
    end

    it 'should return not found if patient unavailable' do
      get '/api/v1/patients/-1', xhr: true
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'Create' do
    context 'with valid parameters' do
      it 'should create a patient' do
        post patients_path, params: attributes_for(:patient)
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      it 'should fail to create a patient' do
        post patients_path, params: ''
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'Update' do
    let!(:patient) { create(:patient) }

    context 'with valid params' do
      it 'should update parameter' do
        put "/api/v1/patients/#{patient.id}", params: { name: build(:patient).name }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      it 'should not update the parameter' do
        put "/api/v1/patients/#{patient.id}", params: { name: '' }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'destroy' do
    context 'with valid id' do
      let!(:patient) { create(:patient) }

      it 'should exclude the patient' do
        delete "/api/v1/patients/#{patient.id}"
        expect(response).to have_http_status(204)
      end
    end

    context 'with invalid id' do
      let(:patient) { create(:patient) }

      it 'should not delete' do
        delete '/api/v1/patients/-1'
        expect(response).to have_http_status(404)
      end
    end
  end
end
