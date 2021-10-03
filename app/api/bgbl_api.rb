# BGBL API
class BGBLAPI < Grape::API
  format :json

  before do
    header 'Service-Name', 'BGBL'
  end

  rescue_from Grape::Exceptions::Base do |e|
    error!(e.message, 400)
  end

  rescue_from :all do |e|
    MocaRlibs::SlackNotifier.error(e, channel: '#error_alert') if Rails.env.production?
    error!({ error: e.message, backtrace: e.backtrace[0] }, 500)
  end

  mount BGBLAPIs::V1API
end
