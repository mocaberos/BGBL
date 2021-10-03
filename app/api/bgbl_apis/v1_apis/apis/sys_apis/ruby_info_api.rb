module BGBLAPIs::V1APIs::APIs::SysAPIs
  # 実行環境の状態を取得
  class RubyInfoAPI < BGBLAPIs::V1APIs::APIs::Base
    desc '使用中のRubyの情報を取得', entity: BGBLAPIs::V1APIs::Entities::Sys::RubyInfo
    get do
      res = {
        version:      RUBY_VERSION,
        release_date: RUBY_RELEASE_DATE,
        platform:     RUBY_PLATFORM,
        engine:       RUBY_ENGINE,
        description:  RUBY_DESCRIPTION
      }
      present res, with: BGBLAPIs::V1APIs::Entities::Sys::RubyInfo
    end
  end
end
