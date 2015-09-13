FactoryGirl.define do 
  factory :poll, class: Poll do 
    name "new_poll"
    options {|p| [p.association(:option_1), p.association(:option_2)]}
  end 


end