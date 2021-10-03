module BGBLAPIs::V1APIs::APIs::SysAPIs
  # サーバー時間取得
  class TimeAPI < BGBLAPIs::V1APIs::APIs::Base
    desc 'サーバー時間取得', entity: BGBLAPIs::V1APIs::Entities::Sys::Time
    get do
      res = { zone: Time.zone.name, time: Time.zone.now }
      present res, with: BGBLAPIs::V1APIs::Entities::Sys::Time
    end
  end
end
