class RoomsController < ApplicationController
  def index
    @current_user = current_user
    redirect_to '/signin' unless @current_user
    @room = Room.new
    @rooms = Room.all
    @users = User.all_except(@current_user)
    @single_room = Room.first
    @message = Message.new
    @messages = @single_room.messages
  end

  def create
    @room = Room.create(name: params["room"]["name"])
  end
end
