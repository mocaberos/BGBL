module BGBLAPIs::V1APIs::APIs
  # 開発用機能
  class DevAPI < BGBLAPIs::V1APIs::APIs::Base
    mount BGBLAPIs::V1APIs::APIs::DevAPIs::DevAPI   => '/dev'
    mount BGBLAPIs::V1APIs::APIs::DevAPIs::SleepAPI => '/sleep'
    mount BGBLAPIs::V1APIs::APIs::DevAPIs::ErrorAPI => '/error'
  end
end
