describe "poll", :type => :feature do 

  let(:user) { FactoryGirl.create(:user)}
  the "user can create a new poll and view it" do
    # log user in
    authenticate(user, "password")
    # click on new poll to create a new poll
    click_link("New Poll")
    # fill in the information for a new poll

    # click save/submit to create the new poll
    # view the new poll
    # expect the poll name to be on the page

  end
     
  
  
end  