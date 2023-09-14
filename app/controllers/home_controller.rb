class HomeController < ApplicationController
  def index
    puts "I'm in index page"
    @message = "Dynamic"

    @posts = Post.all
  end

  def increment_async
    begin
      puts "I'm in increment method"
      puts '----------------------------------------------------------------'
      ::IncrementCountWorker.perform_async(params[:post_id])
      puts "I'm done call workers"
      puts '----------------------------------------------------------------'

      redirect_to root_path
    rescue Exception => e
      puts 'We got this Sidekiq error'
      p e   
      puts '------------------------------------------------'
    end
  end
end
