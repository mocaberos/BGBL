# :nocov:
namespace :db do
  desc 'データベースの存在チェック'
  task exists: :environment do
    ActiveRecord::Base.connection
  rescue ActiveRecord::ConnectionNotEstablished, ActiveRecord::NoDatabaseError
    exit 1
  else
    exit 0
  end
end
# :nocov:
