module BGBLAPIs::V1APIs::APIs::SysAPIs
  # プロセスID
  class PIDAPI < BGBLAPIs::V1APIs::APIs::Base
    desc 'PIDを取得', entity: BGBLAPIs::V1APIs::Entities::Common::Value
    get do
      res = { value: Process.pid }
      present res, with: BGBLAPIs::V1APIs::Entities::Common::Value
    end
  end
end
