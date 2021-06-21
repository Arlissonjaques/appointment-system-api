# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Dashboard', type: :request do
  describe 'Index' do
    context 'no filter' do
      before do
        create_list(:doctor, 2)
        get '/api/v1/dashboard', xhr: true
      end
      it 'should return code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'should return all doctors infos' do
        data_parse = JSON.parse!(response.body)
        expect(data_parse.size).to eq(2)
      end

      it 'check params' do
        expect(response.body).to include 'crm'
        expect(response.body).to include 'crm_uf'
        expect(response.body).to include 'total_appointments'
        expect(response.body).to include 'total_patients'
      end
    end

    context 'with filter' do
      before do
        Doctor.create(name: 'Shaun Murphy', crm: 12_345, crm_uf: 'PA')
        get '/api/v1/dashboard?q=Shaun', xhr: true
      end
      it 'should return code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'should return all doctors infos' do
        data_parse = JSON.parse!(response.body)
        expect(data_parse.size).to eq(1)
      end

      it 'check params' do
        expect(response.body).to include 'Shaun Murphy'
        expect(response.body).to include 'crm'
        expect(response.body).to include 'crm_uf'
        expect(response.body).to include 'total_appointments'
        expect(response.body).to include 'total_patients'
      end
    end
  end
end
