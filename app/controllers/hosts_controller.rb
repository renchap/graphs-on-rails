class HostsController < ApplicationController
  def index
    @hosts = Host.find(:all, :order => 'name ASC')
    @page_title = "Hosts"
  end
  
  def show
    @host = Host.from_param(params[:id])
  end
end
