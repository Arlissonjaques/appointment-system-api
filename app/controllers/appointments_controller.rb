# frozen_string_literal: true

# controller responsible for appointment
class AppointmentsController < ApplicationController
  before_action :set_appointments, only: %i[show update destroy]

  def index
    render json: Appointment.all
  end

  def show
    render json: @appointment
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      render json: @appointment, status: :created
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @appointment.update(appointment_params)
      render json: @appointment, status: :ok
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @appointment.destroy
  end

  private

  def set_appointments
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.permit(:starts_at, :ends_at, :patient_id, :doctor_id)
  end
end
