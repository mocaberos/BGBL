module BGBLAPIs::V1APIs::APIs::SysAPIs
  # IP取得
  class IPAPI < BGBLAPIs::V1APIs::APIs::Base
    desc 'サーバーが認識しているクライアントIPを取得', entity: BGBLAPIs::V1APIs::Entities::Common::Message
    get do
      res = { message: request.ip.to_s }
      present res, with: BGBLAPIs::V1APIs::Entities::Common::Message
    end
  end
end
