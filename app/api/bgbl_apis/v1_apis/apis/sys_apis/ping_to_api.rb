module BGBLAPIs::V1APIs::APIs::SysAPIs
  # Ping
  class PingToAPI < BGBLAPIs::V1APIs::APIs::Base
    desc 'サーバーから疎通確認を送信する', entity: BGBLAPIs::V1APIs::Entities::Common::Message
    params do
      requires :target, type: String, desc: '送信先アドレス'
    end
    get do
      res = { message: Net::Ping::External.new(params[:target]).ping? ? 'reachable' : 'unreachable' }
      present res, with: BGBLAPIs::V1APIs::Entities::Common::Message
    end
  end
end
