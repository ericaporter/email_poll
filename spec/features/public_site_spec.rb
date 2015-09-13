describe "GET /", :type => :feature do 

  let(:user) { FactoryGirl.create(:user)}
  it "homepage loads" do
    authenticate(user, "password") 
    expect(page).to have_content 'Email Poll'  
  end 
  # the user can create a new poll, then view it
  # log user in
  # click on new poll to create a new poll
  # fill in the information for a new poll
  # click save/submit to create the new poll
  # view the new poll
  
end  