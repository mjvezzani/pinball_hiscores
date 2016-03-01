class User < ActiveRecord::Base
  has_secure_password
  has_and_belongs_to_many :pins
  has_many :hi_scores
end
