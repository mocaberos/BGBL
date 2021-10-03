require 'objspace'

module BGBLAPIs::V1APIs::APIs::SysAPIs
  # メモリ管理
  class MemoryAPI < BGBLAPIs::V1APIs::APIs::Base
    desc 'メモリ使用量を取得', entity: BGBLAPIs::V1APIs::Entities::Common::Value
    get do
      res = { value: ObjectSpace.memsize_of_all }
      present res, with: BGBLAPIs::V1APIs::Entities::Common::Value
    end
  end
end
