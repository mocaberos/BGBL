module BGBLAPIs::V1APIs::Entities::Game
  # ルームID
  class RoomId < BGBLAPIs::V1APIs::Entities::Base
    expose :id, documentation: { type: String, desc: 'ルームID' }
  end
end
