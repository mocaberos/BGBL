# :nocov:
module BGBLAPIs::V1APIs::APIs::DevAPIs
  # 開発用
  class DevAPI < BGBLAPIs::V1APIs::APIs::Base
    desc '開発用', entity: BGBLAPIs::V1APIs::Entities::Common::Message
    get do
      res = { message: 'Success!' }
      present res, with: BGBLAPIs::V1APIs::Entities::Common::Message
    end
  end
end
# :nocov:
