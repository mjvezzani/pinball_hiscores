class Table < ActiveRecord::Base
  has_many :high_scores
  has_and_belongs_to_many :users
end
