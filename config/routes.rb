Rails.application.routes.draw do
  scope ENV.fetch('BGBL_APP_MOUNT_PATH', '') do
    mount BGBLAPI                   => '/api'
    mount GrapeSwaggerRails::Engine => '/docs'
  end
end
