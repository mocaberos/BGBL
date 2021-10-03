Rails.application.config.assets.precompile += %w[
  grape_swagger_rails/application.js
  grape_swagger_rails/application.css
]
GrapeSwaggerRails.options.app_name = 'BGBL Swagger'
GrapeSwaggerRails.options.url      = "/#{ENV.fetch('BGBL_APP_MOUNT_PATH', '')}/api/v1/swagger_doc"
GrapeSwaggerRails.options.before_action do |request|
  GrapeSwaggerRails.options.app_url = request.protocol + request.host_with_port
end
