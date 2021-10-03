module BGBLAPIs::V1APIs::APIs::SysAPIs
  # 正常性確認
  class HealthAPI < BGBLAPIs::V1APIs::APIs::Base
    desc '正常性確認'
    get do
      ActiveRecord::Base.connection.select_one('select 1') # データベース接続確認
      Redis.current.ping # Redis接続確認
      status 200
      nil
    rescue StandardError => e
      status 500
      e.to_s
    end
  end
end
