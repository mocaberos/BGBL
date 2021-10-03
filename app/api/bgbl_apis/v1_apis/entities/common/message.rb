module BGBLAPIs::V1APIs::Entities::Common
  # 共通レスポンス型式(任意のStringメッセージ)
  class Message < BGBLAPIs::V1APIs::Entities::Base
    expose :message, documentation: { type: String, desc: 'メッセージ' }
  end
end
