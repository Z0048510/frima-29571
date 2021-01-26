class MessagesController < ApplicationController
  def new
    @messages = Message.all
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      @user_message = Message.joins(:user).select("messages.*, users.*").find(@message.id)
      ActionCable.server.broadcast 'message_channel', content: @user_message
    end
  end

  private

  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, product_id: params[:item_id])
  end

end
