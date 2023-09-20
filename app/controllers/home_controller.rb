class HomeController < ApplicationController
  def index
    puts "---------I'm in index action----------"

    ip_address = request.remote_ip
    CreateViewerWorker.perform_async(ip_address)

    @viewers = Viewer.last(5)

    puts "---------I'm done in index action----------"
  end
end
