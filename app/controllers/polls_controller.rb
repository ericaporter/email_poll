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
    @polls = Poll.new
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
  end

private 
  def poll_params
      params.required(:poll).permit(:name)
  end


end