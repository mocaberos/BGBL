# 基底クラス ApplicationRecord
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
