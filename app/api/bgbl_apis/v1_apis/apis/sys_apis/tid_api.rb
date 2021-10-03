module BGBLAPIs::V1APIs::APIs::SysAPIs
  # スレッドID
  class TIDAPI < BGBLAPIs::V1APIs::APIs::Base
    desc 'TIDを取得', entity: BGBLAPIs::V1APIs::Entities::Common::Value
    get do
      res = { value: Thread.current.object_id }
      present res, with: BGBLAPIs::V1APIs::Entities::Common::Value
    end
  end
end
