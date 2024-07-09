
class Api::ProponentsController < ApplicationController
  include TaxHelper

  protect_from_forgery with: :null_session

  rescue_from ActiveRecord::RecordInvalid do |e|
    response = { message: e.message }

    render json: response, status: :bad_request
  end

  def index
    results = Proponent.page(params[:page])
    render json: { 
      proponents: results,
      total_pages: results.total_pages,
      current_page: results.current_page,
      prev_page: results.prev_page,
      next_page: results.next_page,
      out_of_range: results.out_of_range?
    }
  end

  def show
    p = Proponent.where(id: params[:id])

    if p.empty?
      render :json => {:error => "not-found"}.to_json, :status => :not_found
    else
      render json: p 
    end
  end

  def create
    p = Proponent.create!(proponent_params)

    render json: p
  end

  def update
    p = Proponent.where(id: params[:id])

    if p.empty?
      render :json => {:error => "not-found"}.to_json, :status => :not_found
    else
      UpdateJob.perform_async(params[:id], proponent_params.to_hash)

      render json:{}, status: :ok
    end
  end

  def destroy
    p = Proponent.where(id: params[:id]).destroy_all

    render json: p
  end

  def calculate_inss
    total = 0

    inss_tax_brackets.each do |limits, percentage|
      lower_bound, higher_bound = limits

      if params[:monthly_salary] > higher_bound
        target = higher_bound - lower_bound

        total += (target * percentage).truncate(2)
      end

      if (params[:monthly_salary] < higher_bound)
        target = params[:monthly_salary] - lower_bound
        total += (target * percentage).truncate(2)

        break
      end
    end

    render json: {"total_contribution" => total}
  end

  private

  def proponent_params
    attributes = Proponent.column_names.map(&:to_sym) - [:id, :created_at, :updated_at]

    params.permit(attributes)
  end
end

