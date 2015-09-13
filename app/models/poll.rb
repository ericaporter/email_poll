class Poll < ActiveRecord::Base
  has_many :options

  validates :name, presence: true, length: { minimum: 2 }
end
