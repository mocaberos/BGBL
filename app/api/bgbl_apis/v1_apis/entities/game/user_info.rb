module BGBLAPIs::V1APIs::Entities::Game
  # ユーザーのゲーム状況
  class UserInfo < BGBLAPIs::V1APIs::Entities::Base
    expose :user_name,   documentation: { type: String,    desc: 'ユーザー名' }
    expose :card_number, documentation: { type: Integer,   desc: 'カード番号' }
    expose :show,        documentation: { type: 'Boolean', desc: 'カード状態' }
    expose :master,      documentation: { type: 'Boolean', desc: 'マスターユーザーかどうか' }
  end
end
