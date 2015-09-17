class PollsController < ApplicationController
  #all of the polls
  def index
    @polls = Poll.all
  end 

  def show
    @poll = Poll.find(params[:id])
  end
  
  #edit
  def edit
  end
  def update
  end

  #new
  def new
    @poll = Poll.new
  end
  def create
    @poll = Poll.new(poll_params)

    if @poll.save
       redirect_to @poll
    else
      render 'new'
    end

  end

  #CRUD Create, Read, Update, Destroy
 
  def destroy
    @poll = Poll.find(params[:id])
    @poll.destroy

    redirect_to polls_path
  end

private 
  def poll_params
    params.required(:poll).permit(:name, options_attributes: [:name, :_destroy])
  end


end
