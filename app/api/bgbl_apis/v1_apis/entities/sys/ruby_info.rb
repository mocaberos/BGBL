module BGBLAPIs::V1APIs::Entities::Sys
  # Rubyの情報
  class RubyInfo < BGBLAPIs::V1APIs::Entities::Base
    expose :version,      documentation: { type: String, desc: 'バージョン' }
    expose :release_date, documentation: { type: String, desc: 'リリース時期' }
    expose :platform,     documentation: { type: String, desc: 'プラットフォーム' }
    expose :engine,       documentation: { type: String, desc: 'エンジン' }
    expose :description,  documentation: { type: String, desc: '説明' }
  end
end
