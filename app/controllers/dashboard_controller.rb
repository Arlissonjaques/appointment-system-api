# frozen_string_literal: true

# controller responsible for appointment
class DashboardController < ApplicationController
  def index
    @doctors = Doctor.all
    filter_by_query if params[:q]
  end

  private

  def filter_by_query
    @doctors = Doctor.ransack(name_or_crm_uf_cont: params[:q]).result
  end
end
