module BGBLAPIs::V1APIs::Entities::Common
  # 共通レスポンス型式(任意のString値)
  class Value < BGBLAPIs::V1APIs::Entities::Base
    expose :value, documentation: { type: String, desc: 'レスポンスデータ' }
  end
end
