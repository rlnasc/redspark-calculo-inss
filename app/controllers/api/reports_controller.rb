class Api::ReportsController < ApplicationController
  protect_from_forgery with: :null_session

  def inss
    render json: Proponent.all.group_by(&:inss_tier)
      .transform_values(&:count)
      .transform_keys{ |key| key.join(" - ") }
  end
end

