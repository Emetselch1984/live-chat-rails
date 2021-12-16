class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:index,:show]

  def index
    messages = Message.all
    messages_array = messages.map do |message|
      {
          id: message.id,
          user_id: message.user.id,
          name: message.user.name,
          content: message.content,
          email: message.user.email,
          created_at: message.created_at,
          likes: message.likes.map {|like|{id: like.id,email: like.user.email}}
      }
    end
    render json: messages_array, status: 200
  end
  def show
    message = Message.find_by(params[:id])
    message_array = [
        {
            id: message.id,
            user_id: message.user.id,
            name: message.user.name,
            content: message.content,
            email: message.user.email,
            created_at: message.created_at,
            likes: message.likes.map {|like|{id: like.id,email: like.user.email}}
        }
    ]
    render json: message_array,status: 200
  end


end
