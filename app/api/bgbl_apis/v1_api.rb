module BGBLAPIs
  class V1API < Grape::API
    mount BGBLAPIs::V1APIs::API => '/v1'
  end
end
