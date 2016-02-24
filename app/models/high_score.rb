class HighScore < ActiveRecord::Base
  belongs_to :table, dependent: :destroy
end
