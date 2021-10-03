module BGBLAPIs::V1APIs::APIs
  # システム関連API
  class SysAPI < BGBLAPIs::V1APIs::APIs::Base
    mount BGBLAPIs::V1APIs::APIs::SysAPIs::PingAPI       => '/ping'
    mount BGBLAPIs::V1APIs::APIs::SysAPIs::PingToAPI     => '/ping-to'
    mount BGBLAPIs::V1APIs::APIs::SysAPIs::PingToHTTPAPI => '/ping-to-http'
    mount BGBLAPIs::V1APIs::APIs::SysAPIs::HealthAPI     => '/health'
    mount BGBLAPIs::V1APIs::APIs::SysAPIs::PIDAPI        => '/pid'
    mount BGBLAPIs::V1APIs::APIs::SysAPIs::TIDAPI        => '/tid'
    mount BGBLAPIs::V1APIs::APIs::SysAPIs::MemoryAPI     => '/mem'
    mount BGBLAPIs::V1APIs::APIs::SysAPIs::TimeAPI       => '/time'
    mount BGBLAPIs::V1APIs::APIs::SysAPIs::IPAPI         => '/ip'
    mount BGBLAPIs::V1APIs::APIs::SysAPIs::RubyInfoAPI   => '/ruby-info'
  end
end
