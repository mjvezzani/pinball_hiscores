class HighScore < ActiveRecord::Base
  belongs_to :pin, dependent: :destroy
end
