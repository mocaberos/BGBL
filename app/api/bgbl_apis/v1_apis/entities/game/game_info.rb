module BGBLAPIs::V1APIs::Entities::Game
  # ルーム全体のゲーム状況
  class GameInfo < BGBLAPIs::V1APIs::Entities::Base
    expose :users, with: BGBLAPIs::V1APIs::Entities::Game::UserInfo
  end
end
