class Pin < ActiveRecord::Base
  has_many :hi_scores
  has_and_belongs_to_many :users
end
