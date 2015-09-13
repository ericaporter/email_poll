FactoryGirl.define do 
  factory :user, class: User do
    first_name "Erica"
    last_name "Porter"
    email "erica@email.com"
    password "password"
    password_confirmation "password"
  end

end