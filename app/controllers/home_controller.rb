require 'mailgun'
class HomeController < ApplicationController
  def index
  end
  #email
  def write
    @name = params[:name]
    @email = params[:email]
    @content = params[:content]
    @phone = params[:phone]
    mg_client = Mailgun::Client.new("key-ac89645311d8534bb27750e824ad715a")

    message_params =  {
                   from: @email,
                   to:   'duanea0606@gmail.com',
                   subject: @name,
                   text:    @content
                  }

                  result = mg_client.send_message('sandbox165c26fd72294c21b95418c845d11557.mailgun.org', message_params).to_h!

                  message_id = result['id']
                  message = result['message']

            redirect_to "/"
  end


  def about
  end
  def product
    @posts = Post.all
  end
  def board

      post = Post.new
      post.title = params[:title]
      post.content = params[:content]
      post.save

      redirect_to "/home/product#chat-section"
  end
  def reply_board

      reply = Reply.new
      reply.content = params[:content]
      reply.post_id = params[:id_of_post]
      reply.save

      redirect_to "/home/product#chat-section"
  end

  def index_vn
  end
  def about_vn
  end
  def product_vn
  end
