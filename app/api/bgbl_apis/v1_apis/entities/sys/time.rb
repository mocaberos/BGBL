module BGBLAPIs::V1APIs::Entities::Sys
  # サーバー時間
  class Time < BGBLAPIs::V1APIs::Entities::Base
    expose :zone, documentation: { type: String, desc: 'タイムゾーン' }
    expose :time, documentation: { type: String, desc: 'サーバー時間' }
  end
end
