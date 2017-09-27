class MessagesController < ApplicationController
  respond_to :html, :js
  before_action :set_blog
  # POST /messages
  # POST /messages.json
  def create
    params[:message][:author_id] = current_user.id
    @message = @blog.messages.create(message_params)
    @messages = @blog.messages
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:comment, :author_id)
    end

    def set_blog
      @blog = Blog.find(params[:blog_id])
    end
end
