module BGBLAPIs::V1APIs::APIs
  # ゲーム機能の実装
  class GameAPI < BGBLAPIs::V1APIs::APIs::Base
    desc 'ゲームを開始するため、新しいルームを生成する', entity: BGBLAPIs::V1APIs::Entities::Game::RoomId
    params do
      requires :master_user, type: String, allow_blank: false, desc: 'マスターユーザー名'
    end
    post :new do
      res = {
        id: Room.open_new_room(params[:master_user])
      }
      present res, with: BGBLAPIs::V1APIs::Entities::Game::RoomId
    end

    desc 'ユーザーをルームに追加する', entity: BGBLAPIs::V1APIs::Entities::Common::Message
    params do
      requires :room_id,   type: String, allow_blank: false, desc: 'ルームID'
      requires :user_name, type: String, allow_blank: false, desc: 'ユーザー名'
    end
    post :add do
      Room.add_new_user(params[:room_id], params[:user_name])
      res = { message: 'Success' }
      present res, with: BGBLAPIs::V1APIs::Entities::Common::Message
    end

    desc '指定ユーザーのカードをオープン', entity: BGBLAPIs::V1APIs::Entities::Common::Message
    params do
      requires :room_id,   type: String, allow_blank: false, desc: 'ルームID'
      requires :user_name, type: String, allow_blank: false, desc: 'ユーザー名'
    end
    post :open do
      Room.open_card(params[:room_id], params[:user_name])
      res = { message: 'Success' }
      present res, with: BGBLAPIs::V1APIs::Entities::Common::Message
    end

    desc '指定ユーザーのカードを裏返し', entity: BGBLAPIs::V1APIs::Entities::Common::Message
    params do
      requires :room_id,   type: String, allow_blank: false, desc: 'ルームID'
      requires :user_name, type: String, allow_blank: false, desc: 'ユーザー名'
    end
    post :close do
      Room.close_card(params[:room_id], params[:user_name])
      res = { message: 'Success' }
      present res, with: BGBLAPIs::V1APIs::Entities::Common::Message
    end

    desc 'カードをシャッフルする', entity: BGBLAPIs::V1APIs::Entities::Common::Message
    params do
      requires :room_id, type: String, allow_blank: false, desc: 'ルームID'
    end
    post :shuffle do
      Room.shuffle_cards(params[:room_id])
      res = { message: 'Success' }
      present res, with: BGBLAPIs::V1APIs::Entities::Common::Message
    end

    desc 'ゲーム情報を取得する', entity: BGBLAPIs::V1APIs::Entities::Game::GameInfo
    params do
      requires :room_id, type: String, allow_blank: false, desc: 'ルームID'
    end
    post :info do
      res = { users: Room.game_info(params[:room_id]) }
      present res, with: BGBLAPIs::V1APIs::Entities::Game::GameInfo, with_users: true
    end
  end
end
