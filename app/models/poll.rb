class Poll < ActiveRecord::Base
  has_many :options, dependent: :destroy
  accepts_nested_attributes_for :options, :allow_destroy => true, :reject_if => proc { |option| option['name'].blank? }


  validates :name, presence: true, length: { minimum: 4 }
end
