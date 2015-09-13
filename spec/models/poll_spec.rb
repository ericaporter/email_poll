require 'spec_helper'

describe Poll do 
  
  let(:poll) { FactoryGirl.create(:poll)}

  the "poll class exist" do
    expect(poll).to be_a Poll          
  end


  the "poll has 2 options from factory" do
    expect(poll.options.count).to eq(2)
  end 
end  