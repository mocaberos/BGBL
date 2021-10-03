module BGBLAPIs::V1APIs
  # API
  class API < Grape::API
    mount BGBLAPIs::V1APIs::APIs::DevAPI   => '/dev' if ENV.fetch('BGBL_MOUNT_DEV', 'false').casecmp('true').zero?
    mount BGBLAPIs::V1APIs::APIs::SysAPI   => '/sys'
    mount BGBLAPIs::V1APIs::APIs::GameAPI  => '/game'

    add_swagger_documentation(
      base_path: "/#{ENV.fetch('BGBL_APP_MOUNT_PATH', '')}/api/v1",
      info:      {
        title: 'BGBL API V1 Documentation'
      },
      tags:      [
        { name: 'dev',  description: '開発用' },
        { name: 'sys',  description: 'システム関連' },
        { name: 'game', description: 'ゲーム機能の実装' }
      ]
    )
  end
end
