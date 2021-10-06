# ボードゲームのルーム
class Room < ApplicationRecord
  validates :user_name,   uniqueness: { scope: :room_id }
  validates :room_id,     presence: true
  validates :user_name,   presence: true
  validates :card_number, presence: true

  class << self
    # 新しいルームを開く
    # @param  [String] master_name マスターユーザーの名前
    # @return [String] ルームID
    def open_new_room(master_name)
      room_id = SecureRandom.uuid
      Room.new(room_id: room_id, user_name: master_name, card_number: 0, show: false, master: true).save!
      room_id
    end

    # 新しいユーザーをルームに追加する
    # @param [String] room_id 　ルームID
    # @param [String] user_name ユーザーの名前
    def add_new_user(room_id, user_name)
      Room.new(room_id: room_id, user_name: user_name, card_number: 0, show: false, master: false).save!
    end

    # 指定ユーザーのカードをオープン
    # @param [String] room_id 　ルームID
    # @param [String] user_name ユーザーの名前
    def open_card(room_id, user_name)
      target = Room.find_by(room_id: room_id, user_name: user_name)
      target.show = true
      target.save!
    end

    # 指定ユーザーのカードを裏返しにする
    # @param [String] room_id 　ルームID
    # @param [String] user_name ユーザーの名前
    def close_card(room_id, user_name)
      target = Room.find_by(room_id: room_id, user_name: user_name)
      target.show = false
      target.save!
    end

    # 指定したルームのゲーム状況を取得
    # @param  [String] room_id ルームID
    # @return [Array] ゲーム状況
    def game_info(room_id)
      Room.where(room_id: room_id).order(id: :asc).map do |user|
        {
          user_name:   user.user_name,
          card_number: user.card_number,
          show:        user.show,
          master:      user.master
        }
      end
    end

    # カードをシャッフルする
    # @param [String] room_id ルームID
    def shuffle_cards(room_id)
      Room.where(room_id: room_id).find_each do |user|
        user.card_number = rand(101)
        user.show = false
        user.save!
      end
    end
  end
end
