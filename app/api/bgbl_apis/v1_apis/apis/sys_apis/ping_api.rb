module BGBLAPIs::V1APIs::APIs::SysAPIs
  # Ping
  class PingAPI < BGBLAPIs::V1APIs::APIs::Base
    desc 'サーバーとの疎通確認用', entity: BGBLAPIs::V1APIs::Entities::Common::Message
    get do
      res = { message: 'Success!' }
      present res, with: BGBLAPIs::V1APIs::Entities::Common::Message
    end
  end
end
