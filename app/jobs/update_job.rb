class UpdateJob
  include Sidekiq::Job

  def perform(id, params)
    Proponent.find(id).update_columns(params)
  end
end

