class IncrementCountWorker
  include Sidekiq::Worker

  def perform(post_id)
    puts "----------- #{post_id} -------"
    post = Post.find(post_id)

    post.likes_count ||= 0
    post.likes_count += 1
    puts "-------- #{post.likes_count} ---------"
    post.save
    puts "-------- #{post.errors.full_messages} ---------"
  end
end
