# :nocov:
namespace :routes do
  desc 'GrapeAPIのルーターリストを表示する'
  task api: :environment do
    Grape::API.subclasses.each do |subclass|
      next if subclass.to_s != 'BGBLAPI'

      subclass.routes.each do |e|
        puts format(
          '%<method>-6s %<path>-24s %<desc>s',
          method: e.request_method,
          path:   e.path,
          desc:   e.description
        )
      end
    end
  end
end
# :nocov:
