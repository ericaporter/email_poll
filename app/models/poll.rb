class Poll < ActiveRecord::Base
  has_many :options
end
