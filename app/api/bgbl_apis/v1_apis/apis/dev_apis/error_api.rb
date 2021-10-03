# :nocov:
module BGBLAPIs::V1APIs::APIs::DevAPIs
  # わざとエラーを起こすAPI
  class ErrorAPI < BGBLAPIs::V1APIs::APIs::Base
    desc '処理中にエラーが発生するAPI', entity: BGBLAPIs::V1APIs::Entities::Common::Message
    get do
      res = { message: (nil + 1).to_s } # NoMethodError: undefined method `+' for nil:NilClass
      present res, with: BGBLAPIs::V1APIs::Entities::Common::Message
    end
  end
end
# :nocov:
