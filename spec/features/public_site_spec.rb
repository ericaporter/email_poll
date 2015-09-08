describe "GET /", :type => :feature do 

  before(:each) do
    visit root_path
  end
   
  it "homepage loads" do
    expect(page).to have_content 'Email Poll'  
  end 
end  