# frozen_string_literal: true

# controller responsible for doctor
class DoctorsController < ApplicationController
  before_action :set_doctor, only: %i[show update destroy]
  rescue_from ActiveRecord::DeleteRestrictionError, with: :not_possible_delete

  def index
    render json: Doctor.all
  end

  def show
    render json: @doctor
  end

  def create
    @doctor = Doctor.new(doctor_params)

    if @doctor.save
      render json: @doctor, status: :created
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
  end

  def update
    if @doctor.update(doctor_params)
      render json: @doctor, status: :ok
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @doctor.destroy!
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.permit(:name, :crm, :crm_uf)
  end

  def not_possible_delete
    render json:
             { error: { message: 'this doctor still has pending appointments' } },
           status: 422
  end
end
