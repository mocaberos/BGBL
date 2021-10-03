# :nocov:
module BGBLAPIs::V1APIs::APIs::DevAPIs
  # 指定秒数スリープするAPI
  class SleepAPI < BGBLAPIs::V1APIs::APIs::Base
    desc '指定秒数スリープする', entity: BGBLAPIs::V1APIs::Entities::Common::Message
    params do
      optional :time, type: Integer, desc: '指定秒数スリープする'
    end
    get do
      sleep(params[:time]) if params[:time]
      res = { message: 'Success!' }
      present res, with: BGBLAPIs::V1APIs::Entities::Common::Message
    end
  end
end
# :nocov:
