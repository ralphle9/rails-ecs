class CreateViewerWorker
  include Sidekiq::Worker

  def perform(ip)
    puts "<<<<<<<<<I'm in worker>>>>>>>>>"
    Viewer.create(ip_address: ip)
    puts "<<<<<<<<<I'm done in worker>>>>>>>>>"
  end
end
