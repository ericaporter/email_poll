describe "poll", :type => :feature do 

  before :each do
    # log user in
    authenticate(user, "password")
  end 


  let(:user) { FactoryGirl.create(:user)}
  the "user can create a new poll and view it" do
    # click on new poll to create a new poll
    click_link("New Poll")
    # fill in the information for a new poll
    fill_in "poll_name", with: "new poll"
    #fill in options limit to 15min
    #fill_in "poll_options_1", with: "Cheese"
    # click save/submit to create the new poll
    click_button "Create Poll"

    # expect the poll name to be on the page
    expect(page).to have_content "new poll"
  end  
  the "user can edit a failed form" do
    # click on new poll to create a new poll
    click_link("New Poll")
    # fill in the information for a new poll
    fill_in "poll_name", with: "new"

    # click save/submit to create the new poll
    click_button "Create Poll"

    #check that error messages are showing
    # expect(page).to have_content "can't be blank"
    expect(page).to have_css('.error')
  end  
end  